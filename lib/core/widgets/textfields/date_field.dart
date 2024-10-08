import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../config/app_colors.dart';
import '../../config/themes.dart';
import '../../utils.dart';
import '../buttons/cuper_button.dart';
import '../texts/text_r.dart';

class DateField extends StatefulWidget {
  const DateField({
    super.key,
    required this.controller,
    this.datePicker = false,
    this.timePicker = false,
  });

  final TextEditingController controller;
  final bool datePicker;
  final bool timePicker;

  @override
  State<DateField> createState() => _DateFieldState();
}

class _DateFieldState extends State<DateField> {
  DateTime date1 = DateTime.now();
  DateTime date2 = DateTime.now();

  void onDateTimeChanged() {
    setState(() {
      widget.controller.text = dateToString(date1);
    });
  }

  void onTimeChanged() {
    setState(() {
      widget.controller.text = timeToString(date2);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      decoration: BoxDecoration(
        color: AppColors.main,
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextField(
        controller: widget.controller,
        readOnly: true,
        textCapitalization: TextCapitalization.sentences,
        style: const TextStyle(
          color: AppColors.white,
          fontFamily: Fonts.regular,
          fontSize: 20,
        ),
        decoration: InputDecoration(
          prefixIcon: Padding(
            padding: const EdgeInsets.all(12),
            child: SvgPicture.asset(
              widget.datePicker ? 'assets/date1.svg' : 'assets/date2.svg',
            ),
          ),
          contentPadding: const EdgeInsets.symmetric(vertical: 0),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
          ),
        ),
        onTapOutside: (event) {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        onTap: () async {
          if (widget.datePicker) {
            await showCupertinoModalPopup(
              context: context,
              barrierDismissible: false,
              builder: (context) {
                return _Sheet(
                  onSave: onDateTimeChanged,
                  picker: CupertinoDatePicker(
                    onDateTimeChanged: (value) {
                      date1 = value;
                    },
                    initialDateTime: stringToDate(widget.controller.text),
                    mode: CupertinoDatePickerMode.date,
                    minimumYear: 1950,
                    maximumYear: DateTime.now().year + 1,
                  ),
                );
              },
            );
          } else if (widget.timePicker) {
            await showCupertinoModalPopup(
              context: context,
              barrierDismissible: false,
              builder: (context) {
                return _Sheet(
                  onSave: onTimeChanged,
                  date: false,
                  picker: CupertinoDatePicker(
                    onDateTimeChanged: (value) {
                      date2 = value;
                    },
                    initialDateTime: stringToDate(widget.controller.text),
                    mode: CupertinoDatePickerMode.time,
                    use24hFormat: true,
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}

class _Sheet extends StatelessWidget {
  const _Sheet({
    required this.picker,
    this.date = true,
    required this.onSave,
  });

  final Widget picker;
  final bool date;
  final void Function() onSave;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350,
      decoration: const BoxDecoration(
        color: Color(0xff474749),
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      child: Column(
        children: [
          Material(
            color: Colors.transparent,
            child: Stack(
              children: [
                SizedBox(
                  height: 68,
                  child: Row(
                    children: [
                      const SizedBox(width: 18),
                      TextR(date ? 'Date' : 'Time', fontSize: 24),
                      const Spacer(),
                      CuperButton(
                        onPressed: () {
                          Navigator.pop(context);
                          onSave();
                        },
                        minSize: 30,
                        child: Container(
                          height: 30,
                          width: 70,
                          decoration: BoxDecoration(
                            color: const Color(0xff3F3F40),
                            borderRadius: BorderRadius.circular(7),
                          ),
                          child: Center(
                            child: TextR(
                              'Save',
                              fontSize: 20,
                              color: AppColors.white70,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 14),
                      CuperButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        minSize: 30,
                        child: Container(
                          height: 30,
                          width: 30,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xff3F3F40),
                          ),
                          child: Center(
                            child: Icon(
                              Icons.close,
                              color: AppColors.white70,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 19),
                    ],
                  ),
                ),
                Positioned(
                  left: 0,
                  right: 0,
                  top: 13,
                  child: Center(
                    child: Container(
                      height: 5,
                      width: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: const Color(0xffA5A5A6),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 1,
            color: const Color(0xff959595),
          ),
          Expanded(
            child: CupertinoTheme(
              data: cupertinoTheme,
              child: picker,
            ),
          ),
          const SizedBox(height: 42),
        ],
      ),
    );
  }
}
