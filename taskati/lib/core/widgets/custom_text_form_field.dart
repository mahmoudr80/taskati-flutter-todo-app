import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({super.key, required this.hintText,
    this.cusIcon, this.maxLines=1, this.tapped,  this.readOnly=false, this.controller,
  this.validator});
final String hintText;
final Icon? cusIcon;
final int maxLines;
final void Function()?tapped;
final bool readOnly;
final TextEditingController? controller;
 final String? Function(String?)?validator;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: validator,
      controller: controller,
      onTap: tapped,
      readOnly: readOnly,
      maxLines: maxLines,
      onTapOutside: (event) => FocusScope.of(context).unfocus(),
      decoration: InputDecoration(
        suffixIcon:cusIcon,
        hintText: hintText,
        border:OutlineInputBorder(borderRadius: BorderRadius.circular(12.r)),
        focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12.r),
            borderSide: BorderSide(color: Colors.indigo)),
        errorBorder:   OutlineInputBorder(borderRadius: BorderRadius.circular(12.r),
        borderSide: BorderSide(color: Colors.redAccent)),
      ),
    );
  }
}
