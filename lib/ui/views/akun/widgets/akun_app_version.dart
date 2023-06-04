import 'package:flutter/material.dart';
import 'package:stacked_hooks/stacked_hooks.dart';

import '../../../../../flavors.dart';
import '../../../shared/styles.dart';
import '../akun_viewmodel.dart';

class AkunAppVersion extends HookViewModelWidget<AkunViewModel> {
  const AkunAppVersion({Key? key}) : super(key: key);

  @override
  Widget buildViewModelWidget(
    BuildContext context,
    AkunViewModel viewModel,
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
