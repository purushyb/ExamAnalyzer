// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'score_report.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ScoreReport _$ScoreReportFromJson(Map<String, dynamic> json) => _ScoreReport(
  gseScore: (json['gseScore'] as num).toInt(),
  listening: (json['listening'] as num).toInt(),
  speaking: (json['speaking'] as num).toInt(),
  reading: (json['reading'] as num).toInt(),
  writing: (json['writing'] as num).toInt(),
  subskills:
      (json['subskills'] as List<dynamic>)
          .map((e) => Subskill.fromJson(e as Map<String, dynamic>))
          .toList(),
  date: DateTime.parse(json['date'] as String),
);

Map<String, dynamic> _$ScoreReportToJson(_ScoreReport instance) =>
    <String, dynamic>{
      'gseScore': instance.gseScore,
      'listening': instance.listening,
      'speaking': instance.speaking,
      'reading': instance.reading,
      'writing': instance.writing,
      'subskills': instance.subskills,
      'date': instance.date.toIso8601String(),
    };

_Subskill _$SubskillFromJson(Map<String, dynamic> json) => _Subskill(
  subskill: (json['subskill'] as num).toInt(),
  skills: (json['skills'] as num).toInt(),
  name: json['name'] as String,
  description: json['description'] as String,
  score: (json['score'] as num).toInt(),
  content: json['content'] as String,
);

Map<String, dynamic> _$SubskillToJson(_Subskill instance) => <String, dynamic>{
  'subskill': instance.subskill,
  'skills': instance.skills,
  'name': instance.name,
  'description': instance.description,
  'score': instance.score,
  'content': instance.content,
};
