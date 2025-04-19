import 'package:flutter/material.dart';
import 'package:faba_weather_app/core/widgets/widgets.dart'
    show ErrorMessageWidget, LoadingWidget;
import 'package:faba_weather_app/presentation/base/base_view_model.dart';
import 'package:provider/provider.dart';

abstract class BasePage extends StatefulWidget {
  const BasePage({super.key});
}

abstract class BasePageState<T extends BasePage, VM extends BaseViewModel>
    extends State<T> {
  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<VM>();
    return ChangeNotifierProvider.value(
      value: viewModel,
      child: Consumer<VM>(
        builder: (context, vm, child) {
          return Scaffold(
            body: Stack(
              children: [
                buildBody(context, vm),
                if (vm.isLoading) const LoadingWidget(),
                if (vm.error != null)
                  ErrorMessageWidget(
                    message: vm.error!,
                    onDismiss: () => vm.clearError(),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget buildBody(BuildContext context, VM viewModel);
}
