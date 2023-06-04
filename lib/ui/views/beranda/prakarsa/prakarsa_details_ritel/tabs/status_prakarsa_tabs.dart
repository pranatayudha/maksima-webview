// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../application/app/constants/custom_color.dart';
import '../../../../../../application/models/ritel_prakarsa_info_prakarsa_header.dart';
import '../../../../../../application/models/ritel_prakarsa_perorangan.dart';
import '../../../../../../application/models/ritel_prakarsa_status_pengajuan_body.dart';
import '../../../../../shared/thick_light_grey_divider.dart';
import 'informasi_prakarsa/informasi_prakarsa_perorangan_view.dart';
import 'status_pengajuan/status_pengajuan.dart';

class StatusPrakarsaTabs extends StatefulWidget {
  final RitelPrakarsaInfoPrakarsaHeader header;
  final int? index;
  final String prakarsaId;
  final String? pipelinesId;
  final RitelPrakarsaStatusPengajuanBodyPTR statusPengajuanBody;
  final RitelPrakarsaPerorangan prakarsaPerorangan;
  final String? pipelineId;
  final int loanTypesId;
  final int codeTable;
  final int status;
  final int approvalStep;

  const StatusPrakarsaTabs({
    Key? key,
    required this.header,
    this.index = 0,
    required this.prakarsaId,
    this.pipelinesId,
    required this.statusPengajuanBody,
    required this.prakarsaPerorangan,
    this.pipelineId,
    required this.loanTypesId,
    required this.codeTable,
    required this.status,
    required this.approvalStep,
  }) : super(key: key);

  @override
  _StatusPrakarsaTabsState createState() => _StatusPrakarsaTabsState();
}

class _StatusPrakarsaTabsState extends State<StatusPrakarsaTabs> {
  int _selectedTabBar = 0;

  @override
  void initState() {
    if (widget.index != null) {
      setState(() {
        _selectedTabBar = widget.index!;
      });
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          DefaultTabController(
            initialIndex: _selectedTabBar,
            length: 2,
            child: Expanded(
              child: Container(
                color: Colors.white,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const ThickLightGreyDivider(),
                    TabBar(
                      labelColor: CustomColor.primaryBlue,
                      labelStyle: TextStyle(
                        fontFamily: 'Nunito',
                        fontSize: 12.5.sp,
                        fontWeight: FontWeight.w800,
                        color: CustomColor.primaryBlue,
                      ),
                      unselectedLabelColor: CustomColor.darkGrey,
                      indicatorColor: CustomColor.primaryBlue,
                      indicatorWeight: 2,
                      indicatorSize: TabBarIndicatorSize.label,
                      onTap: (index) => setState(() {
                        _selectedTabBar = index;
                      }),
                      tabs: const [
                        Tab(
                          child: Align(
                            alignment: Alignment.center,
                            child: Text('STATUS PENGAJUAN'),
                          ),
                        ),
                        Tab(
                          child: Align(
                            alignment: Alignment.center,
                            child: Text('INFO PRAKARSA'),
                          ),
                        ),
                      ],
                    ),
                    const ThickLightGreyDivider(),
                    Builder(
                      builder: (_) {
                        return _selectedTabBar == 0
                            ? Expanded(
                                child: StatusPengajuan(
                                  pipelineId: widget.pipelineId,
                                  header: widget.header,
                                  prakarsaId: widget.prakarsaId,
                                  statusPengajuan: widget.statusPengajuanBody,
                                  prakarsaPerorangan: widget.prakarsaPerorangan,
                                  loanTypesId: widget.loanTypesId,
                                  codeTable: widget.codeTable,
                                  approvalStep: widget.approvalStep,
                                ),
                              )
                            : Expanded(
                                child: InformasiPrakarsaView(
                                  prakarsaId: widget.prakarsaId,
                                  pipelinesId: widget.pipelineId!,
                                  ritelPrakarsaPerorangan:
                                      widget.prakarsaPerorangan,
                                  loanTypesId: widget.loanTypesId,
                                  codeTable: widget.codeTable,
                                  status: widget.status,
                                ),
                              );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
