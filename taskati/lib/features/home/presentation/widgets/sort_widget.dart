import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../cubit/home_cubit.dart';

class _CustomSortWidget extends StatelessWidget {
  const _CustomSortWidget({super.key,this.backColor=Colors.white, required this.title,  this.forColor=Colors.black, this.tapped});
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


class SortWidget extends StatelessWidget {
  const SortWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (previous, current) => current.type == EnType.task,
      builder: (context, state) {
        return SizedBox(
          height: 40.h,
          child: ListView.separated(
            itemBuilder: (context, index) {
              return currentIndex == index
                  ? _CustomSortWidget(
                title: sortList[index],
                backColor: Colors.indigo,
                forColor: Colors.white,
                tapped: () {
                  currentIndex = index;
                  context.read<HomeCubit>().sorting(
                    currentIndex,
                  );
                },
              )
                  : _CustomSortWidget(
                title: sortList[index],
                tapped: () {
                  currentIndex = index;
                  context.read<HomeCubit>().sorting(
                    currentIndex,
                  );
                },
              );
            },
            separatorBuilder: (context, index) =>
                SizedBox(width: 7.w),
            itemCount: sortList.length,
            scrollDirection: Axis.horizontal,
          ),
        );

      },
    );
  }
}
