import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';

import '../../../../../application/app/app.locator.dart';
import '../../../../../application/app/constants/custom_color.dart';
import '../../../../../application/app/constants/icon_constants.dart';
import '../../../../../application/app/constants/image_constants.dart';
import '../../../../../application/services/url_launcher_service.dart';
import '../../../../shared/network_sensitive.dart';
import '../../../../shared/styles.dart';
import 'monitoring_detail_viewmodel.dart';
import 'widgets/brief_customer_info.dart';
import 'widgets/data_lkn_body.dart';
import 'widgets/data_pembayaran_body.dart';
import 'widgets/data_pinjaman_body.dart';
import 'widgets/info_menu_item.dart';

class MonitoringDetailView extends StatelessWidget {
  final String idKelolaan;
  final int loanType;

  const MonitoringDetailView({
    required this.idKelolaan,
    required this.loanType,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final statusBarHeight = MediaQuery.of(context).padding.top;

    return ViewModelBuilder<MonitoringDetailViewModel>.reactive(
      disposeViewModel: false,
      initialiseSpecialViewModelsOnce: true,
      viewModelBuilder: () => MonitoringDetailViewModel(
        idKelolaan,
        loanType,
      ),
      builder: (context, vm, child) {
        return NetworkSensitive(
          child: WillPopScope(
            onWillPop: () async {
              vm.navigateToMonitoringList();

              return true;
            },
            child: Scaffold(
              backgroundColor: Colors.white,
              body: Builder(
                builder: (context) {
                  if (vm.isBusy) {
                    return const Center(
                      child: CircularProgressIndicator(
                        color: CustomColor.primaryBlue,
                      ),
                    );
                  }

                  if (vm.monitoringDetail == null) {
                    return const Center(
                      child: Text('Failed to fetch Monitoring Detail'),
                    );
                  }

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Expanded(
                        child: DefaultTabController(
                          length: 3,
                          child: NestedScrollView(
                            headerSliverBuilder:
                                (context, bool innerBoxIsScrolled) {
                              return [
                                SliverAppBar(
                                  pinned: true,
                                  expandedHeight: 290.h,
                                  backgroundColor: CustomColor.primaryBlue,
                                  leading: Container(
                                    padding: EdgeInsets.zero,
                                    width: 30.0,
                                    child: IconButton(
                                      icon: const Icon(
                                        Icons.arrow_back,
                                        color: Colors.white,
                                      ),
                                      onPressed: vm.navigateToMonitoringList,
                                    ),
                                  ),
                                  centerTitle: true,
                                  title: Text(
                                    'Informasi Debitur',
                                    style: tsHeading6White,
                                    textAlign: TextAlign.center,
                                  ),
                                  actions: [
                                    GestureDetector(
                                      onTap: () {
                                        if (vm.monitoringDetail?.header
                                                ?.phonenum !=
                                            null) {
                                          locator<URLLauncherService>().call(
                                            vm.monitoringDetail!.header!
                                                .phonenum!,
                                          );
                                        }
                                      },
                                      child: Image.asset(
                                        IconConstants.calling,
                                        scale: 3,
                                      ),
                                    ),
                                  ],
                                  flexibleSpace: FlexibleSpaceBar(
                                    background: Container(
                                      width: double.infinity,
                                      padding: EdgeInsets.fromLTRB(
                                        0,
                                        statusBarHeight + 48.h,
                                        0,
                                        0,
                                      ),
                                      decoration: const BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage(
                                            ImageConstants.headerBg,
                                          ),
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.stretch,
                                        children: [
                                          BriefCustomerInfo(
                                            header: vm.monitoringDetail?.header,
                                          ),
                                          _buildMenuItems(statusBarHeight),
                                        ],
                                      ),
                                    ),
                                    centerTitle: true,
                                  ),
                                ),
                                /*SliverToBoxAdapter(
                                  child: Stack(
                                    children: [
                                      _buildHeader(
                                        context,
                                        statusBarHeight,
                                        vm,
                                      ),
                                      _buildMenuItems(statusBarHeight),
                                    ],
                                  ),
                                ),*/
                                /*SliverToBoxAdapter(
                                  child: Container(
                                    height: 8,
                                    color: Colors.grey.shade100,
                                  ),
                                ),*/
                                /*const SliverAppBar(
                                  pinned: true,
                                  title: Text('TABBAR'),
                                  elevation: 14,
                                ),*/
                                /*SliverOverlapAbsorber(
                                  handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                                  sliver: SliverAppBar(

                                  ),
                                ),*/
                                SliverOverlapAbsorber(
                                  handle: NestedScrollView
                                      .sliverOverlapAbsorberHandleFor(context),
                                  sliver: SliverPersistentHeader(
                                    pinned: true,
                                    delegate: _SliverAppBarDelegate(
                                      topPadding:
                                          MediaQuery.of(context).padding.top,
                                      tabBar: const TabBar(
                                        labelPadding: EdgeInsets.zero,
                                        padding: EdgeInsets.zero,
                                        indicatorPadding: EdgeInsets.zero,
                                        labelColor: Color(0xff242323),
                                        labelStyle: TextStyle(
                                          fontFamily: 'Nunito',
                                          fontWeight: FontWeight.w800,
                                          color: CustomColor.primaryBlack,
                                        ),
                                        unselectedLabelColor:
                                            CustomColor.darkGrey,
                                        unselectedLabelStyle: TextStyle(
                                          fontFamily: 'Nunito',
                                          fontWeight: FontWeight.w600,
                                        ),
                                        indicatorColor: CustomColor.primaryBlue,
                                        indicatorSize: TabBarIndicatorSize.tab,
                                        tabs: [
                                          Tab(
                                            text: 'PINJAMAN',
                                          ),
                                          Tab(
                                            text: 'PEMBAYARAN',
                                          ),
                                          Tab(
                                            text: 'LKN',
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ];
                            },
                            body: Container(
                              color: Colors.white,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 3,
                              ),
                              child: TabBarView(
                                children: [
                                  DataPinjamanBody(
                                    monitoringDetail: vm.monitoringDetail,
                                  ),
                                  const DataPembayaranBody(),
                                  const DataLKNBody(),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 5,
                              offset: const Offset(0, -2),
                              color: CustomColor.primaryBlack.withOpacity(0.1),
                            ),
                          ],
                        ),
                        child: TextButton(
                          style: TextButton.styleFrom(
                            backgroundColor: CustomColor.secondaryBlue,
                            padding: const EdgeInsets.all(16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          onPressed: vm.navigateToPencairanStepOne,
                          child: Text(
                            'Tambah Pencairan',
                            style: tsHeading8White,
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }

  /*Container _buildHeader(
    BuildContext context,
    double statusBarHeight,
    MonitoringDetailViewModel vm,
  ) {
    final header = vm.monitoringDetail!.header;

    return Container(
      height: 150.h,
      width: double.infinity,
      padding: EdgeInsets.fromLTRB(5, statusBarHeight, 0, 0),
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(ImageConstants.headerBg),
          fit: BoxFit.fill,
        ),
      ),
      child: Column(
        children: [
          _buildAppBar(context, header?.phonenum, vm),
          BriefCustomerInfo(header: header),
        ],
      ),
    );
  }*/

  /*Row _buildAppBar(
    BuildContext context,
    String? numPhone,
    MonitoringDetailViewModel vm,
  ) {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.zero,
          width: 30.0,
          child: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: vm.navigateToMonitoringList,
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text(
              'Informasi Debitur',
              style: tsHeading6White,
              textAlign: TextAlign.center,
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            if (numPhone != null) locator<URLLauncherService>().call(numPhone);
          },
          child: Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Image.asset(IconConstants.calling, scale: 3),
          ),
        ),
      ],
    );
  }*/

  Container _buildMenuItems(double statusBarHeight) {
    return Container(
      // margin: EdgeInsets.fromLTRB(16, statusBarHeight + 137, 16, 11),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      margin: const EdgeInsets.fromLTRB(
        16,
        16,
        16,
        16,
      ),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              spreadRadius: 4,
              blurRadius: 4,
            ),
          ],
        ),
        child: Container(
          padding: const EdgeInsets.fromLTRB(24, 24, 24, 28),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade50,
                spreadRadius: -4,
                blurRadius: 16,
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              InfoMenuItem(
                label: 'Lihat Hasil \nPre-Screening',
                iconPath: IconConstants.lihatHasilPrescreening,
              ),
              InfoMenuItem(
                label: 'Lihat Hasil \nAnalisa Pinjaman',
                iconPath: IconConstants.lihatHasilAnalisaPinjaman,
              ),
              InfoMenuItem(
                label: 'Lihat Informasi \nPrakarsa',
                iconPath: IconConstants.lihatInformasiPrakarsa,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate({
    required this.tabBar,
    required this.topPadding,
  });

  final TabBar tabBar;
  final double topPadding;

  @override
  double get minExtent => tabBar.preferredSize.height + 12.h;

  @override
  double get maxExtent => tabBar.preferredSize.height + 12.h;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    // final isScrolledUnder = (shrinkOffset > maxExtent - minExtent);
    // print('isScrolledUnder $isScrolledUnder');
    // print('shrinkOffset $shrinkOffset');

    return SizedBox.expand(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: CustomColor.primaryBlack.withOpacity(0.05),
              blurRadius: 2,
              spreadRadius: 4,
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // if (isScrolledUnder)
            //   SizedBox(height: MediaQuery.of(context).padding.top),
            Expanded(child: tabBar),
          ],
        ),
      ),
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return true;
  }
}
