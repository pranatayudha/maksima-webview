import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'application/app/app.locator.dart';
import 'application/app/pinang_maksima_web.dart';
import 'application/helpers/my_http_overrides.dart';
import 'infrastructure/database/hive_db.dart';
import 'ui/customs/custom_bottom_sheets/setup_bottom_sheet_ui.dart';
import 'ui/customs/custom_dialogs/setup_dialog_ui.dart';

Future mainCommon() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle.dark.copyWith(
      statusBarColor: Colors.transparent, // Android
      statusBarIconBrightness: Brightness.dark, // Android
      statusBarBrightness: Brightness.light, // iOS
    ),
  );

  await HiveDB.init();

  setupLocator();
  setupDialogUI();
  setupBottomSheetUI();
  initializeDateFormatting();

  HttpOverrides.global = MyHttpOverrides();
  runApp(const PinangMaksimaWeb());
}
