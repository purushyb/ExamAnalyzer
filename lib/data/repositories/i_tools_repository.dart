import 'package:exam_analyzer/data/utils/result.dart';

abstract class IToolsRepository {
  Future<Result<bool>> openNotesLink();
  Future<Result<bool>> updateNotesLink(String url);
  Future<Result<String?>> getNotesLink();
}
