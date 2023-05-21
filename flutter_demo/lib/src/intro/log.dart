import 'package:flutter/material.dart';
import 'package:flutter_demo/src/intro/log3.dart';
import 'log1.dart';
import 'log2.dart';
class IntroPage extends StatefulWidget {
  const IntroPage({Key? key}):super(key: key);

  @override
  State<IntroPage> createState() => _SimpleDialog();
}

class _SimpleDialog extends State<IntroPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 200,
            width: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
                image: const DecorationImage(
                image: AssetImage('assets/images/2.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 24),
         const Text(
            'Cảm Ơn Bạn Đã Sử Dụng',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 16),
          const Text(
            'Ứng dụng quản lý tiền là một công cụ hữu ích để giúp bạn theo dõi và quản lý tài chính cá nhân của mình. Với ứng dụng này, bạn có thể dễ dàng ghi lại các khoản thu nhập và chi tiêu hàng ngày của mình, tạo và quản lý ngân sách, và theo dõi các khoản nợ và thanh toán.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          SizedBox(height: 24),
          ElevatedButton(onPressed: (){
            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>const IntroPage1()), (route) => false);
          }, child: const Text('Đọc Hướng Dẫn')),
            ElevatedButton(onPressed: (){
            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>const IntroPage3()), (route) => false);
          }, child: const Text('Bỏ Qua Và Bắt Đầu Sử Dụng'))
          
        ],
      ),
    );
  }
}