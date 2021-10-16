import 'package:flutter/material.dart';

class LaunchScreen extends StatefulWidget {
  const LaunchScreen({Key? key}) : super(key: key);

  @override
  _LaunchScreenState createState() => _LaunchScreenState();
}

class _LaunchScreenState extends State<LaunchScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(seconds: 3),(){     //  تاخير العمل 3 ثواني وعمل بعض الاعمال
      //Navigator.pushNamed(context,'/azkar_screen');   // الانتقال لواجهة الاذكار مع امكانية الرجوع للواجهة الاولى
      Navigator.pushReplacementNamed(context,'/azkar_screen');   // استبدال الواجهة بواجة الاذكار
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: AlignmentDirectional.center,    // تخلي الكونتينر ياخذ كل المساحة و العناصر في المنتصف
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: AlignmentDirectional.topStart,
              end: AlignmentDirectional.bottomEnd,
              colors: [
                Colors.teal.shade800,
                Colors.teal.shade200,
              ]),
        ),
        child: const Text(
          'مسبحة الاذكار',
          style: TextStyle(
            fontFamily: 'Harmattan',
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
        ),
      ),
    );
  }
}
