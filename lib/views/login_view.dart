import 'package:fl_colegio/theme/app_theme.dart';
import 'package:fl_colegio/view_models/view_models.dart';
import 'package:fl_colegio/views/load_view.dart';
import 'package:fl_colegio/widgets/widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<LoginViewModel>(context);
    final size = MediaQuery.of(context).size;

    return Stack(
      children: [
        Scaffold(
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  const SizedBox(height: 40),
                  Center(
                    child: Image(
                      image: const AssetImage("assets/logo.png"),
                      width: size.width * 0.5,
                    ),
                  ),
                  const SizedBox(height: 75),
                  Form(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    key: vm.formKey,
                    child: Column(
                      children: [
                        const SizedBox(height: 20),
                        const Row(
                          children: [
                            Text(
                              "Inicia sesión",
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: AppTheme.primary,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        EmailInputWidget(
                          formValues: vm.formValues,
                          formProperty: "email",
                        ),
                        const SizedBox(height: 40),
                        PasswordInputWidget(
                          formProperty: "pass",
                          formValues: vm.formValues,
                          obscureText: vm.obscureText,
                          showPassword: vm.toggle,
                        ),
                        const SizedBox(height: 30),
                        // GestureDetector(
                        //   onTap: () => vm.navigateRecoverPassword(context),
                        //   child: const Text(
                        //     "Olvidé mi contraseña",
                        //     style: TextStyle(
                        //       color: AppTheme.secondaryColorDark,
                        //     ),
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                  // const SizedBox(height: 10),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  //   children: [
                  //     Switch(
                  //       activeColor: AppTheme.primary,
                  //       value: vm.isSliderDisabledSession,
                  //       onChanged: (value) => vm.disableSession(value),
                  //     ),
                  //     const Text(
                  //       "Mantener sesión iniciada",
                  //       style: TextStyle(
                  //         color: AppTheme.secondaryColorDark,
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  const SizedBox(height: 10),
                  GradientButtonWidget(
                    radius: 22,
                    onTap: () => vm.login(context),
                    text: "Iniciar Sesion",
                  ),

                  const SizedBox(height: 20),
                  GestureDetector(
                    onTap: () => vm.navigateSignUp(context),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "¿Primer ingreso?",
                          style: TextStyle(
                            color: AppTheme.secondaryColorDark,
                            fontSize: 18,
                          ),
                        ),
                        SizedBox(width: 20),
                        Text(
                          "Registrate",
                          style: TextStyle(
                            color: AppTheme.primary,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        if (vm.isLoading)
          const ModalBarrier(
            dismissible: false,
            // color: Colors.black.withOpacity(0.3),
            color: AppTheme.backgroundCololorDark,
          ),
        if (vm.isLoading) const LoadView(),
      ],
    );
  }
}
