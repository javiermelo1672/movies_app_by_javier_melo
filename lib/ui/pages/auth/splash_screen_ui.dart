import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:leal_test_by_javier_melo/app/settings/app_colors.dart';
import 'package:leal_test_by_javier_melo/app/settings/application_assets.dart';
import 'package:leal_test_by_javier_melo/blocs/splash_bloc.dart';
import 'package:leal_test_by_javier_melo/ui/base_state.dart';
import 'package:leal_test_by_javier_melo/ui/no_unique_widgets_factory/abstract_factory.dart';
import 'package:leal_test_by_javier_melo/ui/pages/auth/login_ui.dart';
import 'package:leal_test_by_javier_melo/ui/pages/home_tabs/home_ui.dart';
import 'package:leal_test_by_javier_melo/utils/utils_methos.dart';

class SplashScreenUI extends StatefulWidget {
  SplashScreenUI({Key? key}) : super(key: key);

  @override
  _SplashScreenUIState createState() => _SplashScreenUIState();
}

class _SplashScreenUIState extends BaseState<SplashScreenUI, SplashBloc> {
  final List<IWidgetsFactory> widgetsFactoryList = [
    MaterialWidgetsFactory(),
    CupertinoWidgetsFactory(),
  ];
  late IActivityIndicator _activityIndicator;
  late int _selectedFactoryIndex;
  @override
  void initState() {
    super.initState();
    bloc!.iniPrefs();
    _selectedFactoryIndex = verifyPlatform();
    _createWidgets();
    Timer(const Duration(seconds: 3), retry);
  }

  void _createWidgets() {
    _activityIndicator =
        widgetsFactoryList[_selectedFactoryIndex].createActivityIndicator();
  }

  void retry() {
    bloc!.validateLoginState().then((value) {
      if (value) {
      } else {
        goToLogin();
      }
    });
  }

  Future<void> goToHome() async {}

  Future<void> goToLogin() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        // Navigator.of(context).pushReplacement(
        //     MaterialPageRoute(builder: (context) => LoginUI()));
        Navigator.of(context)
            .pushReplacement(MaterialPageRoute(builder: (context) => HomeUI()));
      }
    } on SocketException catch (_) {
      bool? isUserLocked;
      showCustomAlert(
        icon: Icons.signal_wifi_off,
        color: Colors.red,
        message: l10n!.error,
        title: l10n!.messageError!,
        positiveTextButton:
            (isUserLocked ?? false) ? l10n!.accept : l10n!.retry,
        positiveOnPressed: () {
          (isUserLocked ?? false)
              ? const Text("error")
              : (Navigator.of(context).pop());
          retry();
        },
        negativeTextButton:
            (isUserLocked ?? false) ? l10n!.accept : l10n!.cancel,
        negativeOnPressed: () {
          (isUserLocked ?? false) ? const Text("error") : exit(0);
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Align(
          alignment: Alignment.center,
          child: Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(ApplicationAssets.launchImage),
                    fit: BoxFit.cover)),
          ),
        ),
        Align(
          alignment: Alignment.center,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(l10n!.appName!,
                    style: Theme.of(context).textTheme.subtitle1!.copyWith(
                          color: whiteColor,
                          fontSize: 23,
                          fontWeight: FontWeight.bold,
                        )),
                const SizedBox(
                  height: 15,
                ),
                _activityIndicator.render(),
              ]),
        ),
      ]),
    );
  }

  @override
  getBlocInstance() {
    return SplashBloc();
  }
}
