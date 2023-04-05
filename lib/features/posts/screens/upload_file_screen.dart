import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:untitled/features/posts/controller/upload_file.dart';
import 'package:untitled/features/video/orientation/portrait_player_widget.dart';

import 'upload_text_screen copy.dart';

class UploadFileScreen extends ConsumerStatefulWidget {
  // const UploadFileScreen({super.key});
  static const String routeName = 'upload-file-screen';
  final FileType type;
  UploadFileScreen({
    Key? key,
    required this.type,
  }) : super(key: key);
  PlatformFile? file;
  File? ifile;

  @override
  ConsumerState<UploadFileScreen> createState() => _UploadFileScreenState();
}

class _UploadFileScreenState extends ConsumerState<UploadFileScreen> {
  @override
  build(BuildContext context) {
    final upload = ref.watch(uploadFileProvider);

    return Scaffold(
      backgroundColor: Colors.grey.withOpacity(0.8),
      body: SafeArea(
        child: Container(
          height: double.maxFinite,
          color: Color(0xFF2e3253).withOpacity(0.4),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  if (upload.getFile() != null)
                    Container(
                      height: 300,
                      child: FileType.video == widget.type
                          ? PortraitPlayerWidget(
                              file: upload.getFile(),
                              type: widget.type,
                            )
                          : Image.file(upload.getFile(), fit: BoxFit.contain),
                    ),
                  InputStyle(context: context),
                  UploadButtonWidget(
                    backgroundcolor: Colors.blue.withOpacity(0.5),
                    text: "Select a file",
                    textColor: Colors.white,
                    onTap: () async {
                      await upload.pickFiles(type: widget.type);
                      setState(() {});
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  UploadButtonWidget(
                    backgroundcolor: Colors.blue.withOpacity(0.5),
                    text: "Upload",
                    textColor: Colors.white,
                    onTap: () async {
                      upload.upload(
                          type: widget.type == FileType.image ? 2 : 3,
                          context: context);
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

Widget InputStyle({BuildContext? context, TextEditingController? controller}) {
  return Container(
      height: 200,
      margin: EdgeInsets.only(top: 0, bottom: 20),
      decoration: BoxDecoration(
        color: Colors.white70,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 4,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: InputUserName(
          hintText: '...', context: context!, controller: controller));
}

//---------------UserNameField--------------
Widget InputUserName(
    {String? hintText,
    required BuildContext context,
    TextEditingController? controller}) {
  return TextFormField(
      style: TextStyle(color: Colors.black),
      maxLines: 5,
      minLines: 1,
      keyboardType: TextInputType.multiline,
      textAlign: TextAlign.right,
      decoration: InputDecoration(
        fillColor: Colors.blue,
        border: InputBorder.none,
        contentPadding: EdgeInsets.only(right: 0, left: 0, bottom: 6, top: 15),
        hintText: hintText,
        suffixText: 'الوصف أو العنوان',
        labelStyle:
            TextStyle(fontSize: 24, color: Colors.black.withOpacity(0.3)),
        hintTextDirection: TextDirection.rtl,
        hintStyle: TextStyle(
          color: Colors.black,
          fontSize: 24,
        ),
        suffixStyle: Theme.of(context)
            .textTheme
            .titleMedium!
            .copyWith(color: Colors.grey),
      ));
}
