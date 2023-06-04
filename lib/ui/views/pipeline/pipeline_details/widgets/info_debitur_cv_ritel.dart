// ignore_for_file: library_private_types_in_public_api, override_on_non_overriding_member

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../application/app/constants/custom_color.dart';
import '../pipeline_details_perusahaan_cv_viewmodel_ritel.dart';
import 'ritel_informasi_lainnya_cv_details.dart';
import 'ritel_informasi_pengurus_cv_details.dart';
import 'ritel_informasi_perusahaan_cv_details.dart';

class InfoDebiturPerusahaanCvRitel extends StatefulWidget {
  final String pipelineId;
  final int? statusPipeline;

  const InfoDebiturPerusahaanCvRitel({
    Key? key,
    required this.pipelineId,
    this.statusPipeline,
  }) : super(key: key);

  @override
  _InfoDebiturPerusahaanCvRitelState createState() =>
      _InfoDebiturPerusahaanCvRitelState();

  @override
  PipelineDetailsPerusahaanCvViewModelRitel viewModelBuilder(
    BuildContext context,
  ) =>
      PipelineDetailsPerusahaanCvViewModelRitel(
        pipelineId: pipelineId,
        codeTable: 3,
      );
}

class _InfoDebiturPerusahaanCvRitelState
    extends State<InfoDebiturPerusahaanCvRitel> {
  int _selectedTabBar = 0;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          DefaultTabController(
            length: 3,
            child: Expanded(
              child: Container(
                color: Colors.white,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
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
                            child: Text(
                              'Perusahaan',
                            ),
                          ),
                        ),
                        Tab(
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              'Pengurus',
                            ),
                          ),
                        ),
                        Tab(
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              'Lainnya',
                            ),
                          ),
                        ),
                      ],
                    ),
                    Builder(
                      builder: (_) {
                        if (_selectedTabBar == 0) {
                          return const Expanded(
                            child: RitelInformasiPerusahaanCvDetails(),
                          );
                        } else if (_selectedTabBar == 1) {
                          return Expanded(
                            child: RitelInformasiPengurusCvDetails(
                              pipelineId: widget.pipelineId,
                              statusPipeline: widget.statusPipeline,
                              codeTable: 4,
                            ),
                          );
                        } else {
                          return const Expanded(
                            child: RitelInformasiLainnyaCvDetails(),
                          );
                        }
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
