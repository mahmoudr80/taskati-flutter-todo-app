import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:image_picker/image_picker.dart';
import 'package:taskati/core/constants/app_constants.dart';
import 'package:taskati/core/widgets/custom_button.dart';
import 'package:taskati/features/auth/presentation/widgets/custom_text_form.dart';
import 'package:taskati/features/auth/presentation/widgets/profile_image_widget.dart';
import 'package:taskati/features/home/presentation/home_screen.dart';

import '../data/models/user_class.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
   XFile? _image ;
  ImagePicker picker = ImagePicker();
  late Box<User> box;
  TextEditingController nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.only(right: 16.w,left: 16.w,top: 100.h),
        child: Column(
          spacing:11.h ,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ProfileImageWidget(image: _image,),
            CustomButton(title: "Upload From Camera",tapped: uploadFromCamera,),
            CustomButton(title: "Upload From Gallery",tapped: uploadFromGallery,),
            Divider(),
            CustomTextForm(controller: nameController,),
            CustomButton(title: "Done",tapped: done,),
          ],
        ),
      ),
    );
  }

  void uploadFromCamera()async {
     XFile? image = await picker.pickImage(source: ImageSource.camera);
     setState(() {
       _image = image;
     });

  }
  void uploadFromGallery()async {
    XFile? image = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = image;
    });

  }

  void done()async {
    if(nameController.text.isEmpty||_image==null)
      {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content:Text("Invalid username or image not exist",style: TextStyle(color: Colors.white),),
          backgroundColor: Colors.redAccent,shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(12.r)),
          padding: EdgeInsets.all(10.r),
          )
        );
        return;
      }

    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content:Text("Login Successfully",style: TextStyle(color: Colors.white),),
          backgroundColor: Colors.green,shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(12.r)),
          padding: EdgeInsets.all(10.r),
          duration: Duration(milliseconds: 200),
        )
    );
    Future.delayed(Duration(milliseconds: 200)).then((value) {
      box =  Hive.box<User>(AppConstants.userBoxName);

      box.put(AppConstants.currentUserKey,User(name: nameController.text,image: _image?.path??"")).then((value) {
        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) =>HomeScreen(),), (route) => false,);
      },);
    },);
}

}
