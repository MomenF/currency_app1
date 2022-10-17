import 'package:currency_app/features/auth/ui/login/login.dart';
import 'package:currency_app/features/auth/ui/sign_up/sign_up.dart';
import 'package:currency_app/features/auth/ui/sign_up/verification.dart';
import 'package:currency_app/features/more_pages/change_password.dart';
import 'package:currency_app/features/more_pages/profile.dart';
import 'package:currency_app/theme/paths/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'features/auth/ui/auth.dart';
import 'features/home_layout/ui/layout_page.dart';
import 'features/more_pages/contact_us.dart';
import 'features/more_pages/freq_asked_ques.dart';
import 'features/onboarding/ui/on_boarding.dart';
import 'features/transaction_pages/exchange_details.dart';
import 'features/notification/notification.dart';

class RouteGenerator {

  
  static Route<dynamic>? generateRoute(RouteSettings? settings) {
    final Object? params = settings!.arguments;
    switch (settings.name) {
      case Routes.onBoarding:
        return MaterialPageRoute(
            builder: (context)=> OnBoarding(),
            settings: RouteSettings(name: Routes.onBoarding) );
      case   Routes.layout:
        return MaterialPageRoute(
            builder: (context)=> LayoutPage(),
            settings: RouteSettings(name: Routes.layout) );
      case   Routes.authPage:
        return MaterialPageRoute(
            builder: (context)=> AuthPage(),
            settings: RouteSettings(name: Routes.authPage) );
      case   Routes.login:
        return MaterialPageRoute(
            builder: (context)=> LoginPage(),
            settings: RouteSettings(name: Routes.login) );
      case   Routes.sign_up:
        return MaterialPageRoute(
            builder: (context)=> SignUpPage(),
            settings: RouteSettings(name: Routes.sign_up) );
      case   Routes.verificationPage:
        return MaterialPageRoute(
            builder: (context)=> VerificationPage(),
            settings: RouteSettings(name: Routes.verificationPage) );
      case Routes.exchange_details:
        return MaterialPageRoute(
            builder: (context)=> ExchangeDetails(stats: "",),
            settings: RouteSettings(name: Routes.exchange_details));
      case Routes.profile:
        return MaterialPageRoute(
            builder: (context)=> Profile(),
            settings: RouteSettings(name: Routes.profile));
      case Routes.password:
        return MaterialPageRoute(
            builder: (context)=> ChangePassword(),
            settings: RouteSettings(name: Routes.password));
        //us
      case Routes.us:
        return MaterialPageRoute(
            builder: (context)=> ContactUs(),
            settings: RouteSettings(name: Routes.us));
      case Routes.ques:
        return MaterialPageRoute(
            builder: (context)=> FreqAskedQuestion(),
            settings: RouteSettings(name: Routes.ques));
      case Routes.notification:
        return MaterialPageRoute(
            builder: (context)=> NotificationView(),
            settings: RouteSettings(name: Routes.notification));
    }
  }
}


