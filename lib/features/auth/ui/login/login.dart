import 'package:currency_app/core/controllers/login_controller.dart';
import 'package:currency_app/theme/paths/icons_path.dart';
import 'package:currency_app/theme/paths/routes.dart';
import 'package:currency_app/theme/styles/colors.dart';
import 'package:currency_app/theme/styles/text_style.dart';
import 'package:currency_app/theme/widgets/custom_input.dart';
import 'package:currency_app/theme/widgets/password_input.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../theme/lang.dart';
import '../../data/model/sign_model.dart';
import '../../data/web_services/auth.dart';
import '../../data/web_services/entity/my_custom_response_entity.dart';




class LoginPage extends  GetView<LoginController> {

  LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 40.0),
          child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _title(),
                  Form(
                    key: controller.loginFormKey,
                    child:_loginFields(
                      emailController: controller.emailController,
                      passwordController: controller.passwordController,
                      validator: controller.validator,
                    ),
                  ),
                  const SizedBox(
                    height: 24.0,
                  ),
                  controller.isLoading == false ? _loginButton(
                      onPressed:controller.login,
                  ):_loginButtonDis(),
                  _signUpBack()
                ],
              )),
        ),
      ),
    );;
  }
  Widget _loginButtonDis() {
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 18.0),
        height: 45.0,
        width: double.infinity,
        decoration: BoxDecoration(
          color: ColorManger.primary2,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: MaterialButton(
          onPressed:() async {
            MyCustomResponseEntity status = await AuthCore.signIn(SignInModel(email:  controller.emailController.text.trim(),
            password: controller.passwordController.text
            ));
            switch(status.success){
              case true:
                Get.showSnackbar(GetSnackBar(
                  duration: Duration(seconds: 2),

                  backgroundColor: ColorManger.primary,
                  titleText:Text("Congratulation") ,
                  messageText: Text("Register is completed successfully") ,
                ));
                break;
              case false:
                Get.showSnackbar(GetSnackBar(
                  duration: Duration(seconds: 2),
                  backgroundColor: ColorManger.primary,
                  titleText:Text("Error Occured") ,
                  messageText: Text("${status.errorCode}") ,
                ));
                break;
            }
            Get.toNamed(Routes.layout);
          },
          child: const CircularProgressIndicator(
            color: ColorManger.primary,
          ),
        ));
  }

  Widget _signUpBack() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          Lang.HAVE_ACCOUNT,
          style: TextModelStyle.greyColor314BoldStyle(),
        ),
        TextButton(
            onPressed: () {
              Get.toNamed(Routes.sign_up);
            },
            child: Text(
              Lang.SING_UP,
              style: TextModelStyle.primary14BoldStyle(),
            ))
      ],
    );
  }

  Widget _title() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              Lang.WELECOM_BACK,
              textAlign: TextAlign.right,
              textDirection:TextDirection.rtl,
              style: TextModelStyle.blackColor20BoldStyle(),
            ),
            Image.asset(IconManger.handsIcon)
          ],
        ),
        const SizedBox(
          height: 24.0,
        ),
        Text(
          Lang.WELECOM_MASSAGE,
          textAlign: TextAlign.right,
          textDirection:TextDirection.rtl,
          style: TextModelStyle.black2Color14MediumStyle(),
        )
      ],
    );
  }

  Widget _loginFields({
    required TextEditingController emailController,
    required TextEditingController passwordController,
    required String? Function(String?)? validator,
  }){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        const SizedBox(
          height: 24.0,
        ),
        Text(
          Lang.EMAIL,
          style: TextModelStyle.greyColor314BoldStyle(),
        ),
        CustomInput(
          controller: emailController,
          validator: validator,
        ),
        const SizedBox(
          height: 12.0,
        ),
        Text(
          Lang.PASSWORD,
          style: TextModelStyle.greyColor314BoldStyle(),
        ),
        PasswordInput(
          controller: passwordController,
          validator: validator,
        ),
        _forgetPassword()
      ],
    );
  }

  Widget _forgetPassword() {
    return Row(
      children: [
        TextButton(
            onPressed: () {},
            child: Text(
              Lang.FORGET_PASSWORD,
              textAlign: TextAlign.left,
              style: TextModelStyle.primary14BoldStyle(),
            )),
      ],
    );
  }
  Widget _loginButton({required void Function()? onPressed}) {
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 18.0),
        height: 45.0,
        width: double.infinity,
        decoration: BoxDecoration(
          color: ColorManger.primary,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: MaterialButton(
          onPressed:onPressed,
          child: Text(
            Lang.LOGIN,
            style: TextModelStyle.blackColor14BoldStyle(),
          ),
        ));
  }

}






