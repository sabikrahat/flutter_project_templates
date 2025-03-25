import '../../../core/api_client/api_client.dart';
import '../../../injector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/router/go_routes.dart';
import '../../../core/shared/ksnackbar/ksnackbar.dart';
import '../../../core/utils/logger/logger_helper.dart';

typedef AuthNotifier = NotifierProvider<AuthProvider, void>;

final authProvider = AuthNotifier(AuthProvider.new);

class AuthProvider extends Notifier {
  final signinFormKey = GlobalKey<FormState>();
  final signupFormKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool obscureText = true;
  bool isLoading = false;

  @override
  void build() {
    nameController.text = 'John Doe';
    emailController.text = 'john@mail.com';
    passwordController.text = 'changeme';
  }

  void toggleObscureText() {
    obscureText = !obscureText;
    ref.notifyListeners();
  }

  Future<void> signin(BuildContext context) async {
    if (!(signinFormKey.currentState?.validate() ?? false)) return;
    isLoading = true;
    ref.notifyListeners();
    //
    try {
      await sl<ApiClient>().signin(email: emailController.text, password: passwordController.text);
      isLoading = false;
      ref.notifyListeners();
      goRouter.refresh();
    } catch (e) {
      log.e(e);
      isLoading = false;
      ref.notifyListeners();
      if (!context.mounted) return;
      KSnackbar.error(context, e.toString());
    }
  }

  Future<void> signup(BuildContext context) async {
    if (!(signupFormKey.currentState?.validate() ?? false)) return;
    isLoading = true;
    ref.notifyListeners();
    //
    try {
      await sl<ApiClient>().signup(
        data: {
          'name': nameController.text,
          'email': emailController.text,
          'password': passwordController.text,
        },
      );
      isLoading = false;
      ref.notifyListeners();
      goRouter.refresh();
    } catch (e) {
      log.e(e);
      isLoading = false;
      ref.notifyListeners();
      if (!context.mounted) return;
      KSnackbar.error(context, e.toString());
    }
  }

  Future<void> forgetPassword(BuildContext context) async {
    KSnackbar.info(context, 'Will update soon');
    return;
  }

  Future<void> signout(BuildContext context) async {
    EasyLoading.show();
    try {
      await sl<ApiClient>().signout();
      EasyLoading.dismiss();
      goRouter.refresh();
    } catch (e) {
      log.e(e);
      EasyLoading.dismiss();
      if (!context.mounted) return;
      KSnackbar.error(context, e.toString());
    }
  }
}
