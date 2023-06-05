import 'package:flutter/material.dart';
import 'package:flutter_demo/ThemeProvider.dart';
import 'package:provider/provider.dart';

class CardBody extends StatelessWidget {
  const CardBody({Key? key, required this.item, required this.indexCard})
      : super(key: key);

  final dynamic item;
  final int indexCard;

  void _showDeleteConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirm Delete'),
          content: const Text('Are you sure you want to delete this item?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                _deleteItem(context);
              },
              child: const Text('Delete'),
            ),
          ],
        );
      },
    );
  }

  void _deleteItem(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Item deleted successfully.'),
      ),
    );
    // TODO: Perform the actual delete operation here
    // You can access the necessary data like item.id to identify the item to delete
    // Update your data source and notify any listeners
  }

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
              'assets/img/iconUpwork.png',
              height: 40,
            )),
        title: Text(
          item.name,
          style: const TextStyle(fontSize: 20, color: Colors.black),
        ),
        subtitle: Text(
          item.date,
          style: const TextStyle(color: Colors.black),
        ),
        trailing: SizedBox(
          width: 140,
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: Text(
                  item.fee,
                  style: TextStyle(
                    color: item.type == 'income' ? Colors.red : Colors.green,
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                  ),
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
                    _showDeleteConfirmationDialog(context);
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
