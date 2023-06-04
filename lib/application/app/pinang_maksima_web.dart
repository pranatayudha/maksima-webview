import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_web_frame/flutter_web_frame.dart';
import 'package:provider/provider.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../flavors.dart';
import '../enums/connectivity_status.dart';
import '../services/connectivity_service.dart';
import 'app.router.dart';
import 'constants/custom_color.dart';
import 'theme/palette.dart';

class PinangMaksimaWeb extends StatelessWidget {
  const PinangMaksimaWeb({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      useInheritedMediaQuery: true,
      designSize: const Size(1024, 613),
      builder: (context, child) => StreamProvider<ConnectivityStatus>(
        initialData: ConnectivityStatus.wiFi,
        create: (context) =>
            ConnectivityService().connectionStatusController.stream,
        child: FlutterWebFrame(
          maximumSize: const Size(525, 613),
          enabled: true,
          backgroundColor: Colors.grey.shade500,
          builder: (ctx) {
            return MaterialApp(
              title: F.variables['title'],
              theme: ThemeData(
                primarySwatch: Palette.primaryBlue,
                primaryColor: CustomColor.primaryColor,
                visualDensity: VisualDensity.adaptivePlatformDensity,
                fontFamily: 'Nunito',
              ),
              debugShowCheckedModeBanner: false,
              navigatorKey: StackedService.navigatorKey,
              onGenerateRoute: StackedRouter().onGenerateRoute,
              builder: (ctx2, child) {
                return MediaQuery(
                  child: child!,
                  data: MediaQuery.of(ctx2).copyWith(textScaleFactor: 1.0),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
