import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:weather_app/src/home/home_controller/home_controller.dart';
import 'package:weather_app/src/utils/theme/app_colors.dart';

class HomePage extends StatelessWidget {
  final HomeController controller = HomeController();

  HomePage({super.key}) {
    controller.fetchCurrentLocationWeather();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: width,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [AppColors.purple, AppColors.mainBlack],
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Observer(
                builder: (_) {
                  if (controller.error.isNotEmpty) {
                    return AlertDialog(
                      title: const Center(
                        child: Text(
                          'Error',
                          style: TextStyle(
                            color: AppColors.red,
                            fontSize: 32,
                          ),
                        ),
                      ),
                      content: Text(
                        'Error: ${controller.error}',
                        style:
                            const TextStyle(color: AppColors.red, fontSize: 18),
                        textAlign: TextAlign.center,
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            controller.fetchCurrentLocationWeather();
                          },
                          child: const Center(
                            child: Text('Try again'),
                          ),
                        ),
                      ],
                    );
                  }
                  if (controller.loading) {
                    return const CircularProgressIndicator();
                  }
                  return Column(
                    children: [
                      Text(
                        controller.temperature,
                        style: TextStyle(
                          fontSize: width >= 600 ? 64 : 46,
                          fontWeight: FontWeight.bold,
                          color: AppColors.white,
                          shadows: const [
                            Shadow(
                              offset: Offset(0, 4),
                              blurRadius: 4.0,
                              color: AppColors.secondaryBlack,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'Weather condition: ${controller.description}',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.normal,
                          color: AppColors.white.withOpacity(0.8),
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
