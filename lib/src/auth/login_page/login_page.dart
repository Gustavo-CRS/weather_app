import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:weather_app/src/auth/login_controller/login_controller.dart';
import 'package:weather_app/src/utils/theme/app_colors.dart';

class LoginPage extends StatelessWidget {
  final controller = LoginController();
  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: width,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [AppColors.purple, AppColors.darkBlue],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(bottom: 8, left: 26),
                      child: Text(
                        'Username',
                        style: TextStyle(color: AppColors.white),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18),
                      child: Observer(builder: (_) {
                        return SizedBox(
                          width: width >= 600 ? width * 0.32 : width * 0.82,
                          height: height * 0.1,
                          child: TextFormField(
                            onChanged: controller.setUsername,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              hintText: 'Type an username',
                              prefixIcon: const Icon(Icons.person),
                              iconColor: AppColors.mainBlack,
                              filled: true,
                              fillColor: AppColors.white,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: BorderSide.none,
                              ),
                            ),
                          ),
                        );
                      }),
                    ),
                  ],
                ),
                const SizedBox(height: 16.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(bottom: 8, left: 26),
                      child: Text(
                        'Password',
                        style: TextStyle(color: AppColors.white),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18),
                      child: Observer(builder: (_) {
                        return SizedBox(
                          width: width >= 600 ? width * 0.32 : width * 0.82,
                          height: height * 0.1,
                          child: TextFormField(
                            onChanged: controller.setPassword,
                            obscureText: controller.obscureText,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              hintText: 'Type a password',
                              prefixIcon: const Icon(Icons.lock),
                              suffixIcon: IconButton(
                                icon: const Icon(Icons.visibility),
                                onPressed: controller.toggleObscureText,
                              ),
                              iconColor: AppColors.mainBlack,
                              filled: true,
                              fillColor: AppColors.white,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: BorderSide.none,
                              ),
                            ),
                          ),
                        );
                      }),
                    ),
                  ],
                ),
                SizedBox(height: height * 0.04),
                SizedBox(
                  width: width >= 600 ? width * 0.20 : width * 0.38,
                  height: height * 0.05,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      backgroundColor:
                          MaterialStateProperty.all(AppColors.green),
                    ),
                    onPressed: () {
                      if (controller.isValid) {
                        controller.login(context);
                      } else {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: const Center(child: Text('Error')),
                            content: Container(
                              constraints: BoxConstraints(
                                  maxHeight: height * .1, maxWidth: width * .4),
                              child: const Center(
                                  child: Text('Username or password invalid')),
                            ),
                          ),
                        );
                      }
                    },
                    child: const Text(
                        style: TextStyle(fontSize: 18, color: AppColors.white),
                        'Log In'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
