import 'package:currency_app/theme/paths/icons_path.dart';
import 'package:currency_app/theme/styles/colors.dart';
import 'package:currency_app/theme/styles/text_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';

import '../../../../core/app.g.dart';
import '../../../../theme/widgets/appbar_widget.dart';

class ExchangePage extends StatefulWidget {
  const ExchangePage({Key? key}) : super(key: key);

  @override
  _ExchangePageState createState() => _ExchangePageState();
}

class _ExchangePageState extends State<ExchangePage> {
  List<Map<String, dynamic>> USD_list = [
    {"NP": "زين كاش", "icon": IconManger.ireland},
    {"NP": "اسيا حولة", "icon": IconManger.asia},
    {"NP": "فاستبي", "icon": IconManger.fastpay},
    {"NP": "ناس واليت", "icon": IconManger.nass},
    {"NP": "كي كارد", "icon": IconManger.keycard},
    {"NP": "الطيف باي", "icon": IconManger.tib},
    {"NP": "بنك العراق الاول", "icon": IconManger.webmoney},
  ];
  List<Map<String, dynamic>> USD_list_Wanted = [
    {"NP": "زين كاش", "icon": IconManger.ireland},
    {"NP": "اسيا حولة", "icon": IconManger.asia},
    {"NP": "فاستبي", "icon": IconManger.fastpay},
    {"NP": "ناس واليت", "icon": IconManger.nass},
    {"NP": "كي كارد", "icon": IconManger.keycard},
    {"NP": "الطيف باي", "icon": IconManger.tib},
    {"NP": "بنك العراق الاول", "icon": IconManger.webmoney}
  ];

