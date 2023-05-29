import 'package:flutter/material.dart';
import 'log3.dart';

class IntroPage2 extends StatefulWidget {
  const IntroPage2({Key? key}) : super(key: key);

  @override
  State<IntroPage2> createState() => _SimpleDialog();
}

class _SimpleDialog extends State<IntroPage2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text(
              'Các tính năng chính',
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20.0),
            const Text(
              '- Thêm tài khoản tiền: Bạn có thể thêm các tài khoản tiền của mình và cập nhật số dư của chúng.',
              style: TextStyle(fontSize: 16.0),
            ),
            const Text(
              '- Thêm khoản chi tiêu hoặc thu nhập: Bạn có thể thêm các khoản chi tiêu hoặc thu nhập của mình và gán chúng với các tài khoản tiền tương ứng.',
              style: TextStyle(fontSize: 16.0),
            ),
            const Text(
              '- Xem báo cáo tài chính: Bạn có thể xem báo cáo tài chính của mình để biết tổng số tiền thu nhập, tổng số tiền chi tiêu và số dư hiện tại.',
              style: TextStyle(fontSize: 16.0),
            ),
            const Text(
              '- Sửa đổi hoặc xóa tài khoản, khoản chi tiêu hoặc thu nhập: Bạn có thể sửa đổi hoặc xóa bất kỳ tài khoản, khoản chi tiêu hoặc thu nhập nào.',
              style: TextStyle(fontSize: 16.0),
            ),
            const Text(
              '- Thay đổi mật khẩu: Bạn có thể thay đổi mật khẩu của mình để bảo vệ tài khoản.',
              style: TextStyle(fontSize: 16.0),
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const IntroPage3()),
                );
              },
              child: const Text('Tiếp tục'),
            ),
          ],
        ),
      ),
    );
  }
}
 