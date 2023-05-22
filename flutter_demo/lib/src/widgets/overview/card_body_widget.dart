import 'package:flutter/material.dart';

class CardBody extends StatelessWidget {
  CardBody({super.key, required this.item});
  var item;
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      color: const Color(0xffdfdfdf),
      elevation: 0,
      child: ListTile(
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(5),
          child: Image.asset(
            'assets/img/${item.img}',
            height: 40,
          ),
        ),
        title: Text(item.name),
        subtitle: const Text('today'),
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
                  onPressed: () {
                    
                  },
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