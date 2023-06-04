import 'package:auto_size_text/auto_size_text.dart';
import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../application/app/constants/custom_color.dart';
import '../../../../shared/custom_button.dart';
import '../../../../shared/styles.dart';
import 'guide_badge.dart';

class ModalListGuide extends StatelessWidget {
  const ModalListGuide({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Center(child: _buildModalIndicator()),
        Container(
          padding: const EdgeInsets.only(top: 20),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20),
            // scrollDirection: Axis.vertical,
            // shrinkWrap: true,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const AutoSizeText(
                  'Penjelasan',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 24.h),
                Row(
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
                          child: const Text(
                            'FF',
                            style: TextStyle(
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
                            child: GuideBadge(
                              badgeText: '1',
                              child: Container(
                                height: 20,
                                width: 44,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4),
                                  color: Colors.white,
                                ),
                                child: const Text(
                                  'PTR',
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w700,
                                    color: Color(0xff03213E),
                                  ),
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: GuideBadge(
                                  badgeText: '2',
                                  child: Text(
                                    'PT. Frozen Food Abadi',
                                    style: tsHeading8,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 8),
                              GuideBadge(
                                badgeText: '6',
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 8,
                                    vertical: 3,
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(3),
                                    color: const Color(0xffFBE7E9),
                                  ),
                                  child: Text(
                                    'H-7 jatuh tempo',
                                    style: tsCaption2.copyWith(
                                      color: const Color(0xffD70C24),
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 1),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              GuideBadge(
                                badgeText: '3',
                                child: Text(
                                  '#24',
                                  style: tsHeading10DarkGrey,
                                ),
                              ),
                              Text(
                                ' ∙ ',
                                style: tsHeading10DarkGrey,
                              ),
                              GuideBadge(
                                badgeText: '4',
                                child: Text(
                                  'Rp 375.000.000',
                                  style: tsHeading10DarkGrey,
                                ),
                              ),
                              Text(
                                ' ∙ ',
                                style: tsHeading10DarkGrey,
                              ),
                              Badge(
                                badgeContent: const Text(
                                  '5',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 10,
                                  ),
                                ),
                                badgeColor: Colors.black,
                                position: BadgePosition.topStart(top: -12),
                                child: Badge(
                                  badgeContent: const Text(
                                    '2',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 10,
                                    ),
                                  ),
                                  badgeColor: CustomColor.primaryOrange,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 1),
                          Text(
                            'Plafond: Rp 500.000.000',
                            style: tsHeading10DarkGrey,
                          ),
                          /*Row(
                        mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Rp. ${formatter.format(totalLoanApproved)}',
                            style: tsHeading10DarkGrey,
                          ),
                          const SizedBox(width: 8),
                          Row(
                            children: [
                              Text(
                                'Jatuh Tempo: ',
                                style: tsCaption2,
                              ),
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
                SizedBox(height: 24.h),
                const AutoSizeText('1 = LoanType Debitur'),
                SizedBox(height: 8.h),
                const AutoSizeText('2 = Nama Debitur'),
                SizedBox(height: 8.h),
                const AutoSizeText('3 = Pencairan ke-24 dari Debitur'),
                SizedBox(height: 8.h),
                const AutoSizeText('4 = Nominal pencairan ke-24'),
                SizedBox(height: 8.h),
                const AutoSizeText('5 = Ada 2 pencairan aktif'),
                SizedBox(height: 8.h),
                const AutoSizeText('6 = Status pencairan'),
                SizedBox(height: 24.h),
                CustomButton(
                  labelColor: Colors.white,
                  color: CustomColor.secondaryBlue,
                  label: 'Tutup',
                  onPressed: () => Navigator.pop(context),
                  isBusy: false,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildModalIndicator() {
    return Container(
      height: 10,
      width: 100,
      margin: const EdgeInsets.only(bottom: 10),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(6),
        ),
        color: Colors.white,
      ),
    );
  }
}
