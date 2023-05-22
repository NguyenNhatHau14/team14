import 'package:cupertino_modal_sheet/cupertino_modal_sheet.dart';
import 'package:flutter/material.dart';

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
  String? selectItem;
  final List<String> _item = [
    'food',
    'tranfer',
    'lean',
  ];

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: widget._visible ? 1.0 : 0.0,
      duration: const Duration(milliseconds: 500),
      child: FloatingActionButton(
        onPressed: () {
          showCupertinoModalSheet(
            context: context,
            builder: (context) {
              return controller_add();
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

  Container controller_add() {
    return Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.white,
        child: Stack(
          children: [
            backgroundAdd(),
            Positioned(
              top: 100,
              left: 40,
              right: 40,
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.yellow),
                height: 550,
                width: 340,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 50,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border:
                                    Border.all(width: 2, color: Colors.blue)),
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10)),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ));
  }

  Column backgroundAdd() {
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: 200,
          decoration: const BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
          ),
          child: Column(
            children: [
              const SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.of(context).pop(),
                      child: const Icon(
                        Icons.arrow_back,
                        size: 20,
                        color: Colors.white,
                      ),
                    ),
                    const Text(
                      'A d d i n g',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          decoration: TextDecoration.none,
                          color: Colors.white),
                    ),
                    const Icon(
                      Icons.attach_file_outlined,
                      size: 20,
                      color: Colors.white,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
