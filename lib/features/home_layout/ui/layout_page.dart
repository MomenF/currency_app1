import 'package:currency_app/features/home_layout/ui/navigation_tabs/exchange.dart';
import 'package:currency_app/features/home_layout/ui/navigation_tabs/home.dart';
import 'package:currency_app/theme/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/controllers/login_controller.dart';
import '../../more_pages/more.dart';
import '../../transaction_pages/transaction_history.dart';

class LayoutPage extends StatefulWidget {
  const LayoutPage({Key? key}) : super(key: key);

  @override
  _LayoutPageState createState() => _LayoutPageState();
}

class _LayoutPageState extends State<LayoutPage> {
  List<Widget> navigationTabs = [
    HomePage(),
    ExchangePage(),
    TransactionHistory(),
    MoreScreen()
  ];



  List<Map> navigationTools = [
    {"title":"الرئسية", "Icon": const Icon(Icons.flag_circle_outlined,size:28,)},
    {"title":"التحويل", "Icon": const Icon(Icons.change_circle_outlined,size:28)},
    {"title":"التحويلات السابقة", "Icon": const Icon(Icons.swap_horizontal_circle_outlined,size:28)},
    {"title":"الاعدادات", "Icon": const Icon(Icons.build_circle_outlined,size:28)},
  ];
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: navigationTabs[currentIndex],
        bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: ColorManger.primary,
          currentIndex: currentIndex,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          selectedLabelStyle: GoogleFonts.tajawal(),
          unselectedLabelStyle:GoogleFonts.tajawal(),
          onTap: (value){
            setState(() {
              currentIndex = value;
            });
          },
          items: navigationTools.map((e) => BottomNavigationBarItem(
            icon: e["Icon"],
            label: e["title"],
            backgroundColor: ColorManger.blackColor2,
          )).toList(),
        ),
      ),
    );
  }
}
