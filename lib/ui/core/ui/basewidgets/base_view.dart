import 'package:exam_analyzer/ui/core/viewmodel.dart/base_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BaseView<T extends BaseViewModel> extends StatelessWidget {
  final AppBar Function(T viewModel)? appBarBuilder;
  final Widget Function(T viewModel) childBuilder;
  final EdgeInsetsGeometry padding;
  final Widget? Function(T viewModel)? fabBuilder;

  const BaseView({
    super.key,
    this.appBarBuilder,
    required this.childBuilder,
    this.padding = const EdgeInsets.all(0),
    this.fabBuilder,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<T>(
      builder: (context, viewModel, _) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (viewModel.error != null) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(viewModel.error!),
                action: SnackBarAction(
                  label: 'Retry',
                  onPressed: viewModel.onRetry,
                ),
              ),
            );
            viewModel.clearError();
          }
        });

        return Stack(
          children: [
            Scaffold(
              appBar: appBarBuilder?.call(viewModel),
              body: Padding(
                padding: padding,
                child: childBuilder(viewModel), // ✅ ViewModel passed to child
              ),
              floatingActionButton: fabBuilder?.call(viewModel),
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
