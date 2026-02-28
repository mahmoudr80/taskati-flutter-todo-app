import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SortWidget extends StatelessWidget {
  const SortWidget({super.key,this.backColor=Colors.white, required this.title,  this.forColor=Colors.black, this.tapped});
final Color backColor;
final Color forColor;
final String title;
final void Function()?tapped;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: tapped,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal:20.w,vertical: 10.h),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(100.r),color: backColor,boxShadow:[BoxShadow(
          color: Colors.black.withAlpha(40),blurRadius: 6,offset: Offset(0,2),spreadRadius: 2
        )] ),
        child: Text(title,style: Theme.of(context).textTheme.titleMedium?.copyWith(color: forColor),),
      ),
    );
  }
}
