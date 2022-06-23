import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fruitapp/constant/color_code.dart';
import 'package:fruitapp/constant/constant_style.dart';
import 'package:fruitapp/constant/dialog_constant.dart';
import 'package:fruitapp/controller/fruit_controller.dart';
import 'package:fruitapp/utils/utils.dart';
import 'package:fruitapp/widget/font/text_meta.dart';
import 'package:fruitapp/widget/fruit/fruit_item_widget.dart';
import 'package:get/get.dart';

class FruitScreen extends StatefulWidget {
  const FruitScreen({Key? key}) : super(key: key);

  @override
  _FruitScreenState createState() => _FruitScreenState();
}

class _FruitScreenState extends State<FruitScreen> {
  FruitController controller = FruitController();
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.getFuits('1650165235', true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: TextMeta('Fruit Data', size: 15, weight:FontWeight.w500, color: Utils.colorFromHex(ColorCode.darkBlue,),),
        elevation: 0,
      ),
      body: Obx(()=>Container(
        color: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                height: 200,
                width: 200,
                decoration: ConstantStyle.boxButton(
                    radius: 8, color: Colors.grey.shade300
                ),
                margin: EdgeInsets.symmetric(vertical: 20),
                child: CachedNetworkImage(
                  placeholder: (context, url) => Center(),
                  imageUrl: controller.imgFuitSelected.value != '' ? controller.imgFuitSelected.value :
                  'https://upload.wikimedia.org/wikipedia/commons/1/14/No_Image_Available.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            TextMeta('Fruits', size: 15, weight:FontWeight.w500, color: Utils.colorFromHex(ColorCode.darkBlue,)),
            SizedBox(height: 10),
            Expanded(child: Container(
              child: ListView.builder(
                  itemCount: controller.dataFruits.value.length,
                  itemBuilder: (context, index){
                    return FruitItemWidget(
                      data: controller.dataFruits.value[index],
                      onTap: (val)=>controller.getImageFruit(val),
                    );
                  }
              ),
            )),

          ],
        ),
      )),
      bottomNavigationBar: Obx(()=>Wrap(
        children: [
          InkWell(
            onTap: ()=>controller.dataFruits.value.length > 0 ? controller.getDistinctFruit(
                onCallBack: (val)=>DialogConstant.messageInfo(
                    context: context,
                    title: 'Informasi',
                    message: val,
                    onClose: ()=>Get.back()
                )
            ):null,
            child: Container(
              decoration: ConstantStyle.boxButton(
                  radius: 8,
                  color: Utils.colorFromHex(controller.dataFruits.value.length > 0 ? ColorCode.bluePrimary:ColorCode.greyPrimary)
              ),
              margin: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              padding: EdgeInsets.symmetric(vertical: 15),
              child: Center(
                child: TextMeta('Normal', size: 15, weight: FontWeight.w500),
              ),
            ),
          )
        ],
      )),
    );
  }
}
