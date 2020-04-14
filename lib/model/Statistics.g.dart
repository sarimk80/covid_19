// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Statistics.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Statistics _$StatisticsFromJson(Map<String, dynamic> json) {
  return Statistics(
    statisticsGet: json['statisticsGet'] as String,
    parameters: json['parameters'] as List,
    errors: json['errors'] as List,
    results: json['results'] as int,
    response: (json['response'] as List)
        .map((e) => Response.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$StatisticsToJson(Statistics instance) =>
    <String, dynamic>{
      'statisticsGet': instance.statisticsGet,
      'parameters': instance.parameters,
      'errors': instance.errors,
      'results': instance.results,
      'response': instance.response,
    };

Response _$ResponseFromJson(Map<String, dynamic> json) {
  return Response(
    country: json['country'] as String,
    cases: Cases.fromJson(json['cases'] as Map<String, dynamic>),
    deaths: Deaths.fromJson(json['deaths'] as Map<String, dynamic>),
    tests: Tests.fromJson(json['tests'] as Map<String, dynamic>),
    day: DateTime.parse(json['day'] as String),
    time: DateTime.parse(json['time'] as String),
  );
}

Map<String, dynamic> _$ResponseToJson(Response instance) => <String, dynamic>{
      'country': instance.country,
      'cases': instance.cases,
      'deaths': instance.deaths,
      'tests': instance.tests,
      'day': instance.day.toIso8601String(),
      'time': instance.time.toIso8601String(),
    };

Cases _$CasesFromJson(Map<String, dynamic> json) {
  return Cases(
    casesNew: json['new'] as String ?? '0',
    active: json['active'] as int,
    critical: json['critical'] as int,
    recovered: json['recovered'] as int,
    total: json['total'] as int,
  );
}

Map<String, dynamic> _$CasesToJson(Cases instance) => <String, dynamic>{
      'new': instance.casesNew,
      'active': instance.active,
      'critical': instance.critical,
      'recovered': instance.recovered,
      'total': instance.total,
    };

Deaths _$DeathsFromJson(Map<String, dynamic> json) {
  return Deaths(
    deathsNew: json['new'] as String ?? '0',
    total: json['total'] as int,
  );
}

Map<String, dynamic> _$DeathsToJson(Deaths instance) => <String, dynamic>{
      'new': instance.deathsNew,
      'total': instance.total,
    };

Tests _$TestsFromJson(Map<String, dynamic> json) {
  return Tests(
    total: json['total'] as int ?? 0,
  );
}

Map<String, dynamic> _$TestsToJson(Tests instance) => <String, dynamic>{
      'total': instance.total,
    };
