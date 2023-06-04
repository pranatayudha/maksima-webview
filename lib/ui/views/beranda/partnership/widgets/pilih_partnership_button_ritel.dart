import 'package:flutter/material.dart';

import '../../../../../application/app/constants/icon_constants.dart';
import '../../../../shared/styles.dart';

class PilihPartnershipButtonRitel extends StatelessWidget {
  final Function onPressed;
  final String? choice;

  const PilihPartnershipButtonRitel({
    required this.onPressed,
    required this.choice,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 5, bottom: 10),
      child: OutlinedButton(
        onPressed: () => onPressed(),
        style: OutlinedButton.styleFrom(
          backgroundColor: const Color(0xffF1F8FF),
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 14,
          ),
          side: const BorderSide(color: Color(0xff027DEF)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Pilih Partnership',
                  style: choice != null ? tsDarkGrey : tsHeading8,
                ),
                const SizedBox(height: 4),
                Text(
                  choice ?? 'Belum Memilih Partnership',
                  style: choice != null ? tsHeading8 : tsDarkGrey,
                ),
              ],
            ),
            Image.asset(
              IconConstants.chevronRight,
              scale: 3,
            ),
          ],
        ),
      ),
    );
  }
}
