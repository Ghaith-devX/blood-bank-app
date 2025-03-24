import 'package:blood_bank/bisnesse_logic/search_in_donors/search_donors_cubit.dart';
import 'package:blood_bank/constants/g_colors.dart';
import 'package:blood_bank/constants/g_sizes.dart';
import 'package:blood_bank/constants/g_style.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchBarFindDonorsScreen extends StatelessWidget {
  const SearchBarFindDonorsScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: TextField(
                onChanged: (searchDonors) {
                  context.read<SearchDonorsCubit>().serarchDonors(searchDonors);
                },
                decoration: InputDecoration(
                    filled: true,
                    fillColor: GColors.white,
                    hintText: "ابحث : نوع الدم ، عنوان المتبرع",
                    hintStyle: GStyle.subTitleStyle,
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(10))))),
        SizedBox(width: GSizes.spaceBetweenItems),
        Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
                color: GColors.primaryColor,
                borderRadius: BorderRadius.circular(5)),
            child: Icon(Icons.search, color: GColors.white)),
      ],
    );
  }
}
