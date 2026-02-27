import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:taskati/core/utils/utils.dart';

import '../../../core/widgets/custom_button.dart';

Future<XFile?>imageBottomSheet(BuildContext context)async {
final ImagePicker picker = ImagePicker();
var image;
 await showModalBottomSheet(context: context, builder: (context) {
    return Padding(
      padding:  EdgeInsets.all(20.r),
      child: Column(
        spacing: 20.h,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Expanded(child: CustomButton(title: "Upload from Camera",tapped: ()async {
                image =await picker.pickImage(source: ImageSource.camera);
                Navigator.pop(context,image);
              },),)
            ],
          ),
          Row(
            children: [
              Expanded(child: CustomButton(title: "Upload from Gallery",tapped:() async{
                image =await picker.pickImage(source: ImageSource.gallery);
                Navigator.pop(context,image);
              },)),
            ],
          ),
        ],
      ),
    );
  },useSafeArea: true,shape: RoundedRectangleBorder(
      borderRadius:BorderRadiusGeometry.vertical(top: Radius.circular(22.r)) ),
      constraints: BoxConstraints(minWidth: double.infinity));
 if(image==null){
  final img= await assetToFile('assets/images/user.png');
  image = img;
 }
return image;
}