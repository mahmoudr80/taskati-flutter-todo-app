
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget{
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: Theme.of(context).iconTheme.copyWith(
          color: Colors.indigo
      ),
      centerTitle: true,
      title: Text("Add Task",style: Theme.of(context).textTheme.headlineSmall?.copyWith(
          color: Colors.indigo
      ),),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
