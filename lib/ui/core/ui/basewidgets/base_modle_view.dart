import 'package:exam_analyzer/ui/core/loacalization/app_localization.dart';
import 'package:exam_analyzer/ui/core/viewmodel.dart/base_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BaseModleView<T extends BaseViewModel> extends StatelessWidget {
  final Widget Function(T viewModel) childBuilder;
  final EdgeInsetsGeometry padding;

  const BaseModleView({
    super.key,
    required this.childBuilder,
    this.padding = const EdgeInsets.all(0),
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<T>(
      builder: (context, viewModel, _) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (viewModel.error != null) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(viewModel.error!.message),
                action:
                    viewModel.error!.retry
                        ? SnackBarAction(
                          label: AppLocalization.of(context).retryTitle,
                          onPressed: viewModel.onRetry,
                        )
                        : null,
              ),
            );
            viewModel.clearError();
          }
        });

        return Stack(
          children: [
            Padding(
              padding: padding,
              child: childBuilder(viewModel), // ✅ ViewModel passed to child
            ),
            if (viewModel.isLoading) ...[
              const Opacity(
                opacity: 0.4,
                child: ModalBarrier(dismissible: false, color: Colors.black),
              ),
              const Center(child: CircularProgressIndicator()),
            ],
          ],
        );
      },
    );
  }
}
