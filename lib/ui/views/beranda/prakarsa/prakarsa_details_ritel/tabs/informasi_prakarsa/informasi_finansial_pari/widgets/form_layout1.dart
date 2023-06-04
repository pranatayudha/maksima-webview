import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../../../../../../../application/app/app.locator.dart';
import '../../../../../../../../../application/app/constants/icon_constants.dart';
import '../../../../../../../../../application/enums/dialog_type.dart';
import '../../../../../../../../shared/custom_button.dart';
import '../../../../../../../../shared/network_sensitive.dart';
import '../../../../../../../../shared/styles.dart';
import '../../../../../../../../shared/thick_light_grey_divider.dart';

class FormLayout1<T extends ChangeNotifier> extends StatefulWidget {
  final String title;
  final String subtitle;
  final String periode;
  final Function onBackButtonPressed;
  final bool? backButtonVisible;
  final bool isBusy;
  final bool? buttonBusy;
  final String mainButtonTitle;
  final Future<dynamic> Function()? onMainButtonPressed;
  final Widget child;

  const FormLayout1({
    required this.title,
    required this.subtitle,
    required this.periode,
    required this.onBackButtonPressed,
    this.backButtonVisible = false,
    required this.isBusy,
    this.buttonBusy,
    required this.mainButtonTitle,
    required this.onMainButtonPressed,
    required this.child,
    Key? key,
  }) : super(key: key);

  @override
  State<FormLayout1> createState() => _FormLayout1State();
}

class _FormLayout1State<T extends ChangeNotifier> extends State<FormLayout1> {
  static const double emptySpace = 10.0;
  late ScrollController _scrollController;
  bool isScrolledToTop = true;

  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
    super.initState();
  }

  void _scrollListener() {
    if (_scrollController.offset <=
            _scrollController.position.minScrollExtent &&
        !_scrollController.position.outOfRange) {
      if (!isScrolledToTop) {
        setState(() {
          isScrolledToTop = true;
        });
      }
    } else {
      if (_scrollController.offset > emptySpace && isScrolledToTop) {
        setState(() {
          isScrolledToTop = false;
        });
      }
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return NetworkSensitive(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: isScrolledToTop ? 0 : 4,
          backgroundColor: Colors.white,
          title: Text(widget.title, style: tsHeading6),
          centerTitle: true,
          leadingWidth: 30.w,
          leading: Container(
            margin: EdgeInsets.only(left: 5.w),
            child: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: const Color(0xff606060),
                size: 24.sp,
              ),
              onPressed: () => widget.onBackButtonPressed(),
            ),
          ),
          actions: [
            if (widget.backButtonVisible!)
              Container(
                margin: EdgeInsets.only(right: 15.w),
                padding: EdgeInsets.zero,
                width: 30.w,
                child: IconButton(
                  icon: Icon(
                    Icons.arrow_forward,
                    color: const Color(0xff606060),
                    size: 24.sp,
                  ),
                  onPressed: () => widget.onBackButtonPressed(),
                ),
              )
            else
              Container(),
          ],
        ),
        body: ModalProgressHUD(
          inAsyncCall: widget.isBusy,
          child: SafeArea(
            child: WillPopScope(
              onWillPop: () async => false,
              child: GestureDetector(
                onTap: () => FocusScope.of(context).unfocus(),
                child: ListView(
                  controller: _scrollController,
                  shrinkWrap: true,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                      ),
                      margin: const EdgeInsets.symmetric(vertical: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            padding: const EdgeInsets.only(right: 10),
                            child: Column(
                              children: [
                                Text(
                                  widget.subtitle,
                                  style: const TextStyle(color: Colors.orange),
                                ),
                                Row(
                                  children: [
                                    Text(widget.periode,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    InkWell(
                                      onTap: () => _showInDevelopmentDialog(),
                                      child: Image.asset(
                                        IconConstants.info,
                                        scale: 5,
                                        color: const Color(0xff606060),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const ThickLightGreyDivider(),
                    widget.child,
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      margin: const EdgeInsets.symmetric(vertical: 32),
                      child: CustomButton(
                        label: widget.mainButtonTitle,
                        onPressed: widget.onMainButtonPressed,
                        isBusy: widget.buttonBusy ?? widget.isBusy,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future _showInDevelopmentDialog() => locator<DialogService>()
      .showCustomDialog(variant: DialogType.inDevelopment);
}
