import 'package:currency_app/theme/paths/image_paths.dart';
import 'package:currency_app/theme/styles/colors.dart';
import 'package:currency_app/theme/styles/text_style.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../../theme/paths/routes.dart';

class VerificationPage extends StatefulWidget {
  const VerificationPage({Key? key}) : super(key: key);

  @override
  _VerificationPageState createState() => _VerificationPageState();
}

class _VerificationPageState extends State<VerificationPage> {
   String? currentText;
  TextEditingController pinController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 50.0,),
              Center(child: Image.asset(ImageManger.emailImage,height: 200,fit: BoxFit.contain,)),
              _title(),
              SizedBox(height: 40.0,),
              _pinCode(context: context),
              _confirmButton()
            ],
          ),
        ),
      ),
    ));
  }
   Widget _confirmButton(){
     return Container(
         margin: const EdgeInsets.symmetric(horizontal: 18.0),
         height: 45.0,
         width: double.infinity,
         decoration: BoxDecoration(
           color: currentText == null || currentText!.length > 4? ColorManger.greyColor : ColorManger.primary,
           borderRadius: BorderRadius.circular(8.0),
         ),
         child: MaterialButton(
           onPressed: (){
             Navigator.pushNamed(context, Routes.layout);
           },
           child: Text("واصل",style: TextModelStyle.blackColor14BoldStyle(),),
         )
     );
   }

   Widget _title(){
    return Column(
      children: [
        Text("قم بتأكيد بريدك الألكتروني",style: TextModelStyle.blackColor20BoldStyle(),),
        const SizedBox(height: 5,),
        Text(
          "الرجاء إدخال الرمز المكون من 4 أرقام المرسل إلى البريد الإلكتروني",
          textAlign: TextAlign.center,
          textDirection:TextDirection.rtl,
          style:TextModelStyle.black2Color14MediumStyle(),
        )
      ],
    );
  }

  Widget _pinCode({required BuildContext context}){
    return Container(
padding: const EdgeInsets.symmetric(horizontal: 32.0),
        child: PinCodeTextField(
        length: 4,
        obscureText: false,
        pinTheme: PinTheme(
            borderRadius: BorderRadius.circular(5),
            fieldHeight: 50,
            fieldWidth: 40,
            activeFillColor: ColorManger.lightYellow,
          activeColor: ColorManger.primary,
          disabledColor: ColorManger.primary,
          errorBorderColor: ColorManger.redColor2,
          inactiveColor: ColorManger.primary,
          inactiveFillColor: ColorManger.primary,
          selectedColor: ColorManger.primary,
          selectedFillColor: ColorManger.primary
        ),
          // backgroundColor: ColorManger.primary,

          cursorColor: ColorManger.primary,
          enableActiveFill: true,
        animationType: AnimationType.fade,
        controller: pinController,
        animationDuration: Duration(milliseconds: 300),
        enablePinAutofill: true,
        appContext: context,
          onChanged: (value) {
            print(value);
            setState(() {
              currentText = value;
            });
          },
    ),
      );
  }
}
