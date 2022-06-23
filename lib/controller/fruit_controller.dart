
import 'package:fruitapp/api/api.dart';
import 'package:fruitapp/model/fruit_model.dart';
import 'package:get/get.dart';

class FruitController extends GetxController{
  RxString imgFuitSelected = ''.obs;
  RxList<FruitModel?> dataFruits = <FruitModel>[].obs;

  dynamic _dataImage;
  dynamic get dataImage => _dataImage;

  getFuits(String refId, bool imgRef){
    var header = new Map<String, String>();
    var post = new Map<String, dynamic>();
    header['Content-Type'] = 'application/json';
    post['imageReferences'] = refId;
    post['referenceId'] = imgRef;
    API.basePost('/fruits', post, header, true, (result, error){
      if(error != null){
        //do something here
      }
      if(result != null){
        _dataImage = result['data']['imagesReferences'];
        var fruits = (result['data']['fruits'] as List).map((e) => e == null ? null : FruitModel.fromJson(e as Map<String, dynamic>)).toList();
        if(fruits != null){
          dataFruits.value = fruits;
        }
      }
    });
  }

  getImageFruit(String value){
    if(dataImage != null){
      String imgName = dataImage[value];
      if(imgName != null){
        imgFuitSelected.value = imgName;
      }else{
        imgFuitSelected.value = '';
      }
    }
  }

  getDistinctFruit({Function? onCallBack}){
    // List contoh = ['banana', 'pisang', 'apel', 'jeruk', 'apel', 'banana', 'apel'];
    List names = [];
    List<FruitModel> duplicate = [];
    dataFruits.value.forEach((u){
      if (names.contains(u!.name)){
        if(!duplicate.contains(u.name)){
          var data = dataFruits.value.where((element) => element!.name == u.name).toList().length;
          print("duplicate ${u.name} => ${data}");
          FruitModel model = FruitModel();
          model.name = u.name;
          model.price = data;
          duplicate.add(model);
        }
      }else{
        names.add(u.name);
      }
    });
    final totalSorted = duplicate.map((e) => e.price).toList()..sort((a,b)=>b!.compareTo(a!));
    final nameSorted = duplicate.map((e) => e.name).toList()..sort((a,b)=>a!.compareTo(b!));
    if(totalSorted != null && nameSorted != null){
      onCallBack!('${nameSorted[0]} total ${totalSorted[0]}');
    }
  }
}