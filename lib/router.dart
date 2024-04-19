import 'package:flutter/material.dart';
import 'package:flutter_project/dummysearchoverlay.dart';
import 'package:flutter_project/features/auth/screens/auth_screen.dart';
import 'package:flutter_project/features/auth/screens/forgot_password_screen.dart';
import 'package:flutter_project/features/auth/screens/home_screen.dart';
import 'package:flutter_project/features/auth/screens/login_screen.dart';
import 'package:flutter_project/features/auth/screens/notification_page.dart';
import 'package:flutter_project/features/auth/screens/profile_setting.dart';
import 'package:flutter_project/features/auth/screens/search_page.dart';
import 'package:flutter_project/features/auth/screens/setting_page.dart';
import 'package:flutter_project/features/home/screens/near_from_you.dart';
import 'package:flutter_project/features/search/widgets/search_page_widget.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case AuthScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const AuthScreen(),
      );
    case ForgotPasswordScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const ForgotPasswordScreen(),
      );
    case SearchPage.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => SearchPage(
          namaKota: '',
        ),
      );
    case SearchPageWidget.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => SearchPageWidget(),
      );
    case NotificationPage.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const NotificationPage(),
      );
    case SettingPage.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const SettingPage(),
      );
    case ProfileSetting.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const ProfileSetting(),
      );

    case HomeScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const HomeScreen(),
      );
    case NearFromYou.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const NearFromYou(),
      );
    case LoginScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const LoginScreen(),
      );
    default:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const Scaffold(
          body: Center(
            child: Text('screen does not exist'),
          ),
        ),
      );
  }
}
