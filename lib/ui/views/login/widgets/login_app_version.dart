import 'package:flutter/material.dart';
import 'package:stacked_hooks/stacked_hooks.dart';

import '../../../../../flavors.dart';
import '../../../shared/styles.dart';
import '../login_viewmodel.dart';

class LoginAppVersion extends HookViewModelWidget<LoginViewModel> {
  const LoginAppVersion({Key? key}) : super(key: key);

  @override
  Widget buildViewModelWidget(
    BuildContext context,
    LoginViewModel viewModel,
  ) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'App Version ${_parseFlavor(F.appFlavor!)} v${viewModel.version ?? '-'} ',
          style: tsCaption1,
        ),
        Text(
          '(${viewModel.buildNumber ?? '-'})',
          style: tsCaption1,
        ),
      ],
    );
  }

  String _parseFlavor(Flavor flavor) {
    switch (flavor) {
      case Flavor.DEV:
        return 'DEV';
      case Flavor.STAGE:
        return 'STAGING';
      case Flavor.PROD:
        return 'PROD';
    }
  }
}
