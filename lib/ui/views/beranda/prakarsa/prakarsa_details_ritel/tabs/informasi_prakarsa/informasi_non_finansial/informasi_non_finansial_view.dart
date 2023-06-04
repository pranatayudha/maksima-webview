// ignore_for_file: non_constant_identifier_names, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:stacked/stacked.dart';

import '../../../../../../../shared/custom_button.dart';
import '../../../../../../../shared/network_sensitive.dart';
import '../../../../../../../shared/styles.dart';
import 'bullet_list.dart';
import 'informasi_non_finansial_viewmodel.dart';
import 'widgets/summary_non_finansial.dart';

class InformasiNonFinansial extends StatefulWidget {
  final String headerTitle;
  final String title;
  final String subTitle;
  final int page;
  final List<dynamic> list_question;
  final int typeQuestion;
  final bool isListArea;
  final bool lastPage;
  final dynamic nextPage;
  final bool startPage;
  final String? prakarsaId;
  final String? name;
  final String pipelineId;
  final int loanTypesId;
  final int codeTable;

  const InformasiNonFinansial({
    this.headerTitle = 'Informasi Non Finansial',
    required this.title,
    required this.subTitle,
    required this.page,
    required this.list_question,
    required this.typeQuestion,
    required this.isListArea,
    required this.lastPage,
    required this.nextPage,
    this.startPage = false,
    this.prakarsaId,
    this.name,
    required this.pipelineId,
    required this.loanTypesId,
    required this.codeTable,
    Key? key,
  }) : super(key: key);

  @override
  _InformasiNonFinansialState createState() => _InformasiNonFinansialState();
}

class _InformasiNonFinansialState extends State<InformasiNonFinansial> {
  int _value = 0;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<InformasiNonFinansialViewModel>.reactive(
      viewModelBuilder: () => InformasiNonFinansialViewModel(
        prakarsaId: widget.prakarsaId,
        name: widget.name,
        pipelineId: widget.pipelineId,
        loanTypesId: widget.loanTypesId,
        codeTable: widget.codeTable,
      ),
      builder: (context, vm, child) {
        return NetworkSensitive(
          child: Scaffold(
            appBar: AppBar(
              elevation: 0,
              title: Text(
                widget.headerTitle,
                style: tsHeading6,
              ),
              backgroundColor: Colors.white,
              foregroundColor: Colors.black,
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
                  onPressed: () {
                    vm.backToPrakarsa();
                    vm.navigateToInfoPrakarsa();
                  },
                  // onPressed: widget.startPage
                  //     ? () {
                  //         vm.backToPrakarsa();
                  //         vm.navigateToInfoPrakarsa();
                  //       }
                  //     : () => vm.navigateToInfoPrakarsa,
                ),
              ),
            ),
            body: Container(
              color: Colors.white,
              child: ModalProgressHUD(
                inAsyncCall: false,
                // color: Colors.white,
                child: SafeArea(
                  child: WillPopScope(
                    onWillPop: () async {
                      vm.navigateToInfoPrakarsa();
                      // ignore: newline-before-return
                      return true;
                    },
                    child: GestureDetector(
                      onTap: () => FocusScope.of(context).unfocus(),
                      child: widget.isListArea
                          ? _buildListViewBodyArea(vm)
                          : _buildMinBodyArea(vm),
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Column _buildListViewBodyArea(InformasiNonFinansialViewModel vm) {
    return Column(
      children: [
        Expanded(
          child: ListView(
            // controller: _scrollController,
            shrinkWrap: true,
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(16.w, 8.h, 20.w, 10.h),
                child: Text(
                  'Pilih salah satu untuk mengisi aspek non finansial.',
                  style: TextStyle(
                    color: const Color(0xff03213E),
                    fontSize: 14.sp,
                  ),
                ),
              ),
              Container(
                color: const Color(0xffF07126),
                padding: EdgeInsets.fromLTRB(16.w, 8.h, 16.w, 8.h),
                child: Text(
                  widget.title,
                  textAlign: TextAlign.center,
                  style: tsHeading8White,
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 12.h),
                child: Text(
                  widget.subTitle,
                  style: tsHeading10,
                  textAlign: TextAlign.center,
                ),
              ),
              for (var i = 0; i < widget.list_question.length; i++)
                _buildQuestionBlock(widget.list_question[i]),
            ],
          ),
        ),
        _buildButtonProcess(vm),
      ],
    );
  }

  Column _buildMinBodyArea(InformasiNonFinansialViewModel vm) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ListView(
          // controller: _scrollController,
          shrinkWrap: true,
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(20.w, 8, 20.w, 8.h),
              child: Text(
                'Pilih salah satu untuk mengisi aspek non finansial.',
                style: tsDescription,
              ),
            ),
            Container(
              color: const Color(0xffF07126),
              padding: EdgeInsets.symmetric(vertical: 8.h),
              child: Text(
                widget.title,
                textAlign: TextAlign.center,
                style: tsHeading8White,
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 12.h),
              child: Text(
                widget.subTitle,
                style: tsHeading10,
                textAlign: TextAlign.center,
              ),
            ),
            for (var i = 0; i < widget.list_question.length; i++)
              _buildQuestionBlock(widget.list_question[i]),
          ],
        ),
        _buildButtonProcess(vm),
      ],
    );
  }

