import 'package:blood_bank/bisnesse_logic/search_in_donors/search_donors_cubit.dart';
import 'package:blood_bank/constants/g_colors.dart';
import 'package:blood_bank/constants/g_sizes.dart';

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
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))))),
        SizedBox(width: GSizes.spaceBetweenItems),
        Container(
            decoration: BoxDecoration(
                color: GColors.primaryColor,
                borderRadius: BorderRadius.circular(5)),
            child: IconButton(
                onPressed: () {},
                icon: Icon(Icons.search, color: GColors.white))),
      ],
    );
  }
}
