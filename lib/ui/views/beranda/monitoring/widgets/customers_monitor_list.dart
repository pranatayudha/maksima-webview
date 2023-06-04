import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:stacked_hooks/stacked_hooks.dart';

import '../../../../shared/creation_aware_list_item.dart';
import '../monitoring_viewmodel.dart';
import 'nasabah_monitor_card.dart';

class CustomersMonitorList
    extends HookViewModelWidget<MonitoringRitelViewModel> {
  const CustomersMonitorList({
    Key? key,
  }) : super(key: key);

  @override
  Widget buildViewModelWidget(
    BuildContext context,
    MonitoringRitelViewModel viewModel,
  ) {
    return Expanded(
      child: RefreshIndicator(
        onRefresh: viewModel.refreshData,
        child: ListView.separated(
          itemCount: viewModel.monitoringList.length,
          itemBuilder: (context, index) {
            final customer = viewModel.monitoringList[index];

            return CreationAwareListItem(
              itemCreated: () => SchedulerBinding.instance.addPostFrameCallback(
                (timeStamp) => viewModel.handleItemCreated(index),
              ),
              child: NasabahMonitorCard(
                loanType: customer.loanType,
                initials: customer.initial ?? '-',
                nama: customer.namaDebitur ?? '-',
                totalLoanApproved: customer.plafond != null
                    ? double.parse(customer.plafond!)
                    : null,
                numberOfTransaction: customer.activeTransaction,
                totalTransaction: customer.totalTransaction != null
                    ? double.parse(customer.totalTransaction!)
                    : null,
                status: customer.status ?? '-',
                onPressed: () => viewModel.navigateToMonitoringDetails(
                  customer.idKelolaan,
                  customer.loanType,
                ),
              ),
            );
          },
          separatorBuilder: (context, index) => Divider(
            color: const Color(0xffC8C8C8).withOpacity(0.4),
            // height: 50,
            height: 1,
            thickness: 1,
          ),
        ),
      ),
    );
  }
}