  Container _buildQuestionBlock(question) {
    dynamic desc = question['desc'];
    int value = question['value'];
    // ignore: newline-before-return
    return Container(
      width: MediaQuery.of(context).size.width * 0.6,
      padding: EdgeInsets.fromLTRB(16.w, 12.h, 18.w, 12.h),
      margin: EdgeInsets.fromLTRB(16.w, 0.h, 16.w, 8.h),
      decoration: BoxDecoration(
        color: value == _value ? const Color(0xffFEF5EE) : Colors.white,
        border: Border.all(
          color: value == _value
              ? const Color(0xffF07126)
              : const Color(0xffB3BCC5),
        ),
        borderRadius: BorderRadius.circular(6.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 284,
            // width: 284,
            child: widget.typeQuestion == 1
                ? BulletList(
                    desc,
                  )
                : Text(
                    desc,
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: Colors.black,
                      height: 1.55,
                    ),
                  ),
          ),
          Radio(
            value: value,
            groupValue: _value,
            activeColor: const Color(0xffF07126),
            onChanged: (value) {
              setState(() {
                _value = value as int;
              });
            },
          ),
        ],
      ),
    );
  }

  Container _buildButtonProcess(InformasiNonFinansialViewModel vm) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.only(top: 18),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(12),
          topLeft: Radius.circular(12),
        ),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(40, 41, 61, 0.08),
            blurRadius: 8,
            offset: Offset(0, 2),
          ),
          BoxShadow(
            color: Color.fromRGBO(96, 97, 112, 0.24),
            blurRadius: 32,
            offset: Offset(0, 20),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (!widget.startPage)
            Expanded(
              //Perbaiki size nya ketika ada border tidak sama dengan Button Selanjutnya
              child: CustomButton(
                labelColor: const Color(0xff07539A),
                label: 'Sebelumnya',
                onPressed: () => Navigator.of(context).pop(),
                isBusy: false,
                isOutlineButton: true,
              ),
            ),
          if (!widget.startPage)
            SizedBox(
              width: 10.w,
            ),
          Expanded(
            child: CustomButton(
              label: widget.lastPage ? 'Proses Data' : 'Selanjutnya',
              onPressed: widget.lastPage
                  ? () async {
                      await vm.insertAnswer(widget.page, _value);
                      if (_value != 0) {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (builder) => SummaryNonFinansial(
                              prakarsaId: widget.prakarsaId!,
                              name: widget.name!,
                              pipelineId: widget.pipelineId,
                              loanTypesId: widget.loanTypesId,
                              codeTable: widget.codeTable,
                            ),
                          ),
                        );
                      }
                    }
                  : () async {
                      await vm.insertAnswer(widget.page, _value);
                      if (_value != 0) {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (builder) => widget.nextPage,
                        ));
                      }
                    },
              isBusy: false,
            ),
          ),
        ],
      ),
    );
  }
}
