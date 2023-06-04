// ignore_for_file: unused_label

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../../../../../../../application/app/app.locator.dart';
import '../../../../../../../../../application/app/app.router.dart';
import '../../../../../../../../../application/app/constants/icon_constants.dart';
import '../../../../../../../../shared/network_sensitive.dart';
import '../upload_crr_viewmodel.dart';
import 'file_item_crr.dart';

class UploadCRRDetails extends StatelessWidget {
  final String prakarsaId;
  final String pipelineId;
  final int loanTypesId;
  final String url;
  final int status;
  final int codeTable;

  const UploadCRRDetails({
    Key? key,
    required this.prakarsaId,
    required this.pipelineId,
    required this.loanTypesId,
    required this.url,
    required this.status,
    required this.codeTable,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NetworkSensitive(
      child: WillPopScope(
        onWillPop: () async {
          locator<NavigationService>().navigateTo(
            Routes.prakarsaDetailsViewRitel,
            arguments: PrakarsaDetailsViewRitelArguments(
              index: 1,
              prakarsaId: prakarsaId,
              pipelineId: pipelineId,
              loanTypesId: loanTypesId,
              codeTable: codeTable,
            ),
          );

          return true;
        },
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            elevation: 0,
            shadowColor: const Color.fromARGB(255, 125, 131, 137),
            title: Text(
              'Upload CRR',
              style: TextStyle(
                color: Colors.black,
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            centerTitle: true,
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
            leading: GestureDetector(
              onTap: () {
                locator<NavigationService>().navigateTo(
                  Routes.prakarsaDetailsViewRitel,
                  arguments: PrakarsaDetailsViewRitelArguments(
                    index: 1,
                    prakarsaId: prakarsaId,
                    pipelineId: pipelineId,
                    loanTypesId: loanTypesId,
                    codeTable: codeTable,
                  ),
                );
              },
              child: Icon(
                Icons.arrow_back,
                color: Colors.black,
                size: 24.sp,
              ),
            ),
            actions: [
              if (status <= 2)
                Container(
                  margin: EdgeInsets.only(right: 15.w),
                  padding: EdgeInsets.zero,
                  width: 33.w,
                  child: IconButton(
                    icon: Image.asset(IconConstants.edit),
                    onPressed: () => locator<NavigationService>().navigateTo(
                      Routes.uploadCRRView,
                      arguments: UploadCRRViewArguments(
                        prakarsaId: prakarsaId,
                        pipelineId: pipelineId,
                        loanTypesId: loanTypesId,
                        url: url,
                        status: status,
                        codeTable: codeTable,
                      ),
                    ),
                  ),
                ),
            ],
          ),
          body: ViewModelBuilder<UploadCRRViewModel>.reactive(
            viewModelBuilder: () => UploadCRRViewModel(
              prakarsaId: prakarsaId,
              pipelineId: pipelineId,
              loanTypesId: loanTypesId,
              status: status,
              url: url,
              codeTable: codeTable,
            ),
            builder: (context, viewModel, child) {
              // ignore: prefer-conditional-expressions
              if (viewModel.urlPublic == null) {
                return const Center(child: CircularProgressIndicator());
              } else {
                return FileItemCRR(viewModel.urlPublic!);
              }
            },
          ),
        ),
      ),
    );
  }
}
