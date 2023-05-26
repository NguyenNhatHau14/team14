import 'package:flutter/material.dart';
import 'package:flutter_demo/ThemeProvider.dart';
import 'package:provider/provider.dart';

class CardBody extends StatelessWidget {
  CardBody({super.key, required this.item, required this.indexCard});
  var item;
  var indexCard;
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      color: indexCard % 2 == 0
          ? const Color.fromARGB(255, 51, 240, 246)
          : const Color.fromARGB(255, 159, 207, 236),
      elevation: 0,
      child: ListTile(
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(5),
          child: Image.asset(
            'assets/img/${item.img}',
            height: 40,
          ),
        ),
        title: Text(item.name,style: const TextStyle( fontSize: 20, color: Colors.black),),
        subtitle: const Text('today',style: TextStyle( color: Colors.black),),
        trailing: SizedBox(
          width: 140,
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: Text(
                  item.fee,
                  style: TextStyle(
                      color: item.buy ? Colors.red : Colors.green,
                      fontWeight: FontWeight.w600,
                      fontSize: 18),
                ),
              ),
              Expanded(
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.edit,
                    color: Color.fromARGB(255, 189, 173, 28),
                  ),
                ),
              ),
              Expanded(
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.delete,
                    color: Colors.red,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
