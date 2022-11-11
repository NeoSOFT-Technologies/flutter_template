

import 'package:app/di/states/viewmodels.dart';
import 'package:app/feature/tabs/profile/profile_page_model.dart';
import 'package:app/feature/tabs/profile/profile_page_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';

class ProfilePage extends BasePage<ProfileViewModel> {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  ProfilePageState createState() => ProfilePageState();
}

class ProfilePageState extends BaseStatefulPage<ProfileViewModel, ProfilePage> {


  @override
  Widget buildView(BuildContext context, ProfileViewModel model) {
    return ProfilePageView(provideBase());
  }

  @override
  ProviderBase<ProfileViewModel> provideBase() {
    return profileViewModelProvider;
  }
}