import 'package:exam_analyzer/data/repositories/i_tools_repository.dart';
import 'package:exam_analyzer/data/services/logging_service/i_logging_service.dart';
import 'package:exam_analyzer/data/services/storage/i_user_default_service.dart';
import 'package:exam_analyzer/data/utils/result.dart';
import 'package:exam_analyzer/ui/core/loacalization/app_localization.dart';
import 'package:url_launcher/url_launcher.dart';

class ToolsRepository extends IToolsRepository {
  final AppLocalization _localization;

  final IUserDefaultsService _userDefaultsService;
  final ILoggingService _loggingService;
  ToolsRepository(
    this._localization,
    this._userDefaultsService,
    this._loggingService,
  );

  @override
  Future<Result<bool>> openNotesLink() async {
    final urlResult = await getNotesLink();
    if (urlResult.isSuccess) {
      final uri = Uri.parse(urlResult.data!);
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri, mode: LaunchMode.externalApplication);
        return Result.success(true);
      } else {
        return Result.failure(
          _localization.couldNotLaunch(url: urlResult.data!),
        );
      }
    } else {
      return Result.failure(_localization.noNotesErrMsg);
    }
  }

  @override
  Future<Result<bool>> updateNotesLink(String url) async {
    try {
      await _userDefaultsService.setNotesLink(url);
      return Result.success(true);
    } catch (e) {
      _loggingService.error(msg: _localization.addNotesErrMsg, e: e);
      return Result.failure(_localization.addNotesErrMsg);
    }
  }

  @override
  Future<Result<String?>> getNotesLink() async {
    final result = await _userDefaultsService.getNotesLink();
    return Result.success(result);
  }
}
