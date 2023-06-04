import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../../application/app/constants/custom_color.dart';
import '../../../../../../../shared/styles.dart';
import 'status_check_box.dart';

class TaskItem extends StatefulWidget {
  final String task;
  final String? description;
  final String? textButtonLabel;
  final Function? onTextButtonLabelPressed;
  final int currentTask;
  final int? statusDone;
  final bool? isFailed;
  final bool? isLast;
  final bool? isCorrection;
  final bool? forceVisibleTextButton;
  final bool? hasDescription;
  final Color? colorTextButton;

  const TaskItem({
    required this.task,
    this.description,
    this.textButtonLabel,
    this.onTextButtonLabelPressed,
    required this.currentTask,
    this.statusDone,
    this.isFailed,
    this.isLast = false,
    this.isCorrection = false,
    this.forceVisibleTextButton = false,
    this.hasDescription = false,
    this.colorTextButton,
    Key? key,
  }) : super(key: key);

  @override
  State<TaskItem> createState() => _TaskItemState();
}

class _TaskItemState extends State<TaskItem> {
  final _keyColumn = GlobalKey();
  double? _columnHeight;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(_getColumnHeight);
    super.initState();
  }

  void _getColumnHeight(_) {
    final RenderBox? renderColumn =
        _keyColumn.currentContext?.findRenderObject() as RenderBox?;

    setState(() {
      _columnHeight = renderColumn?.size.height;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        StatusCheckBox(
          widget.currentTask == 1 ? true : false,
          widget.isFailed!,
          isDone: widget.statusDone == 2 ? true : false,
          showTextButton: widget.textButtonLabel != null &&
              widget.onTextButtonLabelPressed != null,
          isLast: widget.isLast!,
          isCorrection: widget.isCorrection!,
          forceVisibleTextButton: widget.forceVisibleTextButton!,
          lineHeight: _columnHeight,
        ),
        SizedBox(width: 18.5.w),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.task,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14.sp,
                  color: CustomColor.primaryBlack,
                ),
              ),
              Visibility(
                visible: widget.currentTask == 1 ||
                    widget.statusDone == 2 ||
                    widget.isFailed! ||
                    widget.forceVisibleTextButton!,
                child: Padding(
                  padding: EdgeInsets.only(right: 30.w),
                  child: Column(
                    key: _keyColumn,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (widget.hasDescription == true)
                        Text(
                          widget.description!,
                          style: tsCaption2.copyWith(fontSize: 11.sp),
                        ),
                      Visibility(
                        visible: widget.textButtonLabel != null &&
                            widget.onTextButtonLabelPressed != null &&
                            widget.forceVisibleTextButton!,
                        child: GestureDetector(
                          onTap: () => widget.onTextButtonLabelPressed != null
                              ? widget.onTextButtonLabelPressed!()
                              : null,
                          child: Padding(
                            padding: EdgeInsets.only(top: 4.h),
                            child: widget.colorTextButton != null
                                ? Row(
                                    children: [
                                      Icon(
                                        Icons.check,
                                        color: widget.colorTextButton,
                                      ),
                                      const SizedBox(width: 10),
                                      Text(
                                        widget.textButtonLabel ?? '-',
                                        style: tsCaption1.copyWith(
                                          color: widget.colorTextButton,
                                        ),
                                      ),
                                    ],
                                  )
                                : Text(
                                    widget.textButtonLabel ?? '-',
                                    style: tsCaption1.copyWith(
                                      color: widget.colorTextButton ??
                                          CustomColor.secondaryBlue,
                                    ),
                                  ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
