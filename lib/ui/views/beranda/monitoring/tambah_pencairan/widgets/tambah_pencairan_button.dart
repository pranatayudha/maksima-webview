import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../application/app/constants/custom_color.dart';
import '../../../../../shared/custom_button.dart';

class TambahPencairanButton extends StatelessWidget {
  final int step;
  final Future<dynamic> Function()? onPressedSebelumnya;
  final Future<dynamic> Function()? onPressedSelanjutnya;
  const TambahPencairanButton({
    Key? key,
    required this.step,
    this.onPressedSebelumnya,
    this.onPressedSelanjutnya,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(12),
          topLeft: Radius.circular(12),
        ),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(40, 41, 61, 0.08),
            blurRadius: 8,
            offset: Offset(0, 2),
          ),
          BoxShadow(
            color: Color.fromRGBO(96, 97, 112, 0.24),
            blurRadius: 32,
            offset: Offset(0, 20),
          ),
        ],
      ),
      child: (step == 1) ? _buildButtonStepOne() : _buildButtonStepTwo(),
    );
  }

  CustomButton _buildButtonStepOne() {
    return CustomButton(
      label: 'Selanjutnya',
      onPressed: () => onPressedSelanjutnya,
      isBusy: false,
    );
  }

  Row _buildButtonStepTwo() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: CustomButton(
            labelColor: CustomColor.secondaryBlue,
            label: 'Sebelumnya',
            onPressed: onPressedSebelumnya,
            isBusy: false,
            isOutlineButton: true,
          ),
        ),
        SizedBox(
          width: 10.w,
        ),
        Expanded(
          child: CustomButton(
            label: 'Ajukan Pencairan',
            onPressed: onPressedSelanjutnya,
            isBusy: false,
          ),
        ),
      ],
    );
  }
}
