import 'package:blood_bank/Presentation/screens/home_screen/widgets/action_button.dart';
import 'package:blood_bank/Presentation/widgets/custom_circular_progress_indicator.dart';
import 'package:blood_bank/bisnesse_logic/fetch_all_requests/fetch_all_requests_bloc.dart';
import 'package:blood_bank/constants/g_colors.dart';
import 'package:blood_bank/constants/g_sizes.dart';
import 'package:blood_bank/constants/g_style.dart';
import 'package:blood_bank/data/repositories/user_repository.dart';
import 'package:blood_bank/data/services/firebase_service.dart';
import 'package:blood_bank/utils/open_whatsapp.dart';
import 'package:blood_bank/utils/time_ago.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DonationRequestsList extends StatelessWidget {
  const DonationRequestsList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final email = FirebaseRepository(FirebaseService()).userEmail;
    final bloc = context.read<FetchAllRequestsBloc>();

    return BlocBuilder<FetchAllRequestsBloc, FetchAllRequestsState>(
      builder: (context, state) {
        if (state is FetchRequestLoadingState) {
          return Center(child: customCircularProgressIndicator());
        } else if (state is FetchRequestLoadedState) {
          final data = state.data;
          return ListView.builder(
              shrinkWrap: true,
              physics: AlwaysScrollableScrollPhysics(),
              itemCount: data.length,
              itemBuilder: (context, i) {
                return Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: GColors.white,
                          borderRadius: BorderRadius.circular(10)),
                      width: double.infinity,
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                color: GColors.primaryColor,
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(10),
                                    bottomRight: Radius.circular(10))),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("مطلوب دم : ${data[i]['bloodType']}",
                                      style: GStyle.btnTextStyle),
                                  Text(() {
                                    final timestamp =
                                        data[i]['createdAt'] as Timestamp?;
                                    if (timestamp == null) {
                                      return 'تاريخ غير متوفر';
                                    }
                                    final createdAt = timestamp.toDate();
                                    return timeAgo(createdAt);
                                  }(), style: GStyle.btnTextStyle)
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                bottom: 10, left: 10, right: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: GSizes.spaceBetweenItems),
                                Text("في مستشفى : ${data[i]['hospital']}",
                                    style: GStyle.subTitleStyle),
                                SizedBox(height: GSizes.spaceBetweenItems),
                                Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      color: GColors.warmWhite,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text("ملاحظة : ${data[i]["note"]}",
                                        style: GStyle.subTitleStyle),
                                  ),
                                ),
                                SizedBox(
                                    height: GSizes.spaceBetweenItems * 1.5),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                        child: ActionButton(
                                      label: "تبرع",
                                      color: GColors.primaryColor,
                                      icon: Icons.volunteer_activism,
                                      onPressed: () {
                                        final phone = data[i]['phoneDonor'];
                                        openWhatsApp(phone);
                                      },
                                    )),
                                    SizedBox(width: 5),
                                    Expanded(
                                        child: ActionButton(
                                            label: "رفض",
                                            color: Color(0xFFBDBDBD),
                                            onPressed: () async {
                                              final currentBloc = bloc;
                                              final currentEmail = email;

                                              final requestId = data[i]["id"];
                                              await FirebaseRepository(
                                                      FirebaseService())
                                                  .deleteRequestById(requestId);
                                              currentBloc.add(FetchRequestEvent(
                                                  email: currentEmail));
                                            },
                                            icon: Icons.block)),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: GSizes.spaceBetweenSections)
                  ],
                );
              });
        }
        return Center(
            child: Text("لا توجد طلبات", style: GStyle.subTitleStyle));
      },
    );
  }
}
