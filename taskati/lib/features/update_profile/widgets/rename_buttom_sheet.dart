import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:taskati/core/widgets/custom_text_form_field.dart';
import 'package:taskati/core/utils/utils.dart';

import '../../../core/constants/app_constants.dart';
import '../../../core/widgets/custom_button.dart';
import '../../auth/data/models/user_class.dart';
Future<String> convertAssetToFile(String path) async {
  final file =await assetToFile(path);
  return file.path;
}
Future<String>renameBottomSheet(BuildContext context,String currentName)async {
String? name;
TextEditingController controller = TextEditingController();
controller.text=currentName;
await  showModalBottomSheet(context: context, builder: (context) {
    return Padding(
      padding:  EdgeInsets.all(20.r),
      child: Column(
        spacing: 20.h,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Expanded(child: CustomTextFormField(controller: controller,),)
            ],
          ),
          Row(
            children: [
              Expanded(child: CustomButton(title: "Update Your Name",tapped:() {
                name= controller.text;
                Navigator.pop(context);
              },)),
            ],
          ),
        ],
      ),
    );
  },useSafeArea: true,shape: RoundedRectangleBorder(
      borderRadius:BorderRadiusGeometry.vertical(top: Radius.circular(22.r)) ),
      constraints: BoxConstraints(minWidth: double.infinity));
return name??currentName;
}