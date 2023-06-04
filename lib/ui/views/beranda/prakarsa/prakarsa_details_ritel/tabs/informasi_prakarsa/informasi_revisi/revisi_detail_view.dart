// ignore_for_file: prefer_const_constructors
// ignore: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';

import '../../../../../../../../application/app/constants/common.dart';
import '../../../../../../../shared/network_sensitive.dart';
import '../../../../../../../shared/styles.dart';
import '../../../../../../../shared/thick_light_grey_divider.dart';
import 'revisi_viewmodel.dart';

class RevisiDetailView extends StatefulWidget {
  final String ticket;
  final String checker;
  final String id;
  final int codeTable;

  const RevisiDetailView({
    Key? key,
    required this.ticket,
    required this.checker,
    required this.id,
    required this.codeTable,
  }) : super(key: key);

  @override
  State<RevisiDetailView> createState() => _RevisiDetailViewState();
}

class _RevisiDetailViewState extends State<RevisiDetailView> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<RevisiViewModel>.reactive(
      viewModelBuilder: () => RevisiViewModel(
        ticket: widget.ticket,
        checker: widget.checker,
        id: widget.id,
      ),
      builder: (context, vm, child) {
        return NetworkSensitive(
          child: Scaffold(
            appBar: AppBar(
              elevation: 0,
              title: Text(
                'Penjelasan Revisi',
                style: tsHeading6,
              ),
              backgroundColor: Colors.white,
              foregroundColor: Colors.black,
              centerTitle: true,
              leadingWidth: 30.w,
              leading: Container(
                margin: EdgeInsets.only(left: 5.w),
                child: IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: Icon(
                    Icons.clear_outlined,
                    color: const Color(0xff606060),
                    size: 24.sp,
                  ),
                ),
              ),
            ),
            body: vm.isBusy
                ? Container(
                    color: Colors.white,
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  )
                : Container(
                    color: Colors.white,
                    child: SafeArea(
                      child: ListView(
                        shrinkWrap: true,
                        children: [
                          Padding(
                            padding: EdgeInsets.fromLTRB(20, 12, 24, 16),
                            child: Text(
                              'Berikut adalah penjelasan revisi dari role',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Color(0xff162B3A),
                              ),
                            ),
                          ),
                          const ThickLightGreyDivider(),
                          _buildTitleAndDescription(
                            'Informasi Debitur',
                            vm.ritelRevisiAdkOrCbl.infoDataDebitur ?? '-',
                          ),
                          const ThickLightGreyDivider(),
                          _buildTitleAndDescription(
                            'Hasil Pre-Screening',
                            vm.ritelRevisiAdkOrCbl.hasilPreScreening ?? '-',
                          ),
                          if (widget.codeTable == Common.CodeTable.CV ||
                              widget.codeTable == Common.CodeTable.PT)
                            const ThickLightGreyDivider(),
                          if (widget.codeTable == Common.CodeTable.CV ||
                              widget.codeTable == Common.CodeTable.PT)
                            _buildTitleAndDescription(
                              'Trade Checking',
                              vm.ritelRevisiAdkOrCbl.tradeChecking ?? '-',
                            ),
                          const ThickLightGreyDivider(),
                          _buildTitleAndDescription(
                            'Informasi Finansial',
                            vm.ritelRevisiAdkOrCbl.informasiFinansial ?? '-',
                          ),
                          const ThickLightGreyDivider(),
                          _buildTitleAndDescription(
                            'Informasi Non Finansial',
                            vm.ritelRevisiAdkOrCbl.informasiNonFinansial ?? '-',
                          ),
                          const ThickLightGreyDivider(),
                          _buildTitleAndDescription(
                            'Informasi Agunan',
                            vm.ritelRevisiAdkOrCbl.informasiAgunan ?? '-',
                          ),
                          const ThickLightGreyDivider(),
                          _buildTitleAndDescription(
                            'Informasi Pinjaman',
                            vm.ritelRevisiAdkOrCbl.informasiPinjaman ?? '-',
                          ),
                          const ThickLightGreyDivider(),
                          _buildTitleAndDescription(
                            'CRR',
                            vm.ritelRevisiAdkOrCbl.crr ?? '-',
                          ),
                          const ThickLightGreyDivider(),
                          _buildTitleAndDescription(
                            'Draft PTK',
                            vm.ritelRevisiAdkOrCbl.draftPTK ?? '-',
                          ),
                        ],
                      ),
                    ),
                  ),
          ),
        );
      },
    );
  }

  Container _buildTitleAndDescription(String title, String description) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            color: Colors.white,
            child: Text(
              title,
              style: TextStyle(
                fontSize: 12,
                color: Color(0xff828896),
              ),
            ),
          ),
          const SizedBox(height: 1.0),
          Container(
            color: Colors.white,
            child: Text(
              description,
              style: const TextStyle(
                fontSize: 16,
                color: Color(0xff162B3A),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
