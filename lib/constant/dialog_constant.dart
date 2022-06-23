
import 'package:flutter/material.dart';
import 'package:fruitapp/widget/font/text_meta.dart';
import 'package:get/get.dart';

import 'constant_style.dart';

class DialogConstant{

  static loading(BuildContext context, String text) {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          elevation: 0.0,
          backgroundColor: Colors.white,
          child: SingleChildScrollView(
            child: Container(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Wrap(
                  alignment: WrapAlignment.center,
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Center(
                          child: CircularProgressIndicator(),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          text,
                          // style: boldTextFont.copyWith(
                          //     fontSize: ScreenUtil().setSp(14)),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  static messageInfo({BuildContext? context, String? title, String? message, Function? onClose}){
    return showDialog<void>(
      context: context!,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          elevation: 0.0,
          backgroundColor: Colors.white,
          child: SingleChildScrollView(
            child: Container(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Wrap(
                  alignment: WrapAlignment.center,
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        TextMeta(title!, size: 15, weight: FontWeight.w600, color: Colors.black87,),
                        Divider(),
                        SizedBox(height: 15),
                        TextMeta(message!, color: Colors.black87, size: 14, maxLines: 5, textAlign: TextAlign.center,),
                        SizedBox(height: 25),
                        InkWell(
                          onTap: (){
                            onClose!();
                            Get.back();
                          },
                          child: Container(
                            decoration: ConstantStyle.boxButton(radius: 10, color: Colors.blue),
                            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                            child: Center(
                              child: TextMeta('OK', color: Colors.white,),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  static messageAlert({BuildContext? context, String? title, String? message}){
    return showDialog<void>(
      context: context!,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          elevation: 0.0,
          backgroundColor: Colors.white,
          child: SingleChildScrollView(
            child: Container(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Wrap(
                  alignment: WrapAlignment.center,
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextMeta(title!, size: 16, weight: FontWeight.w600, color: Colors.redAccent,),
                            SizedBox(width: 10),
                            Icon(Icons.warning_amber_rounded, color: Colors.redAccent,)
                          ],
                        ),
                        Divider(),
                        SizedBox(height: 15),
                        TextMeta(message!, color: Colors.black87, size: 14,),
                        SizedBox(height: 25),
                        InkWell(
                          onTap: (){
                            Get.back();
                          },
                          child: Container(
                            decoration: ConstantStyle.boxButton(radius: 10, color: Colors.blue),
                            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                            child: Center(
                              child: TextMeta('OK', color: Colors.white,),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  static messageConfirm({BuildContext? context, String? title, String? message, Function? onConfirm}){
    return showDialog<void>(
      context: context!,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          elevation: 0.0,
          backgroundColor: Colors.white,
          child: SingleChildScrollView(
            child: Container(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Wrap(
                  alignment: WrapAlignment.center,
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextMeta(title!, size: 16, weight: FontWeight.w600, color: Colors.redAccent,),
                            Icon(Icons.warning_amber_rounded, color: Colors.redAccent,)
                          ],
                        ),
                        Divider(),
                        SizedBox(height: 15),
                        TextMeta(message!, color: Colors.black87, size: 14,),
                        SizedBox(height: 25),
                        Row(
                          children: [
                            Expanded(
                              flex: 2,
                              child: InkWell(
                                onTap: (){
                                  Get.back();
                                  onConfirm!();
                                },
                                child: Container(
                                  decoration: ConstantStyle.boxButton(radius: 10, color: Colors.blue),
                                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                                  child: Center(
                                    child: TextMeta('Ya', color: Colors.white,),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 15,),
                            Expanded(
                              flex: 2,
                              child: InkWell(
                                onTap: (){
                                  Get.back();
                                },
                                child: Container(
                                  decoration: ConstantStyle.boxButtonBorder(radius: 10, color: Colors.white, widthBorder: 1, colorBorder: Colors.blue),
                                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                                  child: Center(
                                    child: TextMeta('Tidak', color: Colors.blue,),
                                  ),
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}