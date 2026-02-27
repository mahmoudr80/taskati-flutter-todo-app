import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:taskati/features/add_task/widgets/time_of_day_picker.dart';

import '../../../core/validators/input_validator.dart';
import '../../../core/widgets/custom_text_form_field.dart';
import 'date_time_picker.dart';

class FormWidget extends StatelessWidget {
  const FormWidget({super.key,required this.formKey, required this.dateController, required this.titleController, required this.descriptionController, required this.startTimeController, required this.endTimeController});
final GlobalKey<FormState> formKey;
final TextEditingController dateController;
final TextEditingController titleController;
final TextEditingController descriptionController;
final TextEditingController startTimeController;
final TextEditingController endTimeController;

  @override
  Widget build(BuildContext context) {
     DateTime ?date;
     TimeOfDay? startTime;
     TimeOfDay? endTime;
    var textTheme=Theme.of(context).textTheme;
    return Form(
        key: formKey,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 5.h,
            children: [
              Text("Title",style: textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold,),),
              CustomTextFormField(controller: titleController,hintText: "Enter title",
                validator: (value) => InputValidator.titleTask(value),),

              Text("Description",style: textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold,),),
              CustomTextFormField(controller: descriptionController,hintText: "Enter description"
                ,maxLines: 4,validator:(value) =>  InputValidator.descriptionTask(value),),

              Text("Date",style: textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold,),),
              CustomTextFormField(
                validator:(value) => value ==""?"date is required":null,
                controller: dateController,
                hintText: "date toDo",
                cusIcon:Icon( Icons.date_range),readOnly: true,
                tapped:()async {
                  date =await pickDate(context);
                  if(date!=null){
                    dateController.text=DateFormat.yMMMMd().format(date!).toString();
                  }

                },),
              Row(
                children: [
                  Text("Start Time",style: textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold,),),
                  Spacer(),
                  Text("End Time",style: textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold,),),
                  Spacer(),
                ],
              ),
              Row(
                children: [
                  Expanded(child: CustomTextFormField(
                    validator:(value) =>  InputValidator.startTime(value),
                    controller:startTimeController
                    ,hintText: "From",
                    cusIcon:Icon( Icons.timer_outlined),readOnly: true,
                    tapped: () async{
                      startTime=await pickTime(context);
                      if(startTime!=null){
                        startTimeController.text=startTime!.format(context).toString();
                      }
                    },)),
                  SizedBox(width: 10.w,),

                  Expanded(child: CustomTextFormField(
                    validator:(value) =>InputValidator.endTime(value, startTime,endTime),
                    controller:endTimeController
                    ,hintText: "From",
                    cusIcon:Icon( Icons.timer_outlined),readOnly: true,
                    tapped: () async{
                      endTime=await pickTime(context);
                      if(endTime!=null){
                        endTimeController.text=endTime!.format(context).toString();
                      }
                    },)),
                ],
              ),]));
  }
}