  Map<String, dynamic>? currentValue;
  Map<String, dynamic>? currentValueWanted;
  String? amountData;
  String? amountDataWanted;
  String userNumber = "";

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: [
          const AppBarWidget(
            title: "صرف العملات",
          ),
          _bodyExchangeContent(),
        ],
      ),
    );
  }

  Widget dropFieldsDetails({
    required String title,
    required String dataField,
    required String hint,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextModelStyle.greyColor314BoldStyle(),
        ),
        TextField(
          onChanged: (value) {
            dataField = value;
            print("dataField = $dataField");
          },
          keyboardType: TextInputType.number,
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly,
            LengthLimitingTextInputFormatter(7)
          ],
          maxLength: 7,
          decoration: InputDecoration(
            fillColor: ColorManger.whiteColor2,
            filled: true,
            hintText: hint,
            border: outBoard,
            focusedBorder: outBoard,
            enabledBorder: outBoard,
            errorBorder: outBoard,
            disabledBorder: outBoard,
          ),
        ),
      ],
    );
  }

  Widget _bodyExchangeContent() {
    return Container(
      padding: const EdgeInsets.all(12.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            _wantBalance(),
            const SizedBox(
              height: 24.0,
            ),
            _haveBalance(),
            const SizedBox(
              height: 24.0,
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.only(
                  top: 16.0, bottom: 16.0, right: 8.0, left: 18.0),
              decoration: BoxDecoration(
                  gradient: const LinearGradient(colors: [
                    ColorManger.darkColor,
                    ColorManger.blackColor2,
                  ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
                  borderRadius: BorderRadius.circular(10.0)),
              child: Column(
                children: [
                  _sendRate(),
                  const SizedBox(
                    height: 10.0,
                  ),
                  _note("تستغرق هذه العملية من 5 الى 60 دقيقه تلقائيا"),
                  const SizedBox(
                    height: 15.0,
                  ),
                  _note("سعر الصرف في هسة exchange متغير دائماً"),
                  const SizedBox(
                    height: 15.0,
                  ),
                  _note(
                      "اذا كان لديك اسئلة فسوف يجيبك موظف الدعم الفني خلال ساعات العمل من 09:30 الى 18:30 بتوقيت بغداد "),
                  const SizedBox(
                    height: 15.0,
                  ),
                  _note("تحقق بعناية من المعلومات التى ادخلتها"),
                  const SizedBox(
                    height: 15.0,
                  ),
                  _note("KYC"+" "+"بعض التحويلات تحتاج تحقق"),
                ],
              ),
            ),
            const SizedBox(
              height: 24.0,
            ),
            _save()
          ],
        ),
      ),
    );
  }

  Widget _sendRate() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Flexible(
          child: Text(
            "!" + " " + "انتباه",
            style: TextModelStyle.lightYellow12BoldStyle(size: 14),
            textAlign: TextAlign.right,
            textDirection: TextDirection.ltr,
          ),
        ),
        const SizedBox(
          width: 10.0,
        ),
        const Icon(Icons.error_outlined, color: ColorManger.primary),
      ],
    );
  }

  Widget _note(String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Flexible(
          child: Text(
            "$title",
            style: TextModelStyle.lightYellow12BoldStyle(),
            textAlign: TextAlign.right,
            textDirection: TextDirection.ltr,
          ),
        ),
        const SizedBox(
          width: 10.0,
        ),
        const Icon(Icons.remove, color: ColorManger.primary),
      ],
    );
  }

  Widget _haveBalance() {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text("المبلغ",
                  style: TextModelStyle.blackColor11MediumStyle(size: 14)),
              const SizedBox(
                height: 5,
              ),
              _fieldData(dataField: amountData)
            ],
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text("محفظة الاستلام",
                  style: TextModelStyle.blackColor11MediumStyle(size: 14)),
              _dropDownBtn(),
            ],
          ),
        ),
      ],
    );
  }

  Widget _wantBalance() {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text("المبلغ",
                  style: TextModelStyle.blackColor11MediumStyle(size: 14)),
              const SizedBox(
                height: 5,
              ),
              _fieldDataWanted(dataField: amountDataWanted)
            ],
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text("محفظة الارسال",
                  style: TextModelStyle.blackColor11MediumStyle(size: 14)),
              _dropDownBtnWanted()
            ],
          ),
        ),
      ],
    );
  }

  Widget _fieldData({
    required String? dataField,
  }) {
    return Container(
      height: 45.0,
      child: TextFormField(
        onChanged: (value) {
          dataField = value;
          print("dataField = $dataField");
        },
        textAlign: TextAlign.center,
        enabled: false,
        style: TextModelStyle.blackColor57MediumStyle(size: 14.0),
        textAlignVertical: TextAlignVertical.bottom,
        decoration: InputDecoration(
            fillColor: ColorManger.whiteColor2,
            filled: true,
            hintText: "المبلغ",
            border: outBoard,
            focusedBorder: outBoard,
            enabledBorder: outBoard,
            errorBorder: outBoard,
            disabledBorder: outBoard,
            prefixIcon: Transform.translate(
                offset: Offset(15, 10),
                child: Text(
                  "\$",
                ))),
      ),
    );
  }

  Widget _fieldDataWanted({
    required String? dataField,
  }) {
    return Container(
      height: 45.0,
      child: TextFormField(
        onChanged: (value) {
          dataField = value;
          print("dataField = $dataField");
        },
        style: TextModelStyle.blackColor57MediumStyle(size: 14.0),
        textAlign: TextAlign.center,
        textAlignVertical: TextAlignVertical.bottom,
        decoration: InputDecoration(
            fillColor: ColorManger.whiteColor2,
            filled: true,
            hintText: "المبلغ",
            border: outBoard,
            focusedBorder: outBoard,
            enabledBorder: outBoard,
            errorBorder: outBoard,
            disabledBorder: outBoard,
            prefixIcon: Transform.translate(
              offset: Offset(15, 10),
              child: Text(
                "\$",
              ),
            )),
      ),
    );
  }

  Widget _dropDownBtn() {
    return DropdownButton<Map<String, dynamic>>(
        value: currentValue,
        hint: Text(
          "حدد العملة",
          style: TextModelStyle.blackColor57MediumStyle(size: 14.0),
        ),
        items: USD_list.map((e) => DropdownMenuItem<Map<String, dynamic>>(
          value: e,
          child: Row(
            children: [
              Image.asset(
                e["icon"],
                height: 30,
                width: 30,
                fit: BoxFit.contain,
              ),
              const SizedBox(
                width: 10.0,
              ),
              Text(e["NP"]),
            ],
          ),
        )).toList(),
        onChanged: (Map<String, dynamic>? value) {
          setState(() {
            currentValue = value;
          });
        });
  }

  Widget _dropDownBtnWanted() {
    return DropdownButton<Map<String, dynamic>>(
        value: currentValueWanted,
        hint: Text(
          "حدد العملة",
          style: TextModelStyle.blackColor57MediumStyle(size: 14.0),
        ),
        items:
        USD_list_Wanted.map((e) => DropdownMenuItem<Map<String, dynamic>>(
          value: e,
          child: Row(
            children: [
              Image.asset(
                e["icon"],
                height: 30,
                width: 30,
                fit: BoxFit.contain,
              ),
              const SizedBox(
                width: 10.0,
              ),
              Text(e["NP"]),
            ],
          ),
        )).toList(),
        onChanged: (Map<String, dynamic>? value) {
          setState(() {
            currentValueWanted = value;
          });
        });
  }

  Widget _save() {
    return Container(
        height: 45.0,
        width: double.infinity,
        decoration: BoxDecoration(
          color: ColorManger.primary,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: MaterialButton(
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(
                "لا يتم تحويل الامول في الوقت الحالي نسخة تجربية",
                textAlign: TextAlign.right,
                style: TextModelStyle.lightYellow12BoldStyle(),
              ),
            ));
          },
          child: Text(
            "حول",
            style: TextModelStyle.blackColor14BoldStyle(),
          ),
        ));
  }
}
