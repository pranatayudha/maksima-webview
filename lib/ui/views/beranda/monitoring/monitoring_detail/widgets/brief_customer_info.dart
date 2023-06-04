import 'package:flutter/material.dart';

import '../../../../../../application/app/constants/custom_color.dart';
import '../../../../../../application/models/monitoring_detail.dart';
import '../../../../../shared/styles.dart';

class BriefCustomerInfo extends StatelessWidget {
  final Header? header;

  const BriefCustomerInfo({Key? key, required this.header}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(11, 3, 16, 18),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Material(
                elevation: 1.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const SizedBox(width: 56, height: 56),
              ),
              // Positioned(
              //   top: 0,
              //   bottom: -10,
              //   right: 0,
              //   left: 0,
              //   child: Align(
              //     alignment: Alignment.bottomCenter,
              //     child: Material(
              //       elevation: 1.0,
              //       shape: RoundedRectangleBorder(
              //         borderRadius: BorderRadius.circular(4),
              //       ),
              //       child: const SizedBox(width: 44, height: 20),
              //     ),
              //   ),
              // ),
              Container(
                width: 56,
                height: 56,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: const Color(0xffE6EEF5),
                ),
                child: Text(
                  header?.initial ?? '',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: CustomColor.primaryBlue,
                  ),
                ),
              ),
              Positioned(
                top: 0,
                bottom: -10,
                right: 0,
                left: 0,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: 20,
                    width: 44,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: Colors.white,
                    ),
                    child: Text(
                      header?.loanType != null
                          ? (header!.loanType == 1 ? 'PTR' : 'PARI')
                          : '-',
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                        color: Color(0xff03213E),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /*if (loanNumber != 0)
                Padding(
                  padding: const EdgeInsets.only(bottom: 2),
                  child: Text(
                    'Pinjaman #$loanNumber'.toUpperCase(),
                    style: tsCaption1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),*/
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    header?.namaDebitur ?? '-',
                    style: tsHeading8White,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
              const SizedBox(height: 1),
              if (header?.partner == null) ...[
                Text(
                  'Partnership - Tidak Ada',
                  style: tsHeading12OWhite60,
                ),
              ] else ...[
                Text(
                  '${header?.picName} - ${header?.picPhone}',
                  style: tsHeading12OWhite60,
                ),
                const SizedBox(height: 1),
                Text(
                  'Partnership - ${header?.partner}',
                  style: tsHeading12OWhite60,
                ),
              ],
            ],
          ),
        ],
      ),
    );
  }
}
