import 'package:azkar_app/screens/about_screen.dart';
import 'package:azkar_app/screens/azkar_screen.dart';
import 'package:azkar_app/screens/launch_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,       //حذف علامة الفلاتر
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,  // طرق التعامل ماتيريل ودجت في اختلاف المحتوى مثل النصوص
        GlobalCupertinoLocalizations.delegate, // خاص بالودجت الخاصة ب اي او اس
        GlobalWidgetsLocalizations.delegate,   // التحكم في اتجاه رسم اللغات
      ],
      supportedLocales: const [                // اللغات المدعومة
        Locale('ar'),                        // فقط العربية
        Locale('en'),
      ],
      locale: const Locale('ar'),              // بتحدد اللغة اللي يستخدمها بغض النظر عن لغة الجهاز
      initialRoute: '/launch_screen',
      routes: {
        '/launch_screen' : (context) => LaunchScreen(),
        '/azkar_screen' : (context) => AzkarScreen(),
        '/about_screen' : (context) => AboutScreen(),
      },
    );
  }
}

