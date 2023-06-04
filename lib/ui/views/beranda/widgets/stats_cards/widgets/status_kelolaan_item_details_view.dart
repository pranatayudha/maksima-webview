import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../application/enums/status_kelolaan_type.dart';
import '../../../../../shared/stateful_appbar_elevation_aware.dart';
import '../../../../../shared/styles.dart';
import 'status_kelolaan_customer_card.dart';

class StatusKelolaanItemDetailsView extends StatelessWidget {
  final StatusKelolaanType statusKelolaanType;
  final int value;

  const StatusKelolaanItemDetailsView({
    Key? key,
    required this.statusKelolaanType,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StatefulAppBarElevationAware(
      appBarTitle: parseStatusKelolaanTypeToString(statusKelolaanType),
      onLeadingPressed: () => Navigator.pop(context),
      children: [
        _buildNumberOfCustomers(),
        _buildCustomersList(value),
      ],
    );
  }

  Container _buildNumberOfCustomers() {
    return Container(
      color: Colors.grey.shade100,
      child: Container(
        margin: EdgeInsets.all(16.w),
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.r),
          boxShadow: const [subtleBoxShadows],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              '$value ',
              style: TextStyle(
                fontSize: 24.sp,
                fontWeight: FontWeight.w700,
                height: 1.h,
              ),
            ),
            Expanded(
              child: Text(
                'Orang',
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.black45,
                  height: 1.9.h,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCustomersList(value) {
    final customers = List.generate(
      value,
      (index) => StatusKelolaanCustomerCard(
        name: 'Nama Orang Ke-${index + 1}',
        loanAmount: 100000000,
        updatedAt: '15/02/2022',
      ),
    );

    return ListView.separated(
      padding: EdgeInsets.fromLTRB(16.w, 24.w, 16.w, 20.h),
      shrinkWrap: true,
      physics: const ScrollPhysics(),
      itemCount: customers.length,
      separatorBuilder: (context, index) => Divider(
        color: const Color(0xffC8C8C8).withOpacity(0.4),
        height: 25.h,
        thickness: 1.h,
      ),
      itemBuilder: (context, index) {
        final customer = customers[index];

        return StatusKelolaanCustomerCard(
          name: customer.name,
          loanAmount: customer.loanAmount,
          updatedAt: customer.updatedAt,
        );
      },
    );
  }
}
