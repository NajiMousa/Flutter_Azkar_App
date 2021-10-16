import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {

  String _About = 'تطبيق مسبحة الاذكار ';
  @override
  Widget build(BuildContext context) {
    //ModalRoute.of(context)?.settings.arguments;  // عبارة عن كونستركتر يوصلني للاعدادات تاعت الراوت اللي وصلني لهي الواجهة اللي فيها القيم تاعتي في ارقيمينت
    ModalRoute? modalRoute = ModalRoute.of(context);  // نفسه بطريقة اخرى
    if( modalRoute != null ){
      Map<String , dynamic> argumentsn = modalRoute.settings.arguments as Map<String,dynamic> ;
      if(argumentsn.containsKey('message')){
        _About = argumentsn['message'];          // اعطاء القيمة المرسلة للمتغير
      }
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(             // تعميم الخصائص على كافة ايقونات الاب بار
          color: Colors.black,
        ),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),   // قص هذه الواجهة من الشجرة
          icon: const Icon(Icons.arrow_back_ios),
        ),
        title: const Text(
          'عن التطبيق',
          style: TextStyle(
            color: Colors.teal,
            fontSize: 18,
            fontWeight: FontWeight.bold,
            fontFamily: 'Harmattan',
          ),
        ),
      ),
      body:  Center(
        child: Text(
          _About,
          style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            fontFamily: 'Harmattan',
          ),
        ),
      ),
    );
  }
}
