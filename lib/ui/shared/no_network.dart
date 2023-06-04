// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../application/app/constants/image_constants.dart';
import 'custom_button.dart';
import 'styles.dart';

class NoNetwork extends StatelessWidget {
  const NoNetwork({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _statusBarHeight = MediaQuery.of(context).padding.top;

    return Scaffold(
      backgroundColor: Theme.of(context).canvasColor,
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(ImageConstants.blueTexturedBg),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            top: _statusBarHeight + 71,
            right: 40,
            child: Image.asset(ImageConstants.noWifi, scale: 3),
          ),
          Positioned(
            left: 20,
            right: 20,
            top: MediaQuery.of(context).size.height / 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Offline', style: tsHeading1White),
                const SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsets.only(right: 53),
                  child: Text(
                    'Anda saat ini sedang tidak terhubung dengan koneksi internet. Silahkan periksa jaringan Anda dan cobalah kembali.',
                    style: tsBody6White,
                  ),
                ),
                const SizedBox(height: 64),
                CustomButton(
                  label: 'OK',
                  color: Colors.white,
                  labelColor: const Color(0xff0F6FC2),
                  radius: 8,
                  onPressed: () {
                    if (Platform.isIOS) {
                      exit(0);
                    } else if (Platform.isAndroid) {
                      SystemNavigator.pop();
                    }
                  },
                  isBusy: false,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
