// ignore_for_file: prefer-conditional-expressions

import 'package:flutter/material.dart';

import '../../../../../../../../../../application/app/constants/common.dart';
import '../../../../../../../../../shared/styles.dart';
import '../../../../../../../../pipeline/pipeline_details/widgets/ritel_data_lainnya_details.dart';

class RasioKeuanganRitel extends StatelessWidget {
  final double? debtToEquityRatio;
  final double? roe;
  final double? cr;
  final double? roa;
  final double? icr;
  final double? dop;
  final double? qr;
  final double? doi;
  final double? nwcPositif;
  final double? dor;
  final double? ebitda;
  final double? npm;
  final bool isPercentage;

  final double? roi;

  const RasioKeuanganRitel({
    required this.debtToEquityRatio,
    required this.roe,
    this.cr,
    this.roa,
    this.icr,
    this.dop,
    this.qr,
    this.doi,
    required this.nwcPositif,
    this.dor,
    this.ebitda,
    this.npm,
    required this.roi,
    this.isPercentage = true,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color? debtToEquityRatioColor;
    if (debtToEquityRatio != null) {
      if ((debtToEquityRatio! * 100) >= Common.debtToEquityRatioLimit) {
        debtToEquityRatioColor = Colors.red;
      } else {
        debtToEquityRatioColor = const Color(0xffF07126);
      }
    }
    Color? roeColor;
    if (roe != null) {
      if ((roe! * 100) <= Common.roeLimit) {
        roeColor = Colors.red;
      } else {
        roeColor = const Color(0xffF07126);
      }
    }
    Color? crColor;
    if (cr != null) {
      if ((cr! * 100) < Common.roeLimit) {
        crColor = Colors.red;
      } else {
        crColor = const Color(0xffF07126);
      }
    }
    Color? roaColor;
    if (roa != null) {
      if ((roa! * 100) <= Common.roeLimit) {
        roaColor = Colors.red;
      } else {
        roaColor = const Color(0xffF07126);
      }
    }
    Color? icrColor;
    if (icr != null) {
      if ((icr! * 100) <= Common.roiLimit) {
        icrColor = Colors.red;
      } else {
        icrColor = const Color(0xffF07126);
      }
    }

    Color? dopColor;
    if (dop != null) {
      if ((dop! * 100) <= Common.roiLimit) {
        dopColor = Colors.red;
      } else {
        dopColor = const Color(0xffF07126);
      }
    }
    Color? qrColor;
    if (qr != null) {
      if ((qr! * 100) <= Common.roiLimit) {
        qrColor = Colors.red;
      } else {
        qrColor = const Color(0xffF07126);
      }
    }
    Color? doiColor;
    if (doi != null) {
      if ((doi! * 100) <= Common.roiLimit) {
        doiColor = Colors.red;
      } else {
        doiColor = const Color(0xffF07126);
      }
    }
    Color? nwcPositifColor;
    if (nwcPositif != null) {
      if ((nwcPositif! * 100) <= Common.roiLimit) {
        nwcPositifColor = Colors.red;
      } else {
        nwcPositifColor = const Color(0xffF07126);
      }
    }
    Color? dorColor;
    if (dor != null) {
      if ((dor! * 100) <= Common.roiLimit) {
        dorColor = Colors.red;
      } else {
        dorColor = const Color(0xffF07126);
      }
    }
    Color? ebitdaColor;
    if (ebitda != null) {
      if ((ebitda! * 100) <= Common.roiLimit) {
        ebitdaColor = Colors.red;
      } else {
        ebitdaColor = const Color(0xffF07126);
      }
    }
    Color? npmColor;
    if (npm != null) {
      if ((npm! * 100) <= Common.roiLimit) {
        npmColor = Colors.red;
      } else {
        npmColor = const Color(0xffF07126);
      }
    }

    // Color? roiColor;
    // if (roi != null) {
    //   if ((roi! * 100) <= Common.roiLimit) {
    //     roiColor = Colors.red;
    //   } else {
    //     roiColor = Colors.green;
    //   }
    // }

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xffF6F6F8),
        border: Border.all(color: const Color(0xffE5E5E5)),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Expanded(
                  child: _buildLabelWithPercentageValue(
                    label: 'DER',
                    value: debtToEquityRatio,
                    color: debtToEquityRatioColor,
                  ),
                ),
                Expanded(
                  child: _buildLabelWithPercentageValue(
                    label: 'ROE',
                    value: roe,
                    color: roeColor,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 25),
            Row(
              children: [
                Expanded(
                  child: _buildLabelWithPercentageValue(
                    label: 'CR',
                    value: cr,
                    color: crColor,
                  ),
                ),
                Expanded(
                  child: _buildLabelWithPercentageValue(
                    label: 'ROA',
                    value: roa,
                    color: roaColor,
                  ),
                ),
              ],
            ),
            // _buildNWCPositif(),
            const SizedBox(height: 25),
            Row(
              children: [
                Expanded(
                  child: _buildLabelWithPercentageValue(
                    label: 'ICR',
                    value: icr,
                    color: icrColor,
                  ),
                ),
                Expanded(
                  child: _buildLabelValue(
                    label: 'DOP',
                    value: dop,
                    color: dopColor,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 25),
            Row(
              children: [
                Expanded(
                  child: _buildLabelWithPercentageValue(
                    label: 'QR',
                    value: qr,
                    color: qrColor,
                  ),
                ),
                Expanded(
                  child: _buildLabelValue(
                    label: 'DOI',
                    value: doi,
                    color: doiColor,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 25),
            Row(
              children: [
                Expanded(
                  child: _buildLabelValue(
                    label: 'NWC + (Rp 000,-)',
                    value: nwcPositif,
                    color: nwcPositifColor,
                  ),
                ),
                Expanded(
                  child: _buildLabelValue(
                    label: 'DOR',
                    value: dor,
                    color: dorColor,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 25),
            Row(
              children: [
                Expanded(
                  child: _buildLabelValue(
                    label: 'EBITDA (Rp 000,-)',
                    value: ebitda,
                    color: ebitdaColor,
                  ),
                ),
                Expanded(
                  child: _buildLabelWithPercentageValue(
                    label: 'NPM',
                    value: npm,
                    color: npmColor,
                  ),
                ),
              ],
            ),
            // const SizedBox(height: 25),
            // Row(
            //   children: [
            //     Expanded(
            //         child: _buildLabelWithPercentageValue(
            //       label: 'ROE',
            //       value: roe,
            //       color: roeColor,
            //     )),
            //     Expanded(
            //         child: _buildLabelWithPercentageValue(
            //       label: 'ROI',
            //       value: roi,
            //       color: roiColor,
            //     )),
            //   ],
            // ),
          ],
        ),
      ),
    );
  }

  Column _buildLabelWithPercentageValue({
    required String label,
    dynamic value,
    Color? color,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: tsCaption1),
        const SizedBox(height: 10),
        Text(
          '${value != null ? value.toStringAsFixed(2) : '0'} %',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
      ],
    );
  }

  Column _buildLabelValue({
    required String label,
    dynamic value,
    Color? color,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: tsCaption1),
        const SizedBox(height: 10),
        Text(
          value != null ? formatter.format(value) : '0',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
      ],
    );
  }

// Column _buildNWCPositif() {
//   final formatter = NumberFormat('#,###', 'id_ID');

//   Color? nwcPositifColor;
//   if (nwcPositif != null) {
//     if ((nwcPositif! * 100) <= Common.nwcPositifLimit) {
//       nwcPositifColor = Colors.red;
//     } else {
//       nwcPositifColor = Colors.green;
//     }
//   }

//   return Column(
//     crossAxisAlignment: CrossAxisAlignment.start,
//     children: [
//       Text('NWC Positif', style: tsCaption1),
//       const SizedBox(height: 10),
//       Text(
//         nwcPositif != null ? formatter.format(nwcPositif) : '0',
//         style: TextStyle(
//           fontSize: 20,
//           fontWeight: FontWeight.bold,
//           color: nwcPositifColor ?? CustomColor.secondaryOrange,
//         ),
//       ),
//     ],
//   );
// }
}
