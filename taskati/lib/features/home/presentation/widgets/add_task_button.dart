import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddTaskButton extends StatelessWidget {
  const AddTaskButton({super.key, this.tapped});
      final void Function()? tapped;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: tapped,
      child: Container(
        padding: EdgeInsets.all(10.r),
        decoration: BoxDecoration(color: Colors.indigo,borderRadius: BorderRadiusGeometry.circular(12.r)),
        child:
        Row(
          children: [
          Icon(Icons.add,color: Colors.white,),
            Text("Add Task",style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.white),)

          ],
        ),
      ),
    );
  }
}
