import 'package:exam_analyzer/ui/core/viewmodel.dart/base_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PaddedScaffold<T extends BaseViewModel> extends StatelessWidget {
  final AppBar appBar;
  final Widget Function(T viewModel) childBuilder;
  final EdgeInsetsGeometry padding;
  final Widget? fab;

  const PaddedScaffold({
    super.key,
    required this.appBar,
    required this.childBuilder,
    this.padding = const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
    this.fab,
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
              appBar: appBar,
              body: Padding(
                padding: padding,
                child: childBuilder(viewModel), // 👈 inject viewModel to child
              ),
              floatingActionButton: fab,
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
