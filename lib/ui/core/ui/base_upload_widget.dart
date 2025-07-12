import 'package:exam_analyzer/ui/core/ui/container_with_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class BaseUploadWidget extends StatelessWidget {
  const BaseUploadWidget({
    super.key,
    required this.label,
    required this.onFilePicked,
  });
  final String label;
  final Function(String path) onFilePicked;

  Future<void> pickJsonFile({required Function(String) onSuccess}) async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['json'],
    );
    if (result != null && result.files.single.path != null) {
      onSuccess(result.files.single.path!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ContainerWithBorder(
        child: ListTile(
          leading: const Icon(Icons.upload_file),
          title: Text(label),
          onTap: () {
            pickJsonFile(onSuccess: onFilePicked);
          },
        ),
      ),
    );
  }
}
