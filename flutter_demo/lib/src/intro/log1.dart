import 'package:flutter/material.dart';
import 'log2.dart';
class IntroPage1 extends StatefulWidget {
  const IntroPage1({Key? key}):super(key: key);

  @override
  State<IntroPage1> createState() => _SimpleDialog();
}

class _SimpleDialog extends State<IntroPage1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Giới thiệu về ứng dụng',
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20.0),
            Text(
              'Ứng dụng của chúng tôi giúp bạn quản lý tài chính cá nhân một cách đơn giản và hiệu quả. Với ứng dụng này, bạn có thể thêm các tài khoản tiền của mình, theo dõi các khoản chi tiêu và thu nhập, và xem báo cáo tài chính của mình.',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 20.0),
           ElevatedButton(onPressed: (){
            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>const IntroPage2()), (route) => false);
          }, child: const Text('Tiếp Tục'))
          ],
        ),
      ),
    );
  }
}