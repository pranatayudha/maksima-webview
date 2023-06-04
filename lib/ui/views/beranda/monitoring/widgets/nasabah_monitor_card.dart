import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../../application/app/constants/custom_color.dart';
import '../../../../shared/styles.dart';

final formatter = NumberFormat('#,###', 'id_ID');

class NasabahMonitorCard extends StatelessWidget {
  final int? loanType;
  final String initials;
  final String nama;
  final int? numberOfTransaction;
  final double? totalTransaction;
  final double? totalLoanApproved;
  final String status;
  final Function onPressed;

  const NasabahMonitorCard({
    required this.loanType,
    required this.initials,
    required this.nama,
    required this.numberOfTransaction,
    required this.totalTransaction,
    required this.totalLoanApproved,
    required this.status,
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => onPressed(),
      style: TextButton.styleFrom(
        padding: const EdgeInsets.all(16),
      ),
      child: Row(
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
              Positioned(
                top: 0,
                bottom: -10,
                right: 0,
                left: 0,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Material(
                    elevation: 1.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: const SizedBox(width: 44, height: 20),
                  ),
                ),
              ),
              Container(
                width: 56,
                height: 56,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: const Color(0xffE6EEF5),
                ),
                child: Text(
                  initials,
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
                      loanType != null ? (loanType == 1 ? 'PTR' : 'PARI') : '-',
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
          Expanded(
            child: Column(
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
                    Expanded(
                      child: Text(
                        nama,
                        style: tsHeading8,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 3,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(3),
                        color: _parseStatusToColor(status)[0],
                      ),
                      child: Text(
                        status,
                        style: tsCaption2.copyWith(
                          color: _parseStatusToColor(status)[1],
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                // const SizedBox(height: 1),
                // Text(
                //   // '#${numberOfTransaction ?? 0} · ${(totalTransaction != null && totalTransaction != 0) ? 'Rp ${formatter.format(totalTransaction)}' : '-'}',
                //   '#${numberOfTransaction ?? 0}',
                //   style: tsHeading10DarkGrey,
                // ),
                const SizedBox(height: 1),
                Text(
                  totalLoanApproved != null
                      ? 'Plafond: Rp ${formatter.format(totalLoanApproved)}'
                      : '-',
                  style: tsHeading10DarkGrey,
                ),
                /*Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Rp. ${formatter.format(totalLoanApproved)}',
                      style: tsHeading10DarkGrey,
                    ),
                    const SizedBox(width: 8),
                    Row(
                      children: [
                        Text('Jatuh Tempo: ', style: tsCaption2),
                        Text(dueDate, style: tsCaption1),
                      ],
                    ),
                  ],
                ),*/
              ],
            ),
          ),
        ],
      ),
    );
  }

  List<Color> _parseStatusToColor(String? status) {
    status = status?.toLowerCase();

    if (status != null) {
      if (status == 'aktif' || status == 'lunas') {
        return [
          CustomColor.green.withOpacity(0.1),
          CustomColor.green,
        ];
      }

      if (status.startsWith('h -')) {
        return const [
          Color(0xFFFDF6ED),
          Color(0xFFF07125),
        ];
      }

      if (status == 'approval cbl' || status == 'konfirmasi cbl' || status == 'verifikasi adk') {
        return const [
          Color(0xFFFFF0B3),
          Color(0xFF4C3E00),
        ];
      }

      // if (status.startsWith('jatuh tempo')) {
      //   return [
      //     CustomColor.orange.withOpacity(0.1),
      //     CustomColor.orange,
      //   ];
      // }

      if (status == 'jatuh tempo' || status.startsWith('telat') || status == 'ditolak') {
        return [
          CustomColor.primaryRed.withOpacity(0.1),
          CustomColor.primaryRed,
        ];
      }

      if (status.startsWith('terlambat')) {
        return [
          CustomColor.primaryRed,
          const Color(0xFFFFCFC8),
        ];
      }
    }

    return [
      CustomColor.primaryBlue10,
      CustomColor.primaryBlue,
    ];
  }
}
