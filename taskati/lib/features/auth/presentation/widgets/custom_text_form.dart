import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextForm extends StatelessWidget {
  const CustomTextForm({super.key, required this.controller});
final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onTapOutside: (event) => FocusScope.of(context).unfocus(),
      decoration: InputDecoration(
        hintText: "Enter your name",
          hintStyle: TextStyle(color: Colors.grey),
          enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8.r),
              borderSide: BorderSide(color: Colors.blue.shade900))
          ,focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8.r),
          borderSide: BorderSide(color: Colors.blue))
      ),
    );
  }
}
