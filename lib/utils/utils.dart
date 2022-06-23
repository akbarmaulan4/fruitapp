import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';

class Utils{
  static Color colorFromHex(String hexColor) {
    final hexCode = hexColor.replaceAll('#', '');
    return Color(int.parse('FF$hexCode', radix: 16));
  }

  static List<Map> getErrorMessage(error){
    List<Map> data = [];
    error['message'].forEach((dynamicKey, list) {
      Map map = {dynamicKey: list[0]};
      data.add(map);
      // dynamicKey will be 'ones', 'twos', ....
      // list will be the corresponding list of maps
    });
    return data;
  }

  // static openDatePicker(BuildContext context, Function onSelected) async {
  //   DateTime dateTime;
  //   dateTime = DateTime.now();
  //   final DateTime picked = (await showDatePicker(
  //       context: context,
  //       builder: (context, child) {
  //         return Theme(
  //           data: Theme.of(context).copyWith(
  //             colorScheme: ColorScheme.light(
  //               primary: Colors.blue, // header background color
  //               onPrimary: Colors.white, // header text color
  //               onSurface: Colors.black87, // body text color
  //             ),
  //             textButtonTheme: TextButtonThemeData(
  //               style: TextButton.styleFrom(
  //                 primary: Colors.blue, // button text color
  //               ),
  //             ),
  //           ),
  //           child: child!,
  //         );
  //       },
  //       initialDate:  dateTime,
  //       firstDate: new DateTime(1900),
  //       lastDate: dateTime //new DateTime(2100)
  //   ))!;
  //   if (picked != null){
  //     final dateFormat = DateFormat("yyyy-MM-dd");
  //     onSelected(dateFormat.format(picked));
  //   }
  // }
}