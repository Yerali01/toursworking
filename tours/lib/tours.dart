import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:tours/tour_lists.dart';
import 'dart:io';
import 'package:intl/intl.dart';

class ChoosePlaceWidget extends StatefulWidget {
  const ChoosePlaceWidget({super.key});

  @override
  State<ChoosePlaceWidget> createState() => _ChoosePlaceWidgetState();
}

class _ChoosePlaceWidgetState extends State<ChoosePlaceWidget> {
  _ChoosePlaceWidgetState() {
    fromSelectedVal = fromPlace[0];
    toSelectedVal = toPlace[0];
  }

  Color greyToRedFrom = Colors.grey;
  Color greyToRedTo = Colors.grey;

  final fromPlace = [
    "Актау",
    "Актобе",
    "Алматы",
    "Астана",
    "Баянауыл",
  ];
  String? fromSelectedVal = "a";

  final toPlace = [
    "Актау",
    "Актобе",
    "Алматы",
    "Астана",
    "Баянауыл",
  ];
  String? toSelectedVal = "b";

  final TextEditingController _dateController = TextEditingController();
  //bool? _checkBox = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 200,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                "assets/images/urta.png",
                width: double.maxFinite,
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
          // decoration: const BoxDecoration(
          //       color: Colors.black,
          //       borderRadius: BorderRadius.only(
          //         topLeft: Radius.circular(25.0),
          //         topRight: Radius.circular(25.0),
          //       ),
          //     ),
          SliverToBoxAdapter(
            
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Найти Тур',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  DecoratedBox(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        width: 1,
                        color: Colors.white,
                      ),
                      color: const Color(0xFFF0F0F0),
                    ),
                    child: DropdownButtonFormField(
                      value: fromSelectedVal,
                      items: fromPlace
                          .map((e) =>
                              DropdownMenuItem(child: Text(e), value: e))
                          .toList(),
                      onChanged: (val) {
                        setState(
                          () {
                            fromSelectedVal = val as String;
                            greyToRedFrom = Colors.red;
                          },
                        );
                      },
                      decoration: InputDecoration(
                        labelText: "Откуда",
                        border: InputBorder.none,
                        prefixIcon: Icon(
                          Icons.circle_outlined,
                          //color: Colors.red,
                          color: greyToRedFrom,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  DecoratedBox(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        width: 1,
                        color: Colors.white,
                      ),
                      color: const Color(0xFFF0F0F0),
                    ),
                    child: DropdownButtonFormField(
                      value: toSelectedVal,
                      items: toPlace
                          .map((e) =>
                              DropdownMenuItem(child: Text(e), value: e))
                          .toList(),
                      onChanged: (val) {
                        setState(
                          () {
                            toSelectedVal = val as String;
                            greyToRedTo = Colors.red;
                          },
                        );
                      },
                      //icon: const Icon(Icons.map),
                      decoration: InputDecoration(
                        labelText: "Куда",
                        border: InputBorder.none,
                        prefixIcon: Icon(
                          Icons.circle_outlined,
                          //color: Colors.red,
                          color: greyToRedTo,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  DatePicker(),
                  const Divider(color: Color(0xFFF0F0F0)),
                  const SizedBox(height: 10),
                  // CheckboxListTile(
                  //   value: _checkBox,
                  //   title: const Row(
                  //     children: [
                  //       Icon(Icons.food_bank_outlined),
                  //       Text("Питание"),
                  //     ],
                  //   ),
                  //   onChanged: (val) {
                  //     setState(() {
                  //       _checkBox = val;
                  //     });
                  //   },
                  // ),
                  const SizedBox(height: 160),
                  SizedBox(
                    height: 42,
                    width: double.infinity,
                    child: ElevatedButton(
                      style: const ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll<Color>(
                            Color(0xFF5E6AD4)),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => TourList(
                              fromPlace: 'Астана',
                              toPlace: 'Баянауыл',
                              smallInfo: '',
                            ),
                          ),
                        );
                      },
                      child: const Text(
                        "Найти туры",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class DatePicker extends StatefulWidget {
  const DatePicker({super.key});

  @override
  State<DatePicker> createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  final TextEditingController _dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _dateController,
      decoration: const InputDecoration(
        icon: Icon(Icons.calendar_today_rounded),
        labelText: "Дата поездки",
        border: InputBorder.none,
      ),
      onTap: () async {
        DateTime? pickedDate = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(2000),
          lastDate: DateTime(2050),
        );
        if (pickedDate != null) {
          setState(
            () {
              _dateController.text =
                  DateFormat('yyyy-MM-dd').format(pickedDate);
            },
          );
        }
      },
    );
  }
}
