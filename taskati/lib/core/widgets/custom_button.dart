import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key,required this.title, this.tapped});
final String title;
final void Function()? tapped;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: tapped,
      style: ButtonStyle(
        fixedSize: WidgetStatePropertyAll(Size(240.w,35.h)),
        backgroundColor: WidgetStatePropertyAll(Colors.indigo),
          foregroundColor: WidgetStatePropertyAll(Colors.white),
          shape: WidgetStatePropertyAll(RoundedRectangleBorder
            (borderRadius: BorderRadiusGeometry.circular(10.r)))),
      child:Text(title,style: TextStyle(fontSize: 20.sp,fontWeight: FontWeight.w400),),
    );
  }
}
