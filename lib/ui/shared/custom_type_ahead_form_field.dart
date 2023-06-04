import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

import '../../application/app/constants/custom_color.dart';
import '../../application/app/constants/icon_constants.dart';
import 'styles.dart';

class CustomTypeAheadFormField<T> extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final Function onClear;
  final FutureOr<Iterable<T>> Function(String) onFilter;
  final Function onSuggestionSelected;
  final Widget Function(BuildContext, T) itemBuilder;
  final String? Function(String?)? validator;

  const CustomTypeAheadFormField({
    required this.label,
    required this.controller,
    required this.onClear,
    required this.onFilter,
    required this.onSuggestionSelected,
    required this.itemBuilder,
    this.validator,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 15.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(label, style: tsCaption1),
              if (controller.text.isNotEmpty)
                GestureDetector(
                  onTap: () => onClear(),
                  child: Text(
                    'Clear',
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      fontSize: 12.sp,
                      color: Colors.blue,
                    ),
                  ),
                ),
            ],
          ),
          SizedBox(height: 6.h),
          TypeAheadFormField<T>(
            textFieldConfiguration: TextFieldConfiguration(
              controller: controller,
              style: TextStyle(height: 1.2.h),
              decoration: InputDecoration(
                suffixIcon: Image.asset(IconConstants.chevronDown, scale: 3),
                hintText: 'Pilih $label',
                hintStyle: const TextStyle(color: Colors.black38),
                filled: true,
                fillColor: Colors.white,
                contentPadding: EdgeInsets.symmetric(horizontal: 16.w),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4.r),
                  borderSide: BorderSide(
                    color: controller.text.isNotEmpty
                        ? Colors.green
                        : Colors.black38,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4.r),
                  borderSide: BorderSide(
                    color: controller.text.isNotEmpty
                        ? Colors.green
                        : Colors.black38,
                  ),
                ),
                disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4.r),
                  borderSide: BorderSide(
                    color: controller.text.isNotEmpty
                        ? Colors.green
                        : Colors.black38,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4.r),
                  borderSide: BorderSide(
                    color: controller.text.isNotEmpty
                        ? Colors.green
                        : CustomColor.secondaryBlue,
                  ),
                ),
              ),
              minLines: 1,
              maxLines: 3,
              onSubmitted: (val) => onClear(),
            ),
            suggestionsCallback: (pattern) {
              final query = pattern.toLowerCase();
              // ignore: newline-before-return
              return onFilter(query);
            },
            itemBuilder: itemBuilder,
            onSuggestionSelected: (suggestion) {
              onSuggestionSelected(suggestion);
            },
            noItemsFoundBuilder: (context) => Center(
              child: Text(
                '$label tidak ditemukan.',
                style: TextStyle(fontSize: 16.sp),
              ),
            ),
            validator: validator,
          ),
        ],
      ),
    );
  }
}
