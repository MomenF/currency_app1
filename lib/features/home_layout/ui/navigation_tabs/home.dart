import 'package:banner_carousel/banner_carousel.dart';
import 'package:currency_app/theme/paths/image_paths.dart';
import 'package:currency_app/theme/styles/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../../theme/paths/icons_path.dart';
import '../../../../theme/paths/routes.dart';
import '../../../../theme/styles/text_style.dart';
import '../../../../theme/theme.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            _titleView(),
            SizedBox(
              height: 24.0,
            ),
            _moneyExchange(),
            SizedBox(
              height: 24.0,
            ),
            _transactionHistory(),
            SizedBox(
              height: 20,
            ),
            Text(
              "نبذة تعريفية عن شركة",
              style: TextModelStyle.blackColor16BoldStyle(),
              textAlign: TextAlign.right,
            ),
            SizedBox(height: 10,),
            GridView(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  crossAxisSpacing: 4.0,
                  mainAxisSpacing: 4.0,
                  mainAxisExtent: 200,
              ),
              children: [
               card(
                 Icons.key,
                 "حماية عالية",
                 "نحن نقدر امولك و خصوصيتك,لقد قمنا بنشر افضل الانضمة لضمان امولك وحسابك"
               ),
                card(
                    Icons.favorite_border,
                    "موثوق",
                    "نحن موثوقون للغاية و موثوقون من قبل الالف الاشخاص \nامولك هو اوليتنا القصوى"
                ),
                card(
                    Icons.send,
                    "صفقه سريعة",
                    "نحن ندعم المعاملات السريعة في جميع انحاء يعد تبادل الاموال من خلال هسه امرا سريعا ومضمون "
                ),
                card(
                    Icons.money,
                    "رسوم شفافة منحفظة",
                    "تاكد من انك قادر تبادل اكبر قدر من الاموال. فنحن نقدم \nافضل اسعار الصرف الممكنة هنا"
                ),
                card(
                    Icons.support_agent_outlined,
                    "دعم 7/24",
                    "نحن هنا من اجلك,نحن نقدم دعم للعملاء على مدار الساعة طوال ايام الاسبوع من خلال البريد الالكتروني و الدعم"
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _titleView() {
    ColorFilter colorFilter;
    return Row(
      children: [
        /*
                 Container(
            height: 58.0,
            width: 58.0,
            margin: EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: ColorManger.primary,
              border: Border.all(color: ColorManger.primary,width: 1.0),
              boxShadow: [

                BoxShadow(
                  color: ColorManger.primary,
                  blurRadius: 2.0,
                  spreadRadius: 3.0
                ),
                BoxShadow(
                    color: ColorManger.whiteColor,
                    blurRadius: 0.0,
                    spreadRadius: 2.0
                ),
              ],
              image: DecorationImage(
                image: AssetImage(ImageManger.profileImage),
              )
            ),

          ),

         */

        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, Routes.notification);
          },
          child: Stack(
            alignment: Alignment.topRight,
            children: [
              Icon(Icons.notifications_none_outlined, size: 40),
              CircleAvatar(
                radius: 10,
                backgroundColor: ColorManger.redColor,
                child: Center(
                    child: Text(
                  "0",
                  style: TextModelStyle.whiteColor11MediumStyle(),
                )),
              )
            ],
          ),
        ),
        SizedBox(
          width: 10.0,
        ),
        Spacer(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              "مرحبا , علي ",
              style: TextModelStyle.blackColor20BoldStyle(),
              textAlign: TextAlign.right,
            ),
            Text(
              "تحقق من أسعارنا الحالية",
              style: TextModelStyle.greyColor214MediumStyle(),
              textAlign: TextAlign.right,
            ),
          ],
        ),
      ],
    );
  }

  Widget _moneyExchange() {
    return BannerCarousel(
      customizedIndicators: const IndicatorModel.animation(
          width: 20, height: 5, spaceBetween: 2, widthAnimation: 50),
      height: 250,
      customizedBanners: [
        Image.asset(
          ImageManger.baner1,
          width: double.infinity,
          fit: BoxFit.fill,
        ),
        Image.asset(
          ImageManger.baner2,
          width: double.infinity,
          fit: BoxFit.fill,
        ),
        Image.asset(
          ImageManger.baner3,
          width: double.infinity,
          fit: BoxFit.fill,
        ),
      ],
      activeColor: Colors.amberAccent,
      disableColor: Colors.white,
      animation: true,
      borderRadius: 10,
      indicatorBottom: false,
    );
  }

  Widget _currentExchange() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Current ExchangeRate",
            style: TextModelStyle.blackColor16BoldStyle(),
          ),
          SizedBox(
            height: 10.0,
          ),
          itemExchange(
              title: "USD",
              buyNumber: 220,
              sellNumber: 215,
              imagePath: IconManger.USD_Icon),
          SizedBox(
            height: 16.0,
          ),
          itemExchange(
              title: "EUR",
              buyNumber: 410,
              sellNumber: 425,
              imagePath: IconManger.EUR_Icon),
          SizedBox(
            height: 10.0,
          ),
          itemExchange(
              title: "GBP",
              buyNumber: 620,
              sellNumber: 690,
              imagePath: IconManger.GBP_Icon),
        ],
      ),
    );
  }

  Widget itemExchange({
    required String imagePath,
    required String title,
    required double sellNumber,
    required double buyNumber,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Image.asset(
                imagePath,
                height: 50.0,
                width: 50.0,
                fit: BoxFit.contain,
              ),
              SizedBox(
                width: 10.0,
              ),
              Text(
                title,
                style: TextModelStyle.greyColor214MediumStyle(),
              )
            ],
          ),
          Column(
            children: [
              Text(
                "Buy",
                style: TextModelStyle.greyColor214MediumStyle(),
              ),
              Text(
                "\$$buyNumber",
                style: TextModelStyle.blackColor16BoldStyle(),
              ),
            ],
          ),
          Column(
            children: [
              Text(
                "Sell",
                style: TextModelStyle.greyColor214MediumStyle(),
              ),
              Text("\$$sellNumber",
                  style: TextModelStyle.blackColor16BoldStyle()),
            ],
          ),
        ],
      ),
    );
  }

  Widget _transactionHistory() {
    return Container(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                child:Text(
                  "عرض الكل",
                  style: TextModelStyle.primary12BoldStyle(),
                ),
                onTap: (){

                },
              ),
              Text(
                "تاريخ المعاملات",
                style: TextModelStyle.blackColor16BoldStyle(),
              ),
            ],
          ),
          SizedBox(
            height: 32.0,
          ),
          _itemOFTransactionHistory(
              firstIconPath: IconManger.ireland,
              secondIconPath: IconManger.USD_Icon,
              sellNumber: 6000,
              USDNumber: 140,
              currency: 19.52,
              isSuccess: false),
          SizedBox(
            height: 24.0,
          ),
          _itemOFTransactionHistory(
              firstIconPath: IconManger.ireland,
              secondIconPath: IconManger.USD_Icon,
              sellNumber: 200,
              USDNumber: 500,
              currency: 49.52,
              isSuccess: true),
          SizedBox(
            height: 24.0,
          ),
          _itemOFTransactionHistory(
              firstIconPath: IconManger.ireland,
              secondIconPath: IconManger.USD_Icon,
              sellNumber: 200,
              USDNumber: 500,
              currency: 49.52,
              isSuccess: true)
        ],
      ),
    );
  }

  Widget _itemOFTransactionHistory({
    required String firstIconPath,
    required bool isSuccess,
    required String secondIconPath,
    required double sellNumber,
    required double USDNumber,
    required double currency,
  }) {
    return Container(
      height: 100.0,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Text(
                "\$ $currency",
                style: TextModelStyle.blackColor3Color20BoldStyle(),
              ),
              SizedBox(
                height: 12.0,
              ),
              Text(
                isSuccess ? "عمليه ناجحه" : "معلقه",
                style: isSuccess
                    ? TextModelStyle.lightGreen12BoldStyle()
                    : TextModelStyle.redColor2Color12BoldStyle(),
              ),
            ],
          ),
          SizedBox(
            width: 8.0,
          ),
          Column(
            children: [
              Text(
                "زين كاش الى بيبال",
                style: TextModelStyle.blackColor14BoldStyle(),
              ),
              Chip(
                label: Text(
                  "$USDNumber USD",
                  style: TextModelStyle.whiteColor11MediumStyle(),
                ),
                backgroundColor: ColorManger.greyColor4,
              ),
              Text(
                "10/02/2021",
                style: TextModelStyle.greyColor314BoldStyle(),
              ),
            ],
          ),
          SizedBox(
            width: 24.0,
          ),
          Container(
            color: ColorManger.lightYellow,
            padding: const EdgeInsets.all(8.0),
            height: 100.0,
            width: 60.0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  firstIconPath,
                  height: 35,
                  width: 35,
                  fit: BoxFit.contain,
                ),
                Divider(
                  height: 10.0,
                  thickness: 2.0,
                  color: ColorManger.redColor,
                ),
                Image.asset(
                  secondIconPath,
                  height: 35,
                  width: 35,
                  fit: BoxFit.contain,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }



  Widget card(IconData iconData,String title,String dec){
    return  Container(
      color: ColorManger.blackColor,
      padding: EdgeInsets.all(5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height:20 ,),
          CircleAvatar(
            backgroundColor:Colors.black12,
            radius: 30,
            child:Icon(iconData,size: 30,color: Colors.amber,),
          ),
         const SizedBox(height:10 ,),
          Text(
            title,
            style: TextModelStyle.whiteColor14MediumStyle(),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            "$dec",
            style: TextModelStyle.whiteColor14MediumStyle(),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
