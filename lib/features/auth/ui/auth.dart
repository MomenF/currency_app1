import 'package:currency_app/theme/paths/image_paths.dart';
import 'package:currency_app/theme/styles/colors.dart';
import 'package:currency_app/theme/styles/text_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../theme/paths/routes.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManger.blackColor2,
      body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                _logo(),
                _title(),
                _auth()
              ],
            ),
          ),
        ),

    );
  }

  Widget _logo(){
    return Image.asset(ImageManger.logoImage);
  }
  Widget _title(){
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: 40.0,),
        Text("أنت على بعد خطوات قليلة من تبادل العملات",style: TextModelStyle.whiteColor18BoldStyle(),textAlign: TextAlign.center),
        SizedBox(height: 24.0,),
        Text("إنشاء حساب أو تسجيل الدخول لمتابعة معاملتك",style: TextModelStyle.whiteColor14MediumStyle(),textAlign: TextAlign.center),
      ],
    );
  }

  Widget _auth(){
    return Column(
      children: [
        SizedBox(height: 30.0,),
        Container(
            margin: const EdgeInsets.symmetric(horizontal: 18.0),
          height: 45.0,
          width: double.infinity,
          decoration: BoxDecoration(
            color: ColorManger.primary,
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: MaterialButton(
            onPressed: (){
              Navigator.pushNamed(context, Routes.sign_up);
            },
            child: Text("اشتراك",style: TextModelStyle.blackColor14BoldStyle(),),
          )
        ),
        SizedBox(height: 24.0,),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 18.0),
          height: 45.0,
          width: double.infinity,
          decoration: BoxDecoration(
            color: ColorManger.blackColor2,
            border: Border.all(color: ColorManger.primary,width: 2.0),
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: MaterialButton(
            onPressed: (){
              Navigator.pushNamed(context, Routes.login);
            },
            child: Text("تسجيل الدخول",style: TextModelStyle.primary14BoldStyle(),),
          )
        ),

      ],
    );
  }

}
