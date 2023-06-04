// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

import '../../shared/network_sensitive.dart';
import 'pipeline_view_ritel.dart';
import 'widgets/pipeline_header.dart';

class PipelineView extends StatefulWidget {
  final int? index;
  final double bottomPadding;

  const PipelineView({Key? key, this.index, required this.bottomPadding}) : super(key: key);

  @override
  _PipelineViewState createState() => _PipelineViewState();
}

class _PipelineViewState extends State<PipelineView> {
  @override
  Widget build(BuildContext context) {
    return NetworkSensitive(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          top: false,
          child: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: Column(
              children: [
                const PipelineHeader(),
                Expanded(child: PipelineViewRitel(bottomPadding: widget.bottomPadding)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
