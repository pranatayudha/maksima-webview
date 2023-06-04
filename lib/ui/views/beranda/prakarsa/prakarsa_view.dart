// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

import '../../../shared/network_sensitive.dart';
import 'prakarsa_view_ritel.dart';
import 'widgets/prakarsa_header.dart';

class PrakarsaView extends StatefulWidget {
  final int? index;
  final int? prakarsaTabsIndex;

  const PrakarsaView({Key? key, this.index, this.prakarsaTabsIndex})
      : super(key: key);

  @override
  _PrakarsaViewState createState() => _PrakarsaViewState();
}

class _PrakarsaViewState extends State<PrakarsaView> {
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
              children: const [
                PrakarsaHeader(),
                PrakarsaViewRitel(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
