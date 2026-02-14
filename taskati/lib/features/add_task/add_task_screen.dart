import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:intl/intl.dart';
import 'package:taskati/core/constants/app_constants.dart';
import 'package:taskati/core/validators/input_validator.dart';
import 'package:taskati/core/widgets/custom_button.dart';
import 'package:taskati/features/add_task/widgets/custom_app_bar.dart';
import 'package:taskati/core/widgets/custom_text_form_field.dart';
import 'package:taskati/features/add_task/widgets/time_of_day_picker.dart';
import 'package:taskati/features/add_task/widgets/date_time_picker.dart';
import 'package:taskati/features/home/data/model/task_model.dart';



    class AddTaskScreen extends StatefulWidget {
      const AddTaskScreen({super.key});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}
List<Color>listOfColors=[Colors.indigo,Colors.deepOrangeAccent,Colors.red];
class _AddTaskScreenState extends State<AddTaskScreen> {
  var formKey = GlobalKey<FormState>();
      TextEditingController dateController=TextEditingController();
      TextEditingController titleController=TextEditingController();
      TextEditingController descriptionController=TextEditingController();
      TextEditingController startTimeController=TextEditingController();
      TextEditingController endTimeController=TextEditingController();
      TimeOfDay? startTime;
      TimeOfDay? endTime;
      DateTime ?date;
  int currentIndex =0;
      @override
      Widget build(BuildContext context) {

        var textTheme=Theme.of(context).textTheme;
        return Scaffold(
          appBar: CustomAppBar(),
          body: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Form(
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
                  ),
                  Text("Color",style: textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold,),),
                Row(
                  spacing: 8.w,
                  children: [
                    ...List.generate(listOfColors.length,
                      (index) => InkWell(
                        onTap: () {
                        setState(() {
                          currentIndex=index;
                        });
                        },
                      child: Container(
                      height: 40.r,
                      width: 40.r,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(50.r),
                       color: listOfColors[index]),
                      child: currentIndex==index?Icon(Icons.done,color: Colors.white,):null),
                          ),),
                  ],
                )  ,
                  Spacer(),
                  Row(
                    children: [
                      Expanded(child: CustomButton(title: "Create Task",tapped: (){
                       if(formKey.currentState?.validate()??false){
                         Hive.box<TaskModel>(AppConstants.taskBoxName).add(TaskModel(statusText:
                         "ToDo", colorValue: listOfColors[currentIndex].value,
                             title: titleController.text, description: descriptionController.text,
                             start: startTimeController.text, end: endTimeController.text));
                         ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Task saved successfully"),
                         backgroundColor: Colors.green,shape: RoundedRectangleBorder(borderRadius:
                           BorderRadiusGeometry.circular(25.r)),));

                         Navigator.pop(context);
                       }
                       else{
                         ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Invalid Information"),
                           backgroundColor: Colors.redAccent,shape: RoundedRectangleBorder(borderRadius:
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
