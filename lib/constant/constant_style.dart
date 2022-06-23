import 'package:flutter/material.dart';
import 'package:fruitapp/utils/utils.dart';
import 'package:google_fonts/google_fonts.dart';

import 'color_code.dart';

class ConstantStyle {

  static const avenirStandart = TextStyle(
    fontFamily: 'Avenir',
    fontSize: 14,
    color: Colors.grey,
  );

  static const decorTextField = InputDecoration(
      border: InputBorder.none,
      contentPadding: EdgeInsets.only(bottom:16),
  );

  static decorTextField2(String hint){
    return InputDecoration(
        border: InputBorder.none,
        contentPadding: EdgeInsets.only(bottom:16)
    );
  }

  static box_card() {
    return BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            offset: Offset(1,1),
          )
        ]
    );
  }

  static boxRadiusOnly({
    double topLeft=0,
    double bottomLeft=0,
    double topRight=0,
    double bottomRight=0,
    Color color=Colors.transparent,
  }){
    return BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(topLeft),
          bottomLeft: Radius.circular(bottomLeft),
          topRight: Radius.circular(topRight),
          bottomRight: Radius.circular(bottomRight)
        ),
        color: color
    );
  }

  static boxCircle({
    Color color=Colors.transparent,
  }){
    return BoxDecoration(
        shape: BoxShape.circle,
        color: color
    );
  }

  static boxCircleBorder({
    Color color=Colors.transparent,
    Color colorBorder=Colors.transparent,
    double widthBorder=0
  }){
    return BoxDecoration(
        shape: BoxShape.circle,
        color: color,
        border: Border.all(color: colorBorder, width: widthBorder)
    );
  }

  static boxButton({
    double radius=0,
    Color color=Colors.transparent,
  }){
    return BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(radius)),
        color: color
    );
  }

  static inputStyle(){
    return InputDecoration(
        border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
            borderSide: BorderSide(color: Utils.colorFromHex(ColorCode.bluePrimary))),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
            borderSide: BorderSide(color: Utils.colorFromHex(ColorCode.bluePrimary))),
        fillColor: Colors.white,
        hintText: 'Nama Gedung',
        labelText: 'Nama Gedung',
        labelStyle: GoogleFonts.roboto(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: Utils.colorFromHex(ColorCode.greyPrimary)
        ),
        suffixIcon: Icon(Icons.arrow_drop_down, color: Utils.colorFromHex(ColorCode.greyPrimary)),
        contentPadding: EdgeInsets.only(top: 20, left: 20, bottom: 20)
    );
  }


  static boxButtonBorder({
    double radius=0,
    Color color=Colors.transparent,
    Color colorBorder=Colors.transparent,
    double widthBorder=0
  }){
    return BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(radius)),
      color: color,
      border: Border.all(color: colorBorder, width: widthBorder)
    );
  }

  static boxShadowButon({
    double? radius,
    Color? color,
    Color? colorShadow,
    double? spreadRadius,
    double? blurRadius,
    Offset? offset,
  }){
    return BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(radius!)),
      color: color,
      boxShadow: [
        BoxShadow(
          color: colorShadow!,
          spreadRadius: spreadRadius!,
          blurRadius: blurRadius!,
          offset: offset!,
        ),
      ],
    );
  }

  static boxShadowButtonBorder({
    double radius=0,
    Color color=Colors.transparent,
    Color colorBorder=Colors.transparent,
    double widthBorder=0,
    Color colorShadow=Colors.transparent,
    double spreadRadius=0,
    double blurRadius=0,
    Offset? offset,
  }){
    return BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(radius)),
        color: color,
        border: Border.all(color: colorBorder, width: widthBorder),
        boxShadow: [
          BoxShadow(
            color: colorShadow,
            spreadRadius: spreadRadius,
            blurRadius: blurRadius,
            offset: offset ?? Offset(0, 0),
          ),
        ],
    );
  }
}