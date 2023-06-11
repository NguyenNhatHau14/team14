import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:intl/intl.dart';

class PlusButton extends StatefulWidget {
  const PlusButton({
    Key? key,
    required this.visible,
    required this.onTypeSelected,
    required this.onDataEntered,
  }) : super(key: key);

  final bool visible;
  final Function(String) onTypeSelected;
  final Function(double?, String?, String?, DateTime?) onDataEntered;

  @override
  _PlusButtonState createState() => _PlusButtonState();
}

class _PlusButtonState extends State<PlusButton> {
  final TextEditingController _accountController = TextEditingController();
  final TextEditingController _descController = TextEditingController();

  @override
  void dispose() {
    _accountController.dispose();
    _descController.dispose();
    super.dispose();
  }

  Future<void> addForm(
      double? account, String? desc, String? type, DateTime? date) async {
    print('$account, $desc, $type, $date');
    try {
      await FirebaseFirestore.instance.collection('madal').add({
        'account': account,
        'desc': desc,
        'type': type,
        'date': date,
      }).then((documentSnapshot) => print('add data id $documentSnapshot'));
    } catch (e) {
      print('kieu lỗi: ${e.runtimeType}');
    }
  }

  final _formKey = GlobalKey<FormBuilderState>();
  String selectedType = '';
  String note = 'some expense';
  String type = 'Income';
  DateTime selectDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectDate,
      firstDate: DateTime(2015, 8),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectDate) {
      setState(() {
        selectDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: widget.visible ? 1.0 : 0.0,
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
              return addModal(context);
            },
          );
        },
        child: const Icon(
          Icons.add,
          size: 40,
        ),
      ),
    );
  }

  Padding addModal(BuildContext context) {
    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(12),
        child: FormBuilder(
          key: _formKey,
          child: Column(
            children: [
              const Text(
                'N E W T R A N S F E R',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
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
                    child: FormBuilderTextField(
                      controller: _accountController,
                      name: 'account',
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: '0',
                        labelText: 'Your Account',
                      ),
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(context),
                      ]),
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(
                            RegExp(r'^\d+\.?\d{0,2}')),
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
                    child: FormBuilderTextField(
                      controller: _descController,
                      name: 'desc',
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Note On Transaction',
                        labelText: 'For what?',
                      ),
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(context),
                        FormBuilderValidators.maxLength(context, 30),
                      ]),
                      maxLength: 30,
                      onChanged: (value) {
                        note = value!;
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
                  Expanded(
                    child: FormBuilderChoiceChip<String>(
                      alignment: WrapAlignment.spaceEvenly,
                      name: 'type',
                      decoration:
                          const InputDecoration(border: InputBorder.none),
                      options: const [
                        FormBuilderChipOption(
                          value: 'income',
                          child: Text(
                            'Income',
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                        FormBuilderChipOption(
                          value: 'expense',
                          child: Text(
                            'Expense',
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                      ],
                      validator: FormBuilderValidators.required(context),
                      onChanged: (value) {
                        setState(() {
                          selectedType = value!;
                          widget.onTypeSelected(selectedType);
                        });
                      },
                      selectedColor: Colors.orange,
                    ),
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
                    padding: MaterialStateProperty.all(EdgeInsets.zero),
                  ),
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
                      Expanded(
                        child: FormBuilderDateTimePicker(
                          name: 'date',
                          initialValue: selectDate,
                          decoration: const InputDecoration(
                            labelText: 'Date',
                            border: OutlineInputBorder(),
                          ),
                          validator: FormBuilderValidators.required(context),
                          onChanged: (value) {
                            selectDate = value as DateTime;
                          },
                          inputType: InputType.date,
                          format: DateFormat('yyyy-MM-dd HH:mm:ss.SSS'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 50,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.saveAndValidate()) {
                      double? account =
                          double.tryParse(_accountController.text);
                      String? desc = _descController.text;
                      DateTime? date = DateTime.parse(selectDate.toString());

                      // widget.onDataEntered(account, desc, selectedType, date);
                      print(
                          '${account.runtimeType}, ${desc.runtimeType}, ${selectedType.runtimeType}, ${selectDate.runtimeType}');
                      await addForm(account, desc, selectedType, selectDate);
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Form submitted'),
                        ),
                      );
                      Navigator.of(context).pop();
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Form not submitted'),
                        ),
                      );
                    }
                  },
                  child: const Text(
                    'Submit',
                    style: TextStyle(fontSize: 20),
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
