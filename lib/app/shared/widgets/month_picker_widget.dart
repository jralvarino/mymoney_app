import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:mymoney_app/app/shared/themes/fonts.dart';
import 'package:mymoney_app/app/shared/utils/app_colors.dart';
import 'package:mymoney_app/app/shared/utils/date.dart';

class MonthPickerWidget extends StatefulWidget {
  final Future<void> Function(int) onRefresh;

  const MonthPickerWidget({Key? key, required this.onRefresh})
      : super(key: key);

  @override
  State<MonthPickerWidget> createState() => _MonthPickerWidgetState();
}

class _MonthPickerWidgetState extends State<MonthPickerWidget> {
  int _indexMonth = DateTime.now().month;

  String previous = Date.getPreviousMonthName();
  String next = Date.getNextMonthName();
  String actual = Date.getActualMonthName();
  bool front = false;

  Future<void> _previousAct() async {
    if (_indexMonth >= 1 && _indexMonth <= 12) {
      _indexMonth -= 1;
      await widget.onRefresh(_indexMonth);
      setState(
        () {
          front = false;

          previous = Date.getMonthNameByIndex(_indexMonth - 1);
          actual = Date.getMonthNameByIndex(_indexMonth);
          next = Date.getMonthNameByIndex(_indexMonth + 1);
        },
      );
    }
  }

  Future<void> _nextAct() async {
    if (_indexMonth >= 1 && _indexMonth <= 12) {
      _indexMonth += 1;
      await widget.onRefresh(_indexMonth);
      setState(
        () {
          front = true;

          previous = Date.getMonthNameByIndex(_indexMonth - 1);
          actual = Date.getMonthNameByIndex(_indexMonth);
          next = Date.getMonthNameByIndex(_indexMonth + 1);
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          buildMonth(
              previous,
              TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.normal,
                color: AppColors.lightGray.withOpacity(0.75),
                fontFamily: Fonts.nunitoRegular,
              ),
              _previousAct),
          Container(
            // key: ValueKey<int>(_count1),
            width: 49,
            height: 49,
            decoration: BoxDecoration(
              // border: Border.all(width: 2),
              shape: BoxShape.circle,
              // You can use like this way or like the below line
              //borderRadius: new BorderRadius.circular(30.0),
              color: AppColors.lightGray.withOpacity(0.20),
            ),
            child: buildMonth(
                actual,
                TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey.withOpacity(1),
                  fontFamily: Fonts.nunitoExtraBold,
                ),
                _nextAct),
          ),
          buildMonth(
              next,
              TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.normal,
                color: AppColors.lightGray.withOpacity(0.75),
                fontFamily: Fonts.nunitoRegular,
              ),
              _nextAct),
        ],
      ),
    );
  }

  Widget buildMonth(String value, TextStyle style, void callback()) {
    return AnimatedSwitcher(
        duration: const Duration(milliseconds: 500),
        transitionBuilder: (Widget child, Animation<double> animation) {
          final inAnimation =
              Tween<Offset>(begin: Offset(1, 0.0), end: Offset(0.0, 0.0))
                  .animate(animation);
          final outAnimation =
              Tween<Offset>(begin: Offset(-1.0, 0.0), end: Offset(0.0, 0.0))
                  .animate(animation);

          return ClipRect(
            child: SlideTransition(
              position: front ? inAnimation : outAnimation,
              child: Padding(
                padding: const EdgeInsets.all(0.0),
                child: child,
              ),
            ),
          );
        },
        child: TextButton(
          key: ValueKey<int>(_indexMonth),
          onPressed: () => callback(),
          child: Text('$value', style: style),
        ));
  }
}
