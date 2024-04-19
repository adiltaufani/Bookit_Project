import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/dummysearchoverlay.dart';
import 'package:flutter_project/features/auth/screens/notification_page.dart';
import 'package:flutter_project/features/auth/screens/home_screen.dart';
import 'package:flutter_project/features/auth/screens/login_screen.dart';
import 'package:flutter_project/features/auth/screens/notification_page.dart';
import 'package:flutter_project/features/home/screens/dummy.dart';
import 'package:flutter_project/features/search/widgets/search_page_widget.dart';
import 'package:flutter_project/router.dart';
import 'package:firebase_analytics/firebase_analytics.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseAnalytics analytics = FirebaseAnalytics.instance;
  FirebaseMessaging.onBackgroundMessage(_firebasePushHandler);
  AwesomeNotifications().initialize(
    null,
    [
      NotificationChannel(
        channelKey: 'basic channel',
        channelName: 'basic notif',
        channelDescription: 'apa aja lah desk nya',
      ),
    ],
    debug: true,
  );
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: (settings) => generateRoute(settings),
      home: HomeScreen(),
    );
  }
}

Future<void> _firebasePushHandler(RemoteMessage message) async {
  print("Message from push notification is ${message.data}");
  AwesomeNotifications().createNotificationFromJsonData(message.data);
}
