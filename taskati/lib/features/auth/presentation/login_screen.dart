import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:image_picker/image_picker.dart';
import 'package:taskati/core/constants/app_constants.dart';
import 'package:taskati/core/utils/app_snckbar.dart';
import 'package:taskati/core/widgets/custom_button.dart';
import 'package:taskati/features/auth/presentation/widgets/custom_text_form.dart';
import 'package:taskati/features/auth/presentation/widgets/profile_image_widget.dart';
import 'package:taskati/features/home/data/datasources/home_local_datasource.dart';
import 'package:taskati/features/home/data/repository/home_repository.dart';
import 'package:taskati/features/home/presentation/cubit/home_cubit.dart';
import 'package:taskati/features/home/presentation/home_screen.dart';
import '../../../core/service/user_class.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  XFile? _image;
  ImagePicker picker = ImagePicker();
  late Box<User> box;
  TextEditingController nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: MediaQuery.of(context).size.height,
          ),
          child: IntrinsicHeight(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 25.h),
              child: Column(
                spacing: 11.h,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ProfileImageWidget(image: _image),
                  CustomButton(
                    title: "Upload From Camera",
                    tapped: uploadFromCamera,
                  ),
                  CustomButton(
                    title: "Upload From Gallery",
                    tapped: uploadFromGallery,
                  ),
                  Divider(),
                  Flexible(child: CustomTextForm(controller: nameController)),
                  CustomButton(title: "Done", tapped: done),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void uploadFromCamera() async {
    XFile? image = await picker.pickImage(source: ImageSource.camera);
    setState(() {
      _image = image;
    });
  }

  void uploadFromGallery() async {
    XFile? image = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = image;
    });
  }

  void done() async {
    if (nameController.text.isEmpty || _image == null) {
    AppSnackbar.showError(context,  "Invalid username or image not exist");
      return;
    }

    AppSnackbar.showSuccess(context, "Login Successfully");

    Future.delayed(Duration(milliseconds: 200)).then((value) {
      box = Hive.box<User>(AppConstants.userBoxName);
      box
          .put(
            AppConstants.currentUserKey,
            User(name: nameController.text, image: _image?.path ?? ""),
          )
          .then((value) {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => BlocProvider(
                  create: (context) =>
                      HomeCubit(HomeRepository(HomeLocalDatasource()))
                        ..loading(),
                  child: HomeScreen(),
                ),
              ),
              (route) => false,
            );
          });
    });
  }
}
