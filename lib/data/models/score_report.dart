import 'package:freezed_annotation/freezed_annotation.dart';

part 'score_report.freezed.dart';
part 'score_report.g.dart';

@freezed
abstract class ScoreReport with _$ScoreReport {
  const factory ScoreReport({
    @Default(0) int id,
    required int gseScore,
    required int listening,
    required int speaking,
    required int reading,
    required int writing,
    required List<Subskill> subskills,
    required DateTime date,
  }) = _ScoreReport;

  factory ScoreReport.fromJson(Map<String, dynamic> json) =>
      _$ScoreReportFromJson(json);
}

@freezed
abstract class Subskill with _$Subskill {
  const factory Subskill({
    required int subskill,
    required int skills,
    required String name,
    required String description,
    required int score,
    required String content,
  }) = _Subskill;

  factory Subskill.fromJson(Map<String, dynamic> json) =>
      _$SubskillFromJson(json);
}
