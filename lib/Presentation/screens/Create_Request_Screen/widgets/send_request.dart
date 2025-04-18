import 'package:blood_bank/Presentation/widgets/custom_circular_progress_indicator.dart';
import 'package:blood_bank/Presentation/widgets/show_custom_snackbar.dart';
import 'package:blood_bank/bisnesse_logic/send_request_bloc/bloc/send_request_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SendRequest extends StatelessWidget {
  const SendRequest({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocListener<SendRequestBloc, SendRequestState>(
      listener: (context, state) {
        if (state is SendRequestError) {
          showCustomSnackBar(context, state.error);
        } else if (state is SendRequestLoaded) {
          Navigator.of(context).pop();
        }
      },
      child: BlocBuilder<SendRequestBloc, SendRequestState>(
        builder: (context, state) {
          if (state is SendRequestLoading) {
            return Center(child: customCircularProgressIndicator());
          }
          return SizedBox();
        },
      ),
    );
  }
}
