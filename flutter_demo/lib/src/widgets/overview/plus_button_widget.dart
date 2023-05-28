import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

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
  final _formKey = GlobalKey<FormBuilderState>();
  String selectedType = '';
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
                      child: FormBuilder(
                        key: _formKey,
                        child: Column(
                          children: [
                            const Text(
                              'N E W T R A N F E R',
                              style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black),
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
                                    name: 'acount',
                                    decoration: const InputDecoration(
                                      border: OutlineInputBorder(),
                                      hintText: '0 ',
                                      labelText: 'Your Acount',
                                      fillColor: Colors.black,
                                    ),
                                    validator: FormBuilderValidators.compose([
                                      FormBuilderValidators.required(context),
                                    ]),
                                    // onChanged: (value) {
                                    //   try {
                                    //     amount = int.parse(value!);
                                    //   } catch (e) {}
                                    // },
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
                                  child: FormBuilderTextField(
                                    name: 'desc',
                                    decoration: const InputDecoration(
                                        border: OutlineInputBorder(),
                                        hintText: 'Note On Transaction ',
                                        labelText: 'For what?'),
                                    validator: FormBuilderValidators.compose([
                                      FormBuilderValidators.required(context),
                                      FormBuilderValidators.maxLength(
                                          context, 30)
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
                                    decoration: const InputDecoration(
                                        border: InputBorder.none),
                                    options: const [
                                      FormBuilderChipOption(
                                        value: 'income',
                                        child: Text('Income',
                                            style: TextStyle(fontSize: 20)),
                                      ),
                                      FormBuilderChipOption(
                                        value: 'expense',

                                        child: Text(
                                          'Expense',
                                          style: TextStyle(fontSize: 20),
                                        ), // Set the color for the selected "expense" option
                                      ),
                                    ],
                                    validator:
                                        FormBuilderValidators.required(context),
                                    onChanged: (value) {
                                      setState(() {
                                        selectedType = value!;
                                      });
                                    },
                                    selectedColor: Colors.orange,
                                  ),
                                )
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
                                      Expanded(
                                        child: FormBuilderDateTimePicker(
                                          name: 'date',
                                          decoration: const InputDecoration(
                                              labelText: 'Date',
                                              border: OutlineInputBorder()),
                                          validator:
                                              FormBuilderValidators.required(
                                                  context),
                                        ),
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
                                      onPressed: () {
                                        final curState = _formKey.currentState!;
                                        var mes = '';
                                        curState.save();
                                        if (curState.validate()) {
                                          mes = curState.value.toString();
                                        } else {
                                          mes = 'vali';
                                        }
                                        final snackBar =
                                            SnackBar(content: Text(mes));
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(snackBar);
                                      },
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
