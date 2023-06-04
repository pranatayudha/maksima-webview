// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../application/app/constants/custom_color.dart';
import 'ritel_informasi_lainnya_pt_details.dart';
import 'ritel_informasi_pengurus_pt_details.dart';
import 'ritel_informasi_perusahaan_pt_details.dart';

class InfoDebiturPTRitel extends StatefulWidget {
  final String pipelineId;
  final int? statusPipeline;

  const InfoDebiturPTRitel({
    Key? key,
    required this.pipelineId,
    this.statusPipeline,
  }) : super(key: key);

  @override
  _InfoDebiturPTRitelState createState() => _InfoDebiturPTRitelState();
}

class _InfoDebiturPTRitelState extends State<InfoDebiturPTRitel> {
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
                            child: RitelInformasiPerusahaanPtDetails(),
                          );
                        } else if (_selectedTabBar == 1) {
                          return Expanded(
                            child: RitelInformasiPengurusPtDetails(
                              pipelineId: widget.pipelineId,
                              statusPipeline: widget.statusPipeline,
                            ),
                          );
                        } else {
                          return const Expanded(
                            child: RitelInformasiLainnyaPtDetails(),
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
