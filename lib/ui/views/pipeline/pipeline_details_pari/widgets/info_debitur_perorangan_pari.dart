// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../application/app/constants/custom_color.dart';
import 'pari_data_diri_details.dart';
import 'pari_data_lainnya_details.dart';
import 'pari_data_usaha_details.dart';

class InfoDebiturPeroranganPari extends StatefulWidget {
  const InfoDebiturPeroranganPari({Key? key}) : super(key: key);

  @override
  _InfoDebiturPeroranganPariState createState() =>
      _InfoDebiturPeroranganPariState();
}

class _InfoDebiturPeroranganPariState extends State<InfoDebiturPeroranganPari> {
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
                              'Data Diri',
                            ),
                          ),
                        ),
                        Tab(
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              'Usaha',
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
                            child: PariDataDiriDetails(),
                          );
                        } else if (_selectedTabBar == 1) {
                          return const Expanded(
                            child: PariDataUsahaDetails(),
                          );
                        } else {
                          return const Expanded(
                            child: PariDataLainnyaDetails(),
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
