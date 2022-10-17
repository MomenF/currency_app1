import 'package:currency_app/theme/paths/icons_path.dart';
import 'package:currency_app/theme/styles/colors.dart';
import 'package:currency_app/theme/styles/text_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart';
import '../../../../core/app.g.dart';
import '../../../../theme/paths/routes.dart';
import '../../data/model/register_model.dart';
import '../../data/web_services/auth.dart';
import 'package:get/get.dart';
class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool showPassword = true;
  String? dataField;
  final _formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController rePasswordController = TextEditingController();
  AuthServices authServices = AuthServices();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: _appBar(),
        body: Container(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                _title(),
                _registerFields(),
                _termsAndServices(),
                SizedBox(
                  height: 24.0,
                ),
                _signUpButton(),
                _loginBack()
              ],
            ),
          ),
        ),
      ),
    );
  }

  AppBar _appBar() {
    return AppBar(
      backgroundColor: ColorManger.whiteColor,
      elevation: 0,
      centerTitle: true,
      title: Center(
        child: Transform.translate(
          offset: Offset(-25, 0),
          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text(
              "Exchange"+" "+"هسه",
              style: TextModelStyle.primary20BoldStyle(),
            )
          ]),
        ),
      ),
    );
  }

  Widget _title() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "أنشئ حسابك",
            style: TextModelStyle.blackColor20BoldStyle(),
          ),
          SizedBox(
            height: 8.0,
          ),
          Text(
            "بدا تجربة خدماتنا المميزة هسة",
            style: TextModelStyle.greyColor312BoldStyle(),
          ),
        ],
      ),
    );
  }

  Widget _loginBack() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton(
            onPressed: () {
              Navigator.pushNamed(context, Routes.login);
            },
            child: Text(
              "تسجيل الدخول",
              style: TextModelStyle.primary14BoldStyle(),
            )),
        Text(
          "هل لديك حساب ؟",
          style: TextModelStyle.greyColor314BoldStyle(),
        ),
      ],
    );
  }

  Widget _termsAndServices() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Center(
        child: RichText(
          textAlign: TextAlign.left,
          textDirection: TextDirection.rtl,
          text: TextSpan(
              style: TextModelStyle.greyColor312BoldStyle(),
              text: "بالتسجيل فإنك تقبل",
              children: [
                TextSpan(
                  text: " شروط الخدمة",
                  style: TextModelStyle.primary12BoldStyle(),
                ),
                TextSpan(
                    text: " و", style: TextModelStyle.greyColor312BoldStyle()),
                TextSpan(
                    text: " سياسة الخصوصية",
                    style: TextModelStyle.primary12BoldStyle()),
              ]),
        ),
      ),
    );
  }

  Widget _signUpButton() {
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 18.0),
        height: 45.0,
        width: double.infinity,
        decoration: BoxDecoration(
          color: ColorManger.primary,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: MaterialButton(
          onPressed: () async {
            //Navigator.pushNamed(context, Routes.verificationPage);
            authStatus status =  await  authServices.postRegisterUserApi(RegisterModel(
              firstName:nameController.text,
               lastName: nameController.text,
               email: emailController.text.trim(),
               phone: phoneController.text.trim(),
               password: passwordController.text,
               rePassword: rePasswordController.text
            ));
          switch(status){
            case authStatus.success:
            Get.showSnackbar(GetSnackBar(
            backgroundColor: ColorManger.primary,
              titleText:Text("Congratulation") ,
              messageText: Text("Register is completed successfully") ,
            ));
              break;
            case authStatus.field:
              // TODO: Handle this case.
              break;
          }
          },
          child: Text(
            "اشتراك",
            style: TextModelStyle.blackColor14BoldStyle(),
          ),
        ));
  }

  Widget _registerFields() {
    return Form(
        key: _formKey,
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 40.0,
        ),
        _commonField(
          dataField: me!.fullName,
          title: "الاسم الكامل",
          textEditingController: nameController,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'لا يمكن ترك هذا الحقل فارغ';
            }
            return null;
          },
          textInputType: TextInputType.name,
        ),
        SizedBox(
          height: 12.0,
        ),
        _commonField(
          dataField: me!.email,
          textEditingController: emailController,
          title: "البريد الإلكتروني",
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'لا يمكن ترك هذا الحقل فارغ';
            }else if(isEmail(value)==false){
              return 'الايمل المدخل غير صالح';
            }
            return null;
          },
          textInputType: TextInputType.emailAddress,
        ),
        SizedBox(
          height: 12.0,
        ),
        _commonField(
          dataField: me!.phone,
          textEditingController: phoneController,
          title: "هاتف",
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'لا يمكن ترك هذا الحقل فارغ';
            }else if(value.length<11){
              return 'رقم الهاتف المدخل غير صحيح';
            }
            return null;
          },
          textInputType: TextInputType.phone,
        ),
        SizedBox(
          height: 12.0,
        ),
        _commonField(
            dataField: me!.password,
            textEditingController: passwordController,
            title: "كلمة المرور",
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'لا يمكن ترك هذا الحقل فارغ';
              }else if(value.length<8){
                return 'كلمة المرور يجب ان تكون اكبر من 8 حروف او ارقام';
              }
              return null;
            },
            textInputType: TextInputType.text,
            isPassword: true),
        SizedBox(
          height: 12.0,
        ),
        _commonField(
            dataField: me!.password,
            textEditingController: rePasswordController,
            title: "اعادة كلمة المرور",
            textInputType: TextInputType.text,
            validator: (value) {
              if (value == null || value.isEmpty || rePasswordController.text!=passwordController.text) {
                return 'كلمة المرور غير مطابقه';
              }else if(value.length<8){
                return 'كلمة المرور يجب ان تكون اكبر من 8 حروف او ارقام';
              }
              return null;
            },
            isPassword: true),
        SizedBox(
          height: 12.0,
        )
      ],
    ));
  }

  Widget _commonField(
      {required String? dataField,
      required TextInputType textInputType,
      bool isPassword = false,
      required TextEditingController textEditingController,
      String? Function(String?)? validator,
      required String title}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          title,
          style: TextModelStyle.greyColor314BoldStyle(),
          textAlign: TextAlign.right,
        ),
        TextFormField(
          keyboardType: textInputType,
          validator: validator,
          controller: textEditingController,
          onChanged: (value) {
            dataField = value;
            print("dataField = $dataField");
          },
          obscureText: isPassword
              ? showPassword
                  ? true
                  : false
              : false,
          decoration: InputDecoration(
              fillColor: ColorManger.whiteColor2,
              filled: true,
              hintText: "",
              border: outBoard,
              focusedBorder: outBoard,
              enabledBorder: outBoard,
              errorBorder: outBoard,
              disabledBorder: outBoard,
              suffixIcon: isPassword
                  ? IconButton(
                      onPressed: () {
                        setState(() {
                          showPassword = !showPassword;
                        });
                      },
                      icon: Icon(showPassword
                          ? Icons.visibility
                          : Icons.visibility_off))
                  : null),
        ),
      ],
    );
  }
  bool isEmail(String em) {
    String p = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

    RegExp regExp = new RegExp(p);

    return regExp.hasMatch(em);
  }
}
