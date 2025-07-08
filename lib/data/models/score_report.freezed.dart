// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'score_report.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ScoreReport {

 int get id; int get gseScore; int get listening; int get speaking; int get reading; int get writing; List<Subskill> get subskills; DateTime get date;
/// Create a copy of ScoreReport
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ScoreReportCopyWith<ScoreReport> get copyWith => _$ScoreReportCopyWithImpl<ScoreReport>(this as ScoreReport, _$identity);

  /// Serializes this ScoreReport to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ScoreReport&&(identical(other.id, id) || other.id == id)&&(identical(other.gseScore, gseScore) || other.gseScore == gseScore)&&(identical(other.listening, listening) || other.listening == listening)&&(identical(other.speaking, speaking) || other.speaking == speaking)&&(identical(other.reading, reading) || other.reading == reading)&&(identical(other.writing, writing) || other.writing == writing)&&const DeepCollectionEquality().equals(other.subskills, subskills)&&(identical(other.date, date) || other.date == date));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,gseScore,listening,speaking,reading,writing,const DeepCollectionEquality().hash(subskills),date);

@override
String toString() {
  return 'ScoreReport(id: $id, gseScore: $gseScore, listening: $listening, speaking: $speaking, reading: $reading, writing: $writing, subskills: $subskills, date: $date)';
}


}

/// @nodoc
abstract mixin class $ScoreReportCopyWith<$Res>  {
  factory $ScoreReportCopyWith(ScoreReport value, $Res Function(ScoreReport) _then) = _$ScoreReportCopyWithImpl;
@useResult
$Res call({
 int id, int gseScore, int listening, int speaking, int reading, int writing, List<Subskill> subskills, DateTime date
});




}
/// @nodoc
class _$ScoreReportCopyWithImpl<$Res>
    implements $ScoreReportCopyWith<$Res> {
  _$ScoreReportCopyWithImpl(this._self, this._then);

  final ScoreReport _self;
  final $Res Function(ScoreReport) _then;

/// Create a copy of ScoreReport
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? gseScore = null,Object? listening = null,Object? speaking = null,Object? reading = null,Object? writing = null,Object? subskills = null,Object? date = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,gseScore: null == gseScore ? _self.gseScore : gseScore // ignore: cast_nullable_to_non_nullable
as int,listening: null == listening ? _self.listening : listening // ignore: cast_nullable_to_non_nullable
as int,speaking: null == speaking ? _self.speaking : speaking // ignore: cast_nullable_to_non_nullable
as int,reading: null == reading ? _self.reading : reading // ignore: cast_nullable_to_non_nullable
as int,writing: null == writing ? _self.writing : writing // ignore: cast_nullable_to_non_nullable
as int,subskills: null == subskills ? _self.subskills : subskills // ignore: cast_nullable_to_non_nullable
as List<Subskill>,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _ScoreReport implements ScoreReport {
  const _ScoreReport({this.id = 0, required this.gseScore, required this.listening, required this.speaking, required this.reading, required this.writing, required final  List<Subskill> subskills, required this.date}): _subskills = subskills;
  factory _ScoreReport.fromJson(Map<String, dynamic> json) => _$ScoreReportFromJson(json);

@override@JsonKey() final  int id;
@override final  int gseScore;
@override final  int listening;
@override final  int speaking;
@override final  int reading;
@override final  int writing;
 final  List<Subskill> _subskills;
@override List<Subskill> get subskills {
  if (_subskills is EqualUnmodifiableListView) return _subskills;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_subskills);
}

@override final  DateTime date;

/// Create a copy of ScoreReport
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ScoreReportCopyWith<_ScoreReport> get copyWith => __$ScoreReportCopyWithImpl<_ScoreReport>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ScoreReportToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ScoreReport&&(identical(other.id, id) || other.id == id)&&(identical(other.gseScore, gseScore) || other.gseScore == gseScore)&&(identical(other.listening, listening) || other.listening == listening)&&(identical(other.speaking, speaking) || other.speaking == speaking)&&(identical(other.reading, reading) || other.reading == reading)&&(identical(other.writing, writing) || other.writing == writing)&&const DeepCollectionEquality().equals(other._subskills, _subskills)&&(identical(other.date, date) || other.date == date));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,gseScore,listening,speaking,reading,writing,const DeepCollectionEquality().hash(_subskills),date);

@override
String toString() {
  return 'ScoreReport(id: $id, gseScore: $gseScore, listening: $listening, speaking: $speaking, reading: $reading, writing: $writing, subskills: $subskills, date: $date)';
}


}

