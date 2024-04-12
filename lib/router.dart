import 'package:flutter/material.dart';
import 'package:flutter_project/features/auth/screens/auth_screen.dart';
import 'package:flutter_project/features/auth/screens/booking_page.dart';
import 'package:flutter_project/features/auth/screens/home_screen.dart';
import 'package:flutter_project/features/auth/screens/landmark_screen.dart';
import 'package:flutter_project/features/auth/screens/login_screen.dart';
import 'package:flutter_project/features/auth/screens/message_screen.dart';
import 'package:flutter_project/features/auth/screens/notification_page.dart';
import 'package:flutter_project/features/auth/screens/profile_setting.dart';
import 'package:flutter_project/features/auth/screens/search_page.dart';
import 'package:flutter_project/features/auth/screens/setting_page.dart';
import 'package:flutter_project/features/auth/screens/transaction_screen.dart';
import 'package:flutter_project/features/auth/screens/wishlist_screen.dart';
import 'package:flutter_project/features/home/screens/near_from_you.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case AuthScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const AuthScreen(),
      );
    case BookingPage.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const BookingPage(
          latitude: double.nan, //buat lokasi gugel maps/
          longitude: double.nan,
          locationAddress: 'Detailed Location Address\nLocation Address',
          locationName: 'Location Name',
        ),
      );
    case SearchPage.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const SearchPage(),
      );
    case NotificationPage.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const NotificationPage(),
      );
    case LandmarkScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const LandmarkScreen(),
      );
    case WishlistScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const WishlistScreen(),
      );
    case MessageScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const MessageScreen(),
      );
    case TransactionScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const TransactionScreen(),
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
