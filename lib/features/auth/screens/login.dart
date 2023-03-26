import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:untitled/features/auth/Screens/registration.dart';

//---------------------
class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  static const String routeName = 'login';

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Content(),
      backgroundColor: Colors.white,
    );
  }

  Widget Content() {
    return Column(
      children: [
        LogoSpace(context),
        InputStyle(true, context),
        InputStyle(false, context),
        const SizedBox(
          height: 10,
        ),
        LoginButton(),
        restPasswd(),
        LogupButton(),
      ],
    );
  }

  //--------------LogoSpace--------------------

  // ignore: non_constant_identifier_names
  Widget LogoSpace(context) {
    return KeyboardVisibilityBuilder(builder: (context, isKeyboardVisible) {
      if (!isKeyboardVisible) {
        return Container(
          child: Stack(
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 50),
                height: 220,
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.tealAccent,
                  image: DecorationImage(
                      image: AssetImage('assets/images/pre.png'),
                      fit: BoxFit.fill),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.elliptical(80, 80),
                      bottomRight: Radius.elliptical(80, 80)),
                ),
                child: const Padding(
                  padding: EdgeInsets.only(top: 40.0),
                ),
              ),
            ],
          ),
        );
      } else {
        return Container(
          margin: EdgeInsets.only(top: 40),
          padding: EdgeInsets.only(top: 20),
          height: 150,
          width: 150,
          child: CircleAvatar(
            backgroundColor: Colors.white.withOpacity(0),
            child: Image(
              image: AssetImage('assets/images/logo.png'),
            ),
          ),
        );
      }
    });
  }
}

//---------------InputStyle---------------------
Widget InputStyle(bool whatIs, context) {
  return Container(
    height: 40,
    margin: EdgeInsets.only(right: 35, left: 35, top: 0, bottom: 20),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(20),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.5),
          spreadRadius: 2,
          blurRadius: 4,
          offset: const Offset(0, 3),
        ),
      ],
    ),
    child: (whatIs == true) ? InputUserName() : InputUserPasswd(context),
  );
}

//---------------UserNameField--------------
Widget InputUserName() {
  return const TextField(
    textAlign: TextAlign.right,
    decoration: InputDecoration(
      border: InputBorder.none,
      contentPadding: EdgeInsets.only(right: 0, left: 0, bottom: 6, top: 15),
      suffixIcon:
          Icon(Icons.supervised_user_circle_rounded, color: Colors.black),
      hintText: 'اسم المستخدم',
      hintTextDirection: TextDirection.rtl,
      hintStyle: TextStyle(
        fontSize: 14,
      ),
    ),
  );
}

//---------------UserPassWordField--------------
Widget InputUserPasswd(context) {
  bool _isObsecured = true;
  return TextFormField(
    textAlign: TextAlign.right,
    obscureText: true,
    decoration: InputDecoration(
      border: InputBorder.none,
      contentPadding: EdgeInsets.only(right: 0, left: 0, bottom: 6, top: 15),
      hintText: 'كلمة السر',
      prefixIcon: IconButton(
        icon:
            _isObsecured ? Icon(Icons.visibility) : Icon(Icons.visibility_off),
        onPressed: () {
          //  setState((){
          //   _isObsecured =!_isObsecured;
          // });
        },
      ),
      suffixIcon: Icon(
        Icons.lock,
        color: Colors.black,
      ),
      hintTextDirection: TextDirection.rtl,
      hintMaxLines: 1,
      hintStyle: TextStyle(
        fontSize: 14,
      ),
    ),
  );
}

//---------LoginButt--------

Widget LoginButton() {
  return Container(
    height: 40,
    width: 250,
    decoration: BoxDecoration(
      color: Colors.greenAccent,
      borderRadius: BorderRadius.circular(10.0),
    ),
    child: const TextButton(
      onPressed: (null),
      child: Text(
        'تسجيل الدخول',
        style: TextStyle(
            color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),
      ),
    ),
  );
}

//---------SignupButton-------
Widget LogupButton() {
  return KeyboardVisibilityBuilder(builder: (context, isKeyboardVisible) {
    return Visibility(
      visible: !isKeyboardVisible,
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 40, bottom: 25, right: 20, left: 25),
            child: Divider(
              height: 30,
              color: Colors.blue,
            ),
          ),
          Container(
            height: 40,
            width: 350,
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: TextButton(
              onPressed: () {
                Navigator.of(context)
                    .pushReplacementNamed(Registration.routeName);
              },
              child: Text(
                'إنشاء حساب',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  });
}

//---------ResetPasswordButton
Widget restPasswd() {
  return RichText(
    text: TextSpan(children: [
      const TextSpan(
        text: "هل نسيت كلمة السر ؟",
        style: TextStyle(
          color: Colors.red,
        ),
      ),
      TextSpan(
          text: " اضغط هنا ",
          style: const TextStyle(
            color: Colors.blue,
          ),
          recognizer: TapGestureRecognizer()..onTap = () {})
    ]),
  );
}

  //---------end-------------

