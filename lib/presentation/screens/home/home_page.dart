import 'package:faba_weather_app/config/router/routes.dart';
import 'package:faba_weather_app/core/constants/app_colors.dart';
import 'package:faba_weather_app/core/constants/app_dimensions.dart';
import 'package:faba_weather_app/core/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:faba_weather_app/presentation/screens/home/home_vm.dart';
import 'package:go_router/go_router.dart';

class HomePage extends BasePage {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends BasePageState<HomePage, HomeViewModel> {
  @override
  Widget buildBody(BuildContext context, HomeViewModel viewModel) {
    return Container(
      padding: CustomSpacer.space32.horizontal,
      color: AppColors.primaryDark,
      child: SafeArea(
        child: Container(
          color: AppColors.primary,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: [
                  if (viewModel.location != null) ...[
                    Row(
                      children: [
                        Icon(Icons.location_on, color: Colors.white),
                        Text(
                          viewModel.weather?.cityName ?? "",
                          style: const TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ],
                  Spacer(),
                  IconButton(
                    onPressed: () => context.push(AppRoutes.settings),
                    icon: const Icon(Icons.settings),
                  ),
                  IconButton(
                    onPressed: viewModel.initializeLocation,
                    icon: const Icon(Icons.refresh),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
