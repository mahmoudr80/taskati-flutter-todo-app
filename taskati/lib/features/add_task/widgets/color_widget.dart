import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ColorWidget extends StatefulWidget {
  const ColorWidget({super.key, required this.onColorSelected});
final Function(int colVal)onColorSelected;
  @override
  State<ColorWidget> createState() => _ColorWidgetState();
}

class _ColorWidgetState extends State<ColorWidget> {
  List<Color>listOfColors=[Colors.indigo,Colors.deepOrangeAccent,Colors.red];
  int currentIndex =0;
  @override
  Widget build(BuildContext context) {
    var textTheme=Theme.of(context).textTheme;
    return Column(
      children: [
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
                  widget.onColorSelected(listOfColors[index].toARGB32());
                },
                child: Container(
                    height: 40.r,
                    width: 40.r,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(50.r),
                        color: listOfColors[index]),
                    child: currentIndex==index?Icon(Icons.done,color: Colors.white,):null),
              ),),
          ],
        )  ],
    );
  }
}
