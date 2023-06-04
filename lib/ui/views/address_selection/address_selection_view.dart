import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:stacked/stacked.dart';

import '../../shared/back_button_and_title.dart';
import '../../shared/network_sensitive.dart';
import '../../shared/processing_indicator.dart';
import 'address_selection_viewmodel.dart';

class AddressSelectionView
    extends ViewModelBuilderWidget<AddressSelectionViewModel> {
  const AddressSelectionView({Key? key}) : super(key: key);

  @override
  AddressSelectionViewModel viewModelBuilder(BuildContext context) =>
      AddressSelectionViewModel();

  @override
  Widget builder(
    BuildContext context,
    AddressSelectionViewModel viewModel,
    Widget? child,
  ) {
    return NetworkSensitive(
      child: Scaffold(
        body: ModalProgressHUD(
          inAsyncCall: viewModel.isBusy,
          color: Colors.black,
          opacity: 0.75,
          progressIndicator: const ProcessingIndicator(),
          child: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const BackButtonAndTitle('Pencari Alamat', centerTitle: true),
                  ListView(
                    padding: EdgeInsets.all(16.w),
                    shrinkWrap: true,
                    children: [
                      TextFormField(
                        controller: viewModel.addressController,
                        decoration:
                            const InputDecoration(hintText: 'Masukkan alamat'),
                        onChanged: viewModel.updateAddress,
                      ),
                      SizedBox(height: 20.h),
                      if (!viewModel.hasAutoCompleteResults)
                        const Text('Pilihan alamat belum tersedia'),
                      if (viewModel.hasAutoCompleteResults)
                        ...viewModel.autoCompleteResults.map(
                          (autoCompleteResult) => ListTile(
                            contentPadding: EdgeInsets.zero,
                            title: Text(autoCompleteResult.mainText ?? ''),
                            subtitle:
                                Text(autoCompleteResult.secondaryText ?? ''),
                            onTap: () => viewModel
                                .navigateBackWithValue(autoCompleteResult),
                          ),
                          // ...List.generate(
                          //   viewModel.autoCompleteResults.length,
                          //   (index) {
                          //     var autoCompleteResult =
                          //         viewModel.autoCompleteResults[index];
                          //     return ListTile(
                          //       contentPadding: EdgeInsets.zero,
                          //       title: Text(autoCompleteResult.mainText ?? ''),
                          //       subtitle:
                          //           Text(autoCompleteResult.secondaryText ?? ''),
                          //       onTap: () => viewModel.navigateBackWithValue(
                          //           viewModel.locationAddr?.results[index]),
                          //     );
                          //   },
                        ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
