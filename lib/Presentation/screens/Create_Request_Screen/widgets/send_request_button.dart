import 'package:blood_bank/Presentation/widgets/custom_button.dart';
import 'package:blood_bank/bisnesse_logic/send_request_bloc/bloc/send_request_bloc.dart';
import 'package:blood_bank/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SendRequestButton extends StatelessWidget {
  const SendRequestButton({
    super.key,
    required this.donor,
    required this.hospitalController,
    required this.noteController,
    required this.phoneDonorController,
  });

  final UserModel donor;
  final TextEditingController hospitalController;
  final TextEditingController noteController;
  final TextEditingController phoneDonorController;

  @override
  Widget build(BuildContext context) {
    return CustomButton(
        text: "إرسال الطلب",
        onPressed: () {
          context.read<SendRequestBloc>().add(AddRequestEvent(
              dEmail: donor.email,
              bloodType: donor.bloodType,
              hospital: hospitalController.text.trim(),
              note: noteController.text.trim(),
              phoneDonor: phoneDonorController.text.trim()));
        });
  }
}
