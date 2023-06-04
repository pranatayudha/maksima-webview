import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';

import '../../../../../../../../../../application/app/app.locator.dart';
import '../../../../../../../../../../application/app/constants/icon_constants.dart';
import '../../../../../../../../../../application/services/url_launcher_service.dart';
import '../../../../../../../../../shared/styles.dart';
import '../riwayat_projek_viewmodel.dart';

class RitelFileItemRiwayatProjek extends StatelessWidget {
  final String file;
  final String title;

  const RitelFileItemRiwayatProjek({
    required this.file,
    required this.title,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<RiwayatProyekViewModel>.reactive(
        viewModelBuilder: () => RiwayatProyekViewModel(
              prakarsaId: '',
              pipelineId: '',
              loanTypesId: 1,
              status: 1,
              codeTable: 1,
            ),
        builder: (ctx, viewModel, child) {
          return Container(
            margin: EdgeInsets.only(bottom: 8.h),
            child: Row(
              children: [
                Image.asset(
                  IconConstants.xls,
                  scale: 3.5,
                ),
                SizedBox(width: 16.w),
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AutoSizeText(
                        title,
                        style: tsHeading10,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: 4.h),
                      GestureDetector(
                        onTap: () async => locator<URLLauncherService>().browse(
                          await viewModel.getPublicFile(file),
                        ),
                        child: Text('Lihat', style: tsHeading11SecondaryBlue),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },);
  }
}
