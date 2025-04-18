import 'package:blood_bank/Presentation/screens/home_screen/widgets/app_banners.dart';
import 'package:blood_bank/Presentation/screens/home_screen/widgets/appbar_home_screen.dart';
import 'package:blood_bank/Presentation/screens/home_screen/widgets/categories_widget.dart';
import 'package:blood_bank/Presentation/screens/home_screen/widgets/donation_requests_list.dart';
import 'package:blood_bank/bisnesse_logic/fetch_all_requests/fetch_all_requests_bloc.dart';
import 'package:blood_bank/constants/g_sizes.dart';
import 'package:blood_bank/constants/g_style.dart';
import 'package:blood_bank/data/repositories/user_repository.dart';
import 'package:blood_bank/data/services/firebase_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final email = FirebaseRepository(FirebaseService()).userEmail;
      context.read<FetchAllRequestsBloc>().add(FetchRequestEvent(email: email));
    });

    return Scaffold(
      appBar: AppBarHomeScreen(),
      body: SingleChildScrollView(
        child: Padding(
          padding: GSizes.screenPadding,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            AppBanners(),
            SizedBox(height: GSizes.spaceBetweenSections * 2),
            CategoriesWidget(),
            SizedBox(height: GSizes.spaceBetweenSections * 2),
            Text("طلبات التبرع", style: GStyle.titleStyle),
            SizedBox(height: GSizes.spaceBetweenSections),
            DonationRequestsList(),
          ]),
        ),
      ),
    );
  }
}
