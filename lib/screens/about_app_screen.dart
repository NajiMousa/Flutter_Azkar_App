import 'package:flutter/material.dart';

class AboutAppScreen extends StatefulWidget {
  //const AboutAppScreen({Key? key}) : super(key: key);

  final String message;

  AboutAppScreen({required this.message});

  @override
  _AboutAppScreenState createState() => _AboutAppScreenState();
}

class _AboutAppScreenState extends State<AboutAppScreen> {
  @override
  Widget build(BuildContext context) {
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
      body:   Center(
        child: Text(
          widget.message,
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
