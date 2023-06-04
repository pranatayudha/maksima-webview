import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../../../application/app/constants/custom_color.dart';
import '../../../../../../../../shared/thick_light_grey_divider.dart';
import '../informasi_agunan_lkn_pari/informasi_agunan_lkn_view_pari.dart';
import '../informasi_agunan_tambahan_pari/informasi_agunan_tambahan_view_pari.dart';

class InformasiAgunanTabsPari extends StatefulWidget {
  final String prakarsaId;
  final String pipelineId;
  final int loanTypesId;
  final int codeTable;
  final int status;

  const InformasiAgunanTabsPari({
    Key? key,
    required this.prakarsaId,
    required this.pipelineId,
    required this.loanTypesId,
    required this.codeTable,
    required this.status,
  }) : super(key: key);

  @override
  State<InformasiAgunanTabsPari> createState() =>
      _InformasiAgunanTabsPariState();
}

class _InformasiAgunanTabsPariState extends State<InformasiAgunanTabsPari> {
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
                      indicatorWeight: 3,
                      indicatorSize: TabBarIndicatorSize.label,
                      onTap: (index) => setState(
                        () {
                          _selectedTabBar = index;
                        },
                      ),
                      tabs: [
                        Tab(
                          height: 56.h,
                          child: const Align(
                            alignment: Alignment.center,
                            child: Text(
                              'POKOK',
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                        Tab(
                          height: 56.h,
                          child: const Align(
                            alignment: Alignment.center,
                            child: Text(
                              'TAMBAHAN',
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                        Tab(
                          height: 56.h,
                          child: const Align(
                            alignment: Alignment.center,
                            child: Text(
                              'LKN',
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const ThickLightGreyDivider(),
                    Builder(
                      builder: (_) {
                        // if (_selectedTabBar == 0) {
                        //   return Expanded(
                        //     child: InformasiAgunanViewPokokPari(
                        //       prakarsaId: widget.prakarsaId,
                        //       pipelineId: widget.pipelineId,
                        //       loanTypesId: widget.loanTypesId,
                        //       status: widget.status,
                        //       codeTable: widget.codeTable,
                        //     ),
                        //   );
                        // } else
                        if (_selectedTabBar == 1) {
                          return Expanded(
                            child: InformasiAgunanTambahanViewPari(
                              prakarsaId: widget.prakarsaId,
                              pipelineId: widget.pipelineId,
                              loanTypesId: widget.loanTypesId,
                              status: widget.status,
                              codeTable: widget.codeTable,
                            ),
                          );
                        } else {
                          return Expanded(
                            child: InformasiAgunanLKNViewPari(
                              prakarsaId: widget.prakarsaId,
                              pipelineId: widget.pipelineId,
                              loanTypesId: widget.loanTypesId,
                              status: widget.status,
                              codeTable: widget.codeTable,
                            ),
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
