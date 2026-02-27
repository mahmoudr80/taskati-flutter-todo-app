import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key,required this.title, this.tapped, this.height=35, this.width=240});
final String title;
final void Function()? tapped;
final double height;
final double width;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: tapped,
      style: ButtonStyle(
        fixedSize: WidgetStatePropertyAll(Size(width.w,height.h)),
        backgroundColor: WidgetStatePropertyAll(Colors.indigo),
          foregroundColor: WidgetStatePropertyAll(Colors.white),
          shape: WidgetStatePropertyAll(RoundedRectangleBorder
            (borderRadius: BorderRadiusGeometry.circular(10.r)))),
      child:Text(title,style: TextStyle(fontSize: 20.sp,fontWeight: FontWeight.w400),),
    );
  }
}
