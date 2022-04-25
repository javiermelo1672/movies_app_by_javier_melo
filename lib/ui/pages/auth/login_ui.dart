import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:leal_test_by_javier_melo/app/settings/app_colors.dart';
import 'package:leal_test_by_javier_melo/app/settings/application_assets.dart';
import 'package:leal_test_by_javier_melo/blocs/login_bloc.dart';
import 'package:leal_test_by_javier_melo/data_injector/injector.dart';
import 'package:leal_test_by_javier_melo/ui/base_state.dart';
import 'package:leal_test_by_javier_melo/ui/pages/home_tabs/home_ui.dart';
import 'package:leal_test_by_javier_melo/ui/platform_widgets/platform_round_button.dart';
import 'package:leal_test_by_javier_melo/ui/unique_widgets/underline_text.dart';
import '../../platform_widgets/platform_text_field.dart';

class LoginUI extends StatefulWidget {
  LoginUI({Key? key}) : super(key: key);

  @override
  State<LoginUI> createState() => _LoginUIState();
}

class _LoginUIState extends BaseState<LoginUI, LoginBloc> {
  final TextEditingController _userController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FocusNode _passwordNode = FocusNode();
  bool isTextPasswordObscure = true;
  bool _isLoginSelected = false;
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
        Container(
          height: double.infinity,
          width: double.infinity,
          color: blackColor.withOpacity(0.4),
        ),
        Align(
          alignment: Alignment.center,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Spacer(),
                Text(l10n!.welcomeMessage!,
                    style: Theme.of(context).textTheme.subtitle1!.copyWith(
                          color: whiteColor,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        )),
                const Spacer(),
                !_isLoginSelected ? _createInitialForm() : _createLoginForm(),
                !_isLoginSelected ? const Spacer() : const SizedBox(),
              ]),
        ),
      ]),
    );
  }

  Column _createInitialForm() {
    return Column(
      children: [
        SizedBox(
          width: 210,
          child: PlatformRoundButton(
            text: l10n!.signUp!,
            onPressed: () {
              showDefaultAlert(
                  title: l10n!.warning, message: l10n!.unimplementedFunction);
            },
            textColor: blackColor,
            color: mainColor,
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        SizedBox(
          width: 210,
          child: PlatformRoundButton(
            text: l10n!.login!,
            onPressed: () {
              setState(() {
                _isLoginSelected = true;
              });
            },
            textColor: blackColor,
            color: whiteColor,
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        UnderlineText(
          text: l10n!.forgotPassword,
          color: whiteColor,
          ontap: () {
            showDefaultAlert(
                title: l10n!.warning, message: l10n!.unimplementedFunction);
          },
        ),
      ],
    );
  }

  ClipRRect _createLoginForm() {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(35), topRight: Radius.circular(35)),
      child: Container(
        height: 400,
        width: double.infinity,
        color: blackColor.withOpacity(0.8),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 10,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      _isLoginSelected = false;
                    });
                  },
                  child: const Icon(Icons.close, color: whiteColor),
                ),
              ),
              const Spacer(),
              PlatformTextField(
                controller: _userController,
                labelText: l10n!.name,
                textInputAction: TextInputAction.next,
                autocorrect: false,
                onSubmitted: (value) {
                  FocusScope.of(context).requestFocus(_passwordNode);
                },
                onChanged: (value) {
                  bloc!.nameSink.add(value);
                },
                inputFormatters: [FilteringTextInputFormatter.deny(' ')],
                style: const TextStyle(color: whiteColor),
              ),
              const SizedBox(
                height: 15,
              ),
              StreamBuilder<bool>(
                initialData: true,
                stream: bloc!.emptyFields,
                builder: (context, emptyFieldsSnapshot) {
                  return PlatformTextField(
                    controller: _passwordController,
                    focusNode: _passwordNode,
                    labelText: l10n!.password,
                    textInputAction: TextInputAction.done,
                    obscureText: isTextPasswordObscure,
                    style: const TextStyle(color: whiteColor),
                    suffix: IconButton(
                      onPressed: () {
                        setState(() {
                          isTextPasswordObscure = !isTextPasswordObscure;
                        });
                      },
                      icon: isTextPasswordObscure
                          ? const Icon(Icons.visibility_off)
                          : const Icon(Icons.visibility),
                      color: whiteColor,
                    ),
                    onChanged: (value) {
                      bloc!.passwordSink.add(value);
                    },
                    onSubmitted: (_) {},
                  );
                },
              ),
              const Spacer(),
              StreamBuilder<bool>(
                initialData: true,
                stream: bloc!.emptyFields,
                builder: (context, emptyFieldsSnapshot) {
                  return StreamBuilder<bool>(
                      initialData: false,
                      stream: bloc!.loading,
                      builder: (context, loadingSnapshot) {
                        return SizedBox(
                          width: 210,
                          child: PlatformRoundButton(
                            text: l10n!.login!,
                            isLoading: loadingSnapshot.data,
                            onPressed:
                                emptyFieldsSnapshot.data! ? null : _login,
                            textColor: blackColor,
                            color: whiteColor,
                          ),
                        );
                      });
                },
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }

  _login() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        if (bloc!.loading.valueWrapper != null &&
            (bloc!.loading.valueWrapper?.value ?? false)) {
          return;
        }
        FocusScope.of(context).requestFocus(FocusNode());

        bloc!.login().then((value) {
          if (value.statusCode == "200") {
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => HomeUI()));
          } else {
            showDefaultAlert(title: l10n!.warning, message: value.message);
          }
        });
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
  void dispose() {
    _userController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  getBlocInstance() => LoginBloc(Injector().provideSecurityUseCase());
}
