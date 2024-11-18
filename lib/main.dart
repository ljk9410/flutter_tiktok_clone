import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle.dark,
  );
  runApp(const TiktokApp());
}

class TiktokApp extends StatelessWidget {
  const TiktokApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      debugShowCheckedModeBanner: false,
      title: 'Tiktok',
      themeMode: ThemeMode.system,
      theme: ThemeData(
        textTheme: Typography.blackMountainView,
        brightness: Brightness.light,
        primaryColor: const Color(0xffe9435a),
        scaffoldBackgroundColor: Colors.white,
        textSelectionTheme: const TextSelectionThemeData(
          cursorColor: Color(0xffe9435a),
        ),
        splashColor: Colors.transparent,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontSize: Sizes.size16 + Sizes.size2,
            fontWeight: FontWeight.w600,
          ),
        ),
        bottomAppBarTheme: const BottomAppBarTheme(
          color: Colors.white,
        ),
      ),
      darkTheme: ThemeData(
        textTheme: Typography.whiteMountainView,
        brightness: Brightness.dark,
        primaryColor: const Color(0xffe9435a),
        scaffoldBackgroundColor: Colors.black,
        bottomAppBarTheme: BottomAppBarTheme(
          color: Colors.grey.shade900,
        ),
      ),
    );
  }
}
