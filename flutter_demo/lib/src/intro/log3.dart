import 'package:flutter/material.dart';
import 'log2.dart';
class IntroPage3 extends StatefulWidget {
  const IntroPage3({Key? key}):super(key: key);

  @override
  State<IntroPage3> createState() => _SimpleDialog();
}

class _SimpleDialog extends State<IntroPage3> {
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
              'Hướng dẫn sử dụng',
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20.0),
            Text(
              '-Đăng nhập vào ứng dụng bằng tài khoản của mình.',
              style: TextStyle(fontSize: 16.0),
            ),
            Text(
              '-Thêm các tài khoản tiền của mình vào ứng dụng.',
              style: TextStyle(fontSize: 16.0),
            ),
            Text(
              '-Thêm các khoản chi tiêu hoặc thu nhập vào ứng dụng và gán chúng với các tài khoản tiền tương ứng.',
              style: TextStyle(fontSize: 16.0),
            ),
            Text(
              '-Xem báo cáo tài chính để biết tổng số tiền thu nhập, tổng số tiền chi tiêu và số dư hiện tại.',
              style: TextStyle(fontSize: 16.0),
            ),
              Text(
              '-Sửa đổi hoặc xóa các tài khoản, khoản chi tiêu hoặc thu nhập nếu cần.',
              style: TextStyle(fontSize: 16.0),
            ),
              Text(
              '-Thay đổi mật khẩu của bạn để bảo vệ tài khoản.',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 20.0),
         ElevatedButton(onPressed: (){
            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>const IntroPage2()), (route) => false);
          }, child: const Text('Bắt Đầu Sử Dụng'))
          ],
        ),
      ),
    );
  }
}