
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

class ProfileImageWidget extends StatelessWidget {
  const ProfileImageWidget({super.key, this.image});
final XFile ? image;
  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: image==null,
      replacement:Container(clipBehavior: Clip.none,
          height: 200.h,
          width: 200.w,
          decoration: BoxDecoration(shape: BoxShape.circle,
          image:DecorationImage(
            fit: BoxFit.cover,
              image: Image.file(File(image?.path??"")).image)),

      ) ,
      child: CircleAvatar(
          backgroundColor: Color(0xff2F2F2F),
          radius:70.r ,
          child:Icon(Icons.person_rounded,size: 140.r,color: Colors.indigo,)
      ),
    );
  }
}
