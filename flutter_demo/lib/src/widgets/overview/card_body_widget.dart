import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CardBody extends StatelessWidget {
  const CardBody({Key? key, required this.item, required this.indexCard})
      : super(key: key);

  final dynamic item;
  final int indexCard;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 0,
      child: ListTile(
        leading: const CircleAvatar(
          backgroundImage: AssetImage('assets/img/iconUpwork.png'),
          radius: 20,
        ),
        title: Text(
          item.desc,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          DateFormat('yyyy-MM-dd').format(item.date),
          style: const TextStyle(
            fontSize: 16,
          ),
        ),
        trailing: Text(
          '${item.account}',
          style: TextStyle(
            fontSize: 18,
            color: item.type == 'income' ? Colors.green : Colors.red,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
