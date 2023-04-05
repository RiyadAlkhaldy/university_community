// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:chunked_uploader/chunked_uploader.dart';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final uploadFileProvider = Provider.autoDispose<UploadFileReposetitory>((ref) {
  return UploadFileReposetitory();
});
// final textPostProfider = FutureProvider((ref) async {
//   final up = ref.watch(uploadFileProvider);
//   return up;
// });
final uploadFilePppp = FutureProvider.autoDispose((ref) async {
  final file = ref.watch(uploadFileProvider).getFile();
  return file;
});

class UploadFileReposetitory {
  //this for text post
  final Future<SharedPreferences> _prefs =
      SharedPreferences.getInstance(); // final
//this for upload file
  List<PlatformFile>? paths;
  String? _extension;
  double progress = 0.0;
  String link = '';
  var file;

  getFile() {
    if (paths != null) {
      file = paths!.first;
      final p = file!.path.toString();
      file = File(p);
      return file;
    }
    return null;
  }

  pickFiles({required FileType type}) async {
    // FilePicker.platform.pickFiles()
    try {
      paths = (await FilePicker.platform.pickFiles(
        withReadStream: true,
        type: type,
        allowMultiple: false,
        onFileLoading: (FilePickerStatus status) =>
            print('file status $status'),
        allowedExtensions: (_extension!.isNotEmpty ?? false)
            ? _extension?.replaceAll(' ', '').split(',')
            : null,
      ))
          ?.files;
      if (kDebugMode) {
        // file = paths![0];
      }
    } on PlatformException catch (e) {
      if (kDebugMode) {
        print('Unsupported operation$e');
      }
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
    return paths;
  }

  Future upload(
      {dynamic Function(double)? onUploadProgress,
      String? content,
      int? type,
      BuildContext? context}) async {
    if (paths != null) {
      final prefs = await _prefs;

      var path = paths![0].path!;
      if (kDebugMode) print('path $path');
      String fileName = path.split('/').last;
      if (kDebugMode) print('fileName $fileName');
      String url =
          'http://10.0.2.2:8000/api/v1/file_upload'; // change it with your api url
      ChunkedUploader chunkedUploader = ChunkedUploader(
        Dio(
          BaseOptions(
            baseUrl: url,
            headers: {
              'Content-Type': 'multipart/form-data',
              'Connection': 'Keep-Alive',
              'authorization': 'Bearer ${prefs.getString('token')}',
              "Accept": "application/json"
            },
          ),
        ),
      );
      try {
        Map<String, dynamic> data = {
          'content': content,
          'type': type,
          'user_id': prefs.getString('id'),
          'section_id': prefs.getString('section_id'),
          'colloge_id': prefs.getString('colloge_id'),
        };
        Response? response = await chunkedUploader.upload(
          fileKey: "file",
          method: "POST",
          fileName: path,
          maxChunkSize: 500000000,
          path: url,
          fileSize: paths!.first.size,
          fileDataStream: paths!.single.readStream!,
          data: data,
          onUploadProgress: onUploadProgress,
        );
        Navigator.pop(context!);
        if (kDebugMode) {
          print(response);
        }
      } on DioError catch (e) {
        if (kDebugMode) {
          print(e);
        }
      }
    } else {
      print('Select a file first.');
    }
  }

  // void textPost(
  //     {required String content, required BuildContext context}) async {
  //   final SharedPreferences prefs = await _prefs;
  //   final String url = 'http://10.0.2.2:8000/api/';

  //   final dio = Dio();

  //   Map<String, dynamic> data = {
  //     'content': content,
  //     'type': 1,
  //     'user_id': prefs.getString('id'),
  //     'section_id': prefs.getString('section_id'),
  //     'colloge_id': prefs.getString('colloge_id'),
  //     // 'url': null,
  //   };
  //   Response response;
  //   response = await dio.post(
  //     '${url}posts/store/',
  //     queryParameters: data,
  //     options: Options(
  //       headers: {'authorization': 'Bearer ${prefs.getString('token')}'},
  //     ),
  //   );
  //   print('ok');
  //   print(response.data);
  //   if (response.statusCode == 200) {
  //     Navigator.pop(context);
  //   }
  //   // ignore: use_build_context_synchronously
  // }
}

//////////////////////////////////////////////////////////////////////////////////////////////
///
///
// final uploadFileControllerProvider = Provider((ref) {
//   final uploadFileRepository = ref.watch(uploadFileProvider);
//   return UploadFileController(
//       uploadFileReposetitory: uploadFileRepository, ref: ref);
// });

// class UploadFileController {
//   final UploadFileReposetitory? uploadFileReposetitory;
//   final ProviderRef? ref;
//   UploadFileController({
//     this.uploadFileReposetitory,
//     this.ref,
//   });

//   Future<void> pickeFile({required FileType type}) async {
//     await uploadFileReposetitory!.pickFiles(type: type);
//   }

//   getFile() {
//     return uploadFileReposetitory!.getFile();
//   }

//   uploadFile() async {
//     await uploadFileReposetitory!.upload();
//   }
// }
