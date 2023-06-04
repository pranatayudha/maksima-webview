import 'package:flutter/material.dart';
import 'package:stacked_hooks/stacked_hooks.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../../../../application/app/app.locator.dart';
import '../../../../../../application/enums/dialog_type.dart';
import '../../../../../shared/styles.dart';
import '../monitoring_detail_viewmodel.dart';

class InfoMenuItem extends HookViewModelWidget<MonitoringDetailViewModel> {
  final String label;
  final String iconPath;

  const InfoMenuItem({
    required this.label,
    required this.iconPath,
    Key? key,
  }) : super(key: key);

  @override
  Widget buildViewModelWidget(
    BuildContext context,
    MonitoringDetailViewModel viewModel,
  ) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 8,
                spreadRadius: 6,
                offset: const Offset(2, 2),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Material(
              child: InkWell(
                onTap: () => _showInDevelopmentDialog(),
                child: SizedBox(
                  height: 72,
                  width: 72,
                  child: Image.asset(
                    iconPath,
                    scale: 3,
                  ),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 6),
        Text(
          label,
          style: tsHeading12,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Future _showInDevelopmentDialog() => locator<DialogService>()
      .showCustomDialog(variant: DialogType.inDevelopment);
}
