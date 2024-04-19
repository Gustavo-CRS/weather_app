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
    final height = MediaQuery.of(context).size.height;
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
                            color: AppColors.white,
                            fontSize: 32,
                          ),
                        ),
                      ),
                      content: Text(
                        'Error: ${controller.error}',
                        style: const TextStyle(
                            color: AppColors.white, fontSize: 18),
                        textAlign: TextAlign.center,
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Center(
                            child: Text(
                              'Close',
                              style: TextStyle(color: AppColors.white),
                            ),
                          ),
                        ),
                      ],
                    );
                  }
                  if (controller.loading) {
                    return const CircularProgressIndicator();
                  }
                  return Container(
                    width: width >= 600 ? width * 0.24 : width * 0.84,
                    height: height >= 900 ? height * 0.2 : height * 0.3,
                    child: Card(
                      elevation: 24,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      shadowColor: AppColors.secondaryBlack,
                      color: AppColors.deepBlueGrey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                controller.isCelsius
                                    ? controller.tempCelsius
                                    : controller.temperature,
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
                              TextButton(
                                onPressed: () {
                                  controller.changeUnit();
                                },
                                child: const Text(
                                  'Change unit',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: AppColors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 18),
                            child: Text(
                              'Weather condition: ${controller.description}',
                              style: TextStyle(
                                fontSize: width >= 600 ? 24 : 20,
                                fontWeight: FontWeight.normal,
                                color: AppColors.white.withOpacity(0.8),
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
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
