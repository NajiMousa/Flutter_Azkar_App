import 'package:azkar_app/screens/about_app_screen.dart';
import 'package:flutter/material.dart';

class AzkarScreen extends StatefulWidget {
  const AzkarScreen({Key? key}) : super(key: key);

  @override
  _AzkarScreenState createState() => _AzkarScreenState();
}

class _AzkarScreenState extends State<AzkarScreen> {
  int _counter = 0; // متغير مشترك بين الزر و النص لتعديل و قرائته
  String _content = 'الحمد لله';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true, // حتى تظهر الصورة على الاب بار
      appBar: AppBar(
        actionsIconTheme: const IconThemeData(
          // تعميم بعض الخصائص على ايقونات اليمنى الاب بار
          color: Colors.black,
        ),
        title: const Text(
          'سبحة الاذكار',
          style: TextStyle(
            color: Colors.black,
            fontSize: 30,
            fontFamily: 'Harmattan',
          ),
        ),
        centerTitle: true,
        actions: [
          PopupMenuButton<String>(
            onSelected: (value) {
              if (_content != value) {
                setState(() {
                  _content = value;
                  _counter = 0;
                });
              }
            },
            itemBuilder: (context) {
              return [
                const PopupMenuItem(
                  child: Text('الحمد لله'),
                  value: 'الحمد لله',
                ),
                const PopupMenuItem(
                  child: Text('أستغفر الله'),
                  value: 'أستغفر الله',
                ),
                const PopupMenuItem(
                  child: Text('سبحان الله '),
                  value: 'سبحان الله ',
                ),
              ];
            },
          ),
          IconButton(
            // الطريقة الثانية stful
            onPressed: () {
              //                     (context) => AboutScreen(),
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AboutAppScreen(message: 'مشروع 2 ',),
                ),
              );
            },
            //  الطريقة الاولى stless
            // onPressed: () => Navigator.pushNamed(context, '/about_screen',   // الانتقال الى صفحة حول مع امكانية الرجوع
            //     arguments: {                                                 // نقل بيانات بين الواجهات
            //       'message': 'مشروع '
            //     }),

            icon: Icon(Icons.info_outline),
          ),
        ],
        backgroundColor: Colors.transparent,
        // شفاف
        elevation: 0,
        //automaticallyImplyLeading: false,     // لالغاء تفعيل زر الرجوع في الاب بار لكن لا يمنع الرجوع من الاسفل
      ),
      floatingActionButton: FloatingActionButton(
        // اضافة زر دائري في الاسفل الاكشن بوتون
        onPressed: () {
          setState(() {
            ++_counter;
          });
        },
        child: Icon(Icons.add), // اضافة ايقونة للاكشن بوتون
        backgroundColor: Colors.teal,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/islamic.jpg'), // اضافة الصورة
            fit: BoxFit.cover, // لنشر الصورة على مساحة الشاشة بالكامل
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // وضع العناصر في المنتصف راسي
          children: [
            const CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage('images/aaa.jpg'),
            ),
            Container(
              clipBehavior: Clip.antiAlias,
              // يجعل كل العناصر تاخذ حواف الكونتينر اللي هي فيه
              margin: const EdgeInsets.only(top: 20, bottom: 20),
              height: 60,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black45,
                      offset: Offset(-5, -5), // شدو من الاعلى  اليسار
                      blurRadius: 6,
                    ),
                    BoxShadow(
                      color: Colors.green,
                      offset: Offset(5, 5), // شدو من الاعلى  اليسار
                      blurRadius: 6,
                    )
                  ]),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      _content,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Harmattan'),
                    ),
                  ),
                  DecoratedBox(
                    decoration: const BoxDecoration(
                      color: Colors.teal,
                    ),
                    child: SizedBox(
                      width: 50,
                      height: 60,
                      child: Center(
                        child: Text(
                          _counter.toString(),
                          // ياخذ قيمته من المتغير الذي يعدل عليه الزر
                          style: const TextStyle(
                            color: Colors.white,
                            fontFamily: 'Harmattan',
                            fontSize: 22,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Expanded(
                  flex: 2, // جعل هذا الزر ضعفي مساحة العنصر الاخر
                  child: ElevatedButton(
                    // عمل زر
                    onPressed: () {
                      // الاكشن اللي راح يصير لما يضغط عليه
                      setState(() {
                        // تعميم الاثر للتغيير الحاصل هنا
                        ++_counter;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      //  تغيير اللون الخاص ب الزر
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadiusDirectional.only(
                          // عمل الحواف من الاعلى فقط
                          topStart: Radius.circular(10),
                        ),
                      ),
                      primary: Colors.teal,
                    ),
                    child: const Text(
                      'تسبيح',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Harmattan',
                      ),
                    ), // النص اللي يظهر في الزر
                  ),
                ),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _counter = 0;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.orange,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadiusDirectional.only(
                          bottomEnd: Radius.circular(10),
                        ),
                      ),
                    ),
                    child: const Text(
                      'أعادة',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Harmattan',
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
