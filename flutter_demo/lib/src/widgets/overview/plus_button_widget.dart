import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PlusButton extends StatefulWidget {
  const PlusButton({
    super.key,
    required bool visible,
  }) : _visible = visible;

  final bool _visible;

  @override
  State<PlusButton> createState() => _PlusButtonState();
}

class _PlusButtonState extends State<PlusButton> {
//
  int? amount;
  String note = 'some expense';
  String type = 'Income';
  DateTime selectDate = DateTime.now();
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectDate) {
      setState(() {
        selectDate = picked;
      });
    }
  }

  //
  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: widget._visible ? 1.0 : 0.0,
      duration: const Duration(milliseconds: 500),
      child: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              backgroundColor: Colors.blue[200],
              isScrollControlled: true,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(20),
                ),
              ),
              context: context,
              builder: (BuildContext context) {
                return Padding(
                    padding: MediaQuery.of(context).viewInsets,
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        children: [
                          const Text(
                            'N E W T R A N F E R',
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.w700,color: Colors.black),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              const CircleAvatar(
                                backgroundColor: Colors.yellow,
                                child: Icon(
                                  Icons.attach_money,
                                  color: Colors.black,
                                ),
                              ),
                              const SizedBox(
                                width: 12,
                              ),
                              Expanded(
                                child: TextField(
                                  decoration: const InputDecoration(
                                      border: OutlineInputBorder(),
                                      hintText: '0 ',
                                      labelText: 'Your Acount',fillColor: Colors.black,),
                                  onChanged: (value) {
                                    try {
                                      amount = int.parse(value);
                                    } catch (e) {}
                                  },
                                  inputFormatters: [
                                    FilteringTextInputFormatter.digitsOnly,
                                  ],
                                  keyboardType: TextInputType.number,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              const CircleAvatar(
                                backgroundColor: Colors.blueAccent,
                                child: Icon(
                                  Icons.description,
                                  color: Colors.black,
                                ),
                              ),
                              const SizedBox(
                                width: 12,
                              ),
                              Expanded(
                                child: TextField(
                                  decoration: const InputDecoration(
                                      border: OutlineInputBorder(),
                                      hintText: 'Note On Transaction ',
                                      labelText: 'For what?'),
                                  maxLength: 50,
                                  onChanged: (value) {
                                    note = value;
                                  },
                                  keyboardType: TextInputType.text,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              const CircleAvatar(
                                backgroundColor: Colors.brown,
                                child: Icon(
                                  Icons.moving_sharp,
                                  color: Colors.black,
                                ),
                              ),
                              const SizedBox(
                                width: 12,
                              ),
                              ChoiceChip(
                                label: Text(
                                  "Income",
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: type == "Income"
                                          ? Colors.white
                                          : Colors.black),
                                ),
                                selectedColor: Colors.green,
                                selected: type == "Income" ? true : false,
                                onSelected: (val) {
                                  if (val) {
                                    setState(() {
                                      type == "Income";
                                    });
                                  }
                                },
                              ),
                              const SizedBox(
                                width: 12,
                              ),
                              ChoiceChip(
                                label: Text(
                                  "Expense",
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: type == "Expense"
                                          ? Colors.white
                                          : Colors.black),
                                ),
                                selectedColor: Colors.green,
                                selected: type == "Expense" ? true : false,
                                onSelected: (val) {
                                  if (val) {
                                    setState(() {
                                      type == "Expense";
                                    });
                                  }
                                },
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            height: 50,
                            child: TextButton(
                                onPressed: () {
                                  _selectDate(context);
                                },
                                style: ButtonStyle(
                                    padding: MaterialStateProperty.all(
                                        EdgeInsets.zero)),
                                child: Row(
                                  children: [
                                    const CircleAvatar(
                                      backgroundColor: Colors.red,
                                      child: Icon(
                                        Icons.date_range,
                                        color: Colors.black,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 12,
                                    ),
                                    Text(
                                      '${selectDate.day} / ${selectDate.month} / ${selectDate.year}',
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 20),
                                    ),
                                  ],
                                )),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          //cancel,enter
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 50,
                                child: ElevatedButton(
                                    style: TextButton.styleFrom(
                                        backgroundColor: Colors.grey),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: const Text(
                                      'Cancel !',
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w700),
                                    )),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              SizedBox(
                                height: 50,
                                child: ElevatedButton(
                                    onPressed: () {},
                                    child: const Text(
                                      'Enter +',
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w700),
                                    )),
                              )
                            ],
                          )
                        ],
                      ),
                    ));
              });
        },
        child: const Icon(
          Icons.add,
          size: 40,
        ),
      ),
    );
  }
}