/// @nodoc
abstract mixin class _$ScoreReportCopyWith<$Res> implements $ScoreReportCopyWith<$Res> {
  factory _$ScoreReportCopyWith(_ScoreReport value, $Res Function(_ScoreReport) _then) = __$ScoreReportCopyWithImpl;
@override @useResult
$Res call({
 int id, int gseScore, int listening, int speaking, int reading, int writing, List<Subskill> subskills, DateTime date
});




}
/// @nodoc
class __$ScoreReportCopyWithImpl<$Res>
    implements _$ScoreReportCopyWith<$Res> {
  __$ScoreReportCopyWithImpl(this._self, this._then);

  final _ScoreReport _self;
  final $Res Function(_ScoreReport) _then;

/// Create a copy of ScoreReport
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? gseScore = null,Object? listening = null,Object? speaking = null,Object? reading = null,Object? writing = null,Object? subskills = null,Object? date = null,}) {
  return _then(_ScoreReport(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,gseScore: null == gseScore ? _self.gseScore : gseScore // ignore: cast_nullable_to_non_nullable
as int,listening: null == listening ? _self.listening : listening // ignore: cast_nullable_to_non_nullable
as int,speaking: null == speaking ? _self.speaking : speaking // ignore: cast_nullable_to_non_nullable
as int,reading: null == reading ? _self.reading : reading // ignore: cast_nullable_to_non_nullable
as int,writing: null == writing ? _self.writing : writing // ignore: cast_nullable_to_non_nullable
as int,subskills: null == subskills ? _self._subskills : subskills // ignore: cast_nullable_to_non_nullable
as List<Subskill>,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}


/// @nodoc
mixin _$Subskill {

 int get subskill; int get skills; String get name; String get description; int get score; String get content;
/// Create a copy of Subskill
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SubskillCopyWith<Subskill> get copyWith => _$SubskillCopyWithImpl<Subskill>(this as Subskill, _$identity);

  /// Serializes this Subskill to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Subskill&&(identical(other.subskill, subskill) || other.subskill == subskill)&&(identical(other.skills, skills) || other.skills == skills)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.score, score) || other.score == score)&&(identical(other.content, content) || other.content == content));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,subskill,skills,name,description,score,content);

@override
String toString() {
  return 'Subskill(subskill: $subskill, skills: $skills, name: $name, description: $description, score: $score, content: $content)';
}


}

/// @nodoc
abstract mixin class $SubskillCopyWith<$Res>  {
  factory $SubskillCopyWith(Subskill value, $Res Function(Subskill) _then) = _$SubskillCopyWithImpl;
@useResult
$Res call({
 int subskill, int skills, String name, String description, int score, String content
});




}
/// @nodoc
class _$SubskillCopyWithImpl<$Res>
    implements $SubskillCopyWith<$Res> {
  _$SubskillCopyWithImpl(this._self, this._then);

  final Subskill _self;
  final $Res Function(Subskill) _then;

/// Create a copy of Subskill
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? subskill = null,Object? skills = null,Object? name = null,Object? description = null,Object? score = null,Object? content = null,}) {
  return _then(_self.copyWith(
subskill: null == subskill ? _self.subskill : subskill // ignore: cast_nullable_to_non_nullable
as int,skills: null == skills ? _self.skills : skills // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,score: null == score ? _self.score : score // ignore: cast_nullable_to_non_nullable
as int,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _Subskill implements Subskill {
  const _Subskill({required this.subskill, required this.skills, required this.name, required this.description, required this.score, required this.content});
  factory _Subskill.fromJson(Map<String, dynamic> json) => _$SubskillFromJson(json);

@override final  int subskill;
@override final  int skills;
@override final  String name;
@override final  String description;
@override final  int score;
@override final  String content;

/// Create a copy of Subskill
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SubskillCopyWith<_Subskill> get copyWith => __$SubskillCopyWithImpl<_Subskill>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SubskillToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Subskill&&(identical(other.subskill, subskill) || other.subskill == subskill)&&(identical(other.skills, skills) || other.skills == skills)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.score, score) || other.score == score)&&(identical(other.content, content) || other.content == content));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,subskill,skills,name,description,score,content);

@override
String toString() {
  return 'Subskill(subskill: $subskill, skills: $skills, name: $name, description: $description, score: $score, content: $content)';
}


}

/// @nodoc
abstract mixin class _$SubskillCopyWith<$Res> implements $SubskillCopyWith<$Res> {
  factory _$SubskillCopyWith(_Subskill value, $Res Function(_Subskill) _then) = __$SubskillCopyWithImpl;
@override @useResult
$Res call({
 int subskill, int skills, String name, String description, int score, String content
});




}
/// @nodoc
class __$SubskillCopyWithImpl<$Res>
    implements _$SubskillCopyWith<$Res> {
  __$SubskillCopyWithImpl(this._self, this._then);

  final _Subskill _self;
  final $Res Function(_Subskill) _then;

/// Create a copy of Subskill
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? subskill = null,Object? skills = null,Object? name = null,Object? description = null,Object? score = null,Object? content = null,}) {
  return _then(_Subskill(
subskill: null == subskill ? _self.subskill : subskill // ignore: cast_nullable_to_non_nullable
as int,skills: null == skills ? _self.skills : skills // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,score: null == score ? _self.score : score // ignore: cast_nullable_to_non_nullable
as int,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
