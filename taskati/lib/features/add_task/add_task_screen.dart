import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taskati/core/widgets/custom_button.dart';
import 'package:taskati/features/add_task/widgets/color_widget.dart';
import 'package:taskati/features/add_task/widgets/custom_app_bar.dart';
import 'package:taskati/features/add_task/widgets/form_widget.dart';
import 'package:taskati/features/home/data/model/task_model.dart';

    class AddTaskScreen extends StatelessWidget {
      const AddTaskScreen({super.key});
      @override
      Widget build(BuildContext context) {
        var formKey = GlobalKey<FormState>();
        final TextEditingController dateController=TextEditingController();
        final TextEditingController titleController=TextEditingController();
        final TextEditingController descriptionController=TextEditingController();
        final TextEditingController startTimeController=TextEditingController();
        final TextEditingController endTimeController=TextEditingController();
        late int colorValue;
        var textTheme=Theme.of(context).textTheme;
        return Scaffold(
          appBar: CustomAppBar(),
          body: Padding(
            padding:  EdgeInsets.all(18.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  FormWidget(formKey: formKey, dateController: dateController, titleController: titleController, descriptionController: descriptionController, startTimeController: startTimeController, endTimeController: endTimeController),
                    ColorWidget(onColorSelected: (colVal) {
                      colorValue=colVal;
                    },),
                    SizedBox(height: 15.h,),

                    Row(
                      children: [
                        Expanded(child: CustomButton(title: "Create Task",tapped: (){
                         if(formKey.currentState?.validate()??false){
                           ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Task saved successfully"),
                             backgroundColor: Theme.of(context).colorScheme.primary,shape: RoundedRectangleBorder(borderRadius:
                             BorderRadiusGeometry.circular(25.r)),));

                           Navigator.pop(context,TaskModel(statusText:
                           "ToDo", colorValue:colorValue,
                               title: titleController.text, description: descriptionController.text,
                               start: startTimeController.text, end: endTimeController.text));
                         }
                         else{
                           ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Invalid Information"),
                             backgroundColor: Theme.of(context).colorScheme.error,shape: RoundedRectangleBorder(borderRadius:
                             BorderRadiusGeometry.circular(25.r)),));
                           return;
                         }
                        },)),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
      }
}
