import 'package:flutter/material.dart';
import 'package:fruitapp/constant/constant_style.dart';
import 'package:fruitapp/model/fruit_model.dart';
import 'package:fruitapp/widget/font/text_meta.dart';

class FruitItemWidget extends StatelessWidget {
  FruitModel? data;
  Function? onTap;
  FruitItemWidget({this.data, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()=>onTap!(data!.name.toString()),
      child: Container(
        decoration: ConstantStyle.boxButtonBorder(
          radius: 8, color: Colors.white,
          colorBorder: Colors.grey.shade300, widthBorder: 0.5
        ),
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        margin: EdgeInsets.only(bottom: 5),
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                child: TextMeta(data!.name.toString(), color: Colors.black87, size: 14, weight: FontWeight.w500,),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                alignment: Alignment.centerRight,
                child: TextMeta(data!.price!.toString(), color: Colors.black87),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
