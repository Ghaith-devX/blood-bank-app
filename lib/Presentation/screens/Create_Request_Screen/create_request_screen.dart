import 'package:blood_bank/Presentation/screens/Create_Request_Screen/widgets/send_request.dart';
import 'package:blood_bank/Presentation/screens/Create_Request_Screen/widgets/send_request_button.dart';
import 'package:blood_bank/Presentation/screens/auth/login_screen/widgets/custom_text_form_field.dart';
import 'package:blood_bank/Presentation/widgets/custom_button.dart';
import 'package:blood_bank/Presentation/widgets/custom_circular_progress_indicator.dart';
import 'package:blood_bank/Presentation/widgets/show_custom_snackbar.dart';
import 'package:blood_bank/bisnesse_logic/send_request_bloc/bloc/send_request_bloc.dart';
import 'package:blood_bank/constants/g_colors.dart';
import 'package:blood_bank/constants/g_sizes.dart';
import 'package:blood_bank/constants/g_style.dart';
import 'package:blood_bank/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateRequestScreen extends StatelessWidget {
  const CreateRequestScreen({required this.donor, super.key});
  final UserModel donor;
  @override
  Widget build(BuildContext context) {
    final TextEditingController hospitalController = TextEditingController();
    final TextEditingController phoneDonorController = TextEditingController();
    final TextEditingController noteController = TextEditingController();
    return Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Padding(
            padding: GSizes.screenPadding,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("الطلب مرسل للمتبرع :", style: GStyle.subTitleStyle),
                SizedBox(height: GSizes.spaceBetweenItems),
                Text(donor.username, style: GStyle.titleStyle),
                SizedBox(height: GSizes.spaceBetweenItems),
                Text("عنوان المتبرع : ", style: GStyle.subTitleStyle),
                SizedBox(height: GSizes.spaceBetweenItems),
                Row(
                  children: [
                    Icon(Icons.location_on, color: GColors.primaryColor),
                    SizedBox(width: GSizes.spaceBetweenItems - 5),
                    Text(donor.location, style: GStyle.titleStyle),
                  ],
                ),
                SizedBox(height: GSizes.spaceBetweenItems),
                Text("نوع الدم : ", style: GStyle.subTitleStyle),
                SizedBox(height: GSizes.spaceBetweenItems),
                Text(donor.bloodType, style: GStyle.titleStyle),
                SizedBox(height: GSizes.spaceBetweenSections),
                CustomTextFormField(
                    text: "المستشفى",
                    icon: Icons.location_city_rounded,
                    controller: hospitalController),
                SizedBox(height: GSizes.spaceBetweenItems),
                SizedBox(height: GSizes.spaceBetweenItems),
                CustomTextFormField(
                    text: "رقم الهاتف",
                    icon: Icons.phone,
                    controller: phoneDonorController),
                SizedBox(height: GSizes.spaceBetweenItems),
                CustomTextFormField(
                    text: "إضافة ملاحظة",
                    icon: Icons.note_add,
                    controller: noteController),
                SizedBox(height: GSizes.spaceBetweenSections * 2),
                SendRequestButton(
                    donor: donor,
                    hospitalController: hospitalController,
                    noteController: noteController,
                    phoneDonorController: phoneDonorController),
                SizedBox(height: GSizes.spaceBetweenSections),
                SendRequest()
              ],
            ),
          ),
        ));
  }
}
