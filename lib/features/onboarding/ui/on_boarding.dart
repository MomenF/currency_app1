import 'package:currency_app/core/app.g.dart';
import 'package:currency_app/theme/paths/icons_path.dart';
import 'package:currency_app/theme/paths/image_paths.dart';
import 'package:currency_app/theme/paths/routes.dart';
import 'package:currency_app/theme/styles/colors.dart';
import 'package:currency_app/theme/styles/text_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_indicator/page_indicator.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({Key? key}) : super(key: key);

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  List<String> onBoardingImagesPaths = [
    ImageManger.onBoardingOne,
    ImageManger.onBoardingTwo,
    ImageManger.onBoardingThree,
  ];
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child:  Stack(
          alignment: Alignment.bottomCenter,
          children: [
            PageView.builder(itemBuilder: (context, index) {
              return Container(decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(onBoardingImagesPaths[currentIndex])
                  )
              ),);
            },
              onPageChanged: (value){
                setState(() {
                  currentIndex = value;
                  print("currentIndex $currentIndex");
                });
              },
              itemCount:onBoardingImagesPaths.length ,
            ),
            Positioned(
                bottom: 100.0,
                child: Container(
                  height: 35.0,
                  width: 90.0,
                  child:
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        currentIndex == 0?
                        selected():
                        indicatorPoints() ,

                        currentIndex == 1?
                        selected():
                        indicatorPoints(),

                        currentIndex == 2?
                        selected():
                        indicatorPoints()
                      ],
                    ),
                  ),
                ),
            ),
            Positioned(
                bottom: 0,
                right: 0,
                child:
                Container(
                  height: 40.0,
                  width: 200.0,
                  decoration: BoxDecoration(
                    color: ColorManger.primary,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10.0),),
                  ),
                    child: MaterialButton(
                          onPressed: (){
                            if(currentIndex == 2){
                              Navigator.pushNamed(context, Routes.authPage);
                            }else{
                              setState(() {
                                currentIndex += 1 ;
                              });
                            }
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(currentIndex == 2?"Get Started":"Next",style: TextModelStyle.blackColor16BoldStyle() ,),
                              Image.asset(IconManger.rowsIcon)
                            ],
                          ),
                        )


                )),
            Positioned(
                bottom: 0,
                left: 0,
                child: TextButton(
                  child: Text("Skip",style: TextModelStyle.greyColor314BoldStyle(),),
                  onPressed: (){
                    Navigator.pushNamed(context, Routes.authPage);
                  },
                ))
          ],
        ))

    );
  }

  // OnBoardingScreen(
  // pages: onBoardingImagesPaths.map((e) => OnBoardingModel(
  // image: Image.asset(e),
  // title: "Welcome to us",
  // body: "You are welcome ",
  // )).toList(),
  // onSkip: () { Navigator.pushNamed(context, Routes.authPage); },
  // activeDotColor: ColorManger.primary,


  // PageIndicatorContainer(
  // shape: IndicatorShape.roundRectangleShape(size: Size(25, 5)),
  // length: 3,
  // indicatorColor: ColorManger.greyColor,
  // indicatorSelectorColor: ColorManger.primary,
  // child: PageView(
  //
  // children: onBoardingImagesPaths.map((e) => Container(
  // decoration: BoxDecoration(
  // image: DecorationImage(
  // image: AssetImage(e)
  // )
  // ),
  // )).toList(),
  // onPageChanged: (e){
  // setState(() {
  // currentIndex = e;
  // });
  // },
  //
  // scrollDirection: Axis.horizontal,
  // ),
  // )
Widget selected(){
    return Container(
      height: 8.0,
      width: 30.0,
      decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color: ColorManger.primary,
          borderRadius: BorderRadius.circular(20.0)
      ),);
}

Widget indicatorPoints(){
    return CircleAvatar(
      radius: 5.0,
      backgroundColor: ColorManger.greyColor,
    );
}
}
/*
 int x;
 int y;
 cin>>x;
 cin>>y;
 int z = x-y;
 cout<<"sum : "<<z;
 */