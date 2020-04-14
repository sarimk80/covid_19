import 'package:json_annotation/json_annotation.dart';

part 'Statistics.g.dart';

@JsonSerializable(nullable: false)
class Statistics {
  @JsonKey(nullable: true)
  String statisticsGet;
  List<dynamic> parameters;
  List<dynamic> errors;
  int results;
  List<Response> response;

  Statistics({
    this.statisticsGet,
    this.parameters,
    this.errors,
    this.results,
    this.response,
  });

  factory Statistics.fromJson(Map<String, dynamic> json) =>
      _$StatisticsFromJson(json);

  Map<String, dynamic> toJson() => _$StatisticsToJson(this);
}

@JsonSerializable(nullable: false)
class Response {
  String country;
  Cases cases;
  Deaths deaths;
  Tests tests;
  DateTime day;
  DateTime time;

  Response(
      {this.country, this.cases, this.deaths, this.tests, this.day, this.time});

  factory Response.fromJson(Map<String, dynamic> json) =>
      _$ResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ResponseToJson(this);
}

@JsonSerializable()
class Cases {
  @JsonKey(name: "new", nullable: true, defaultValue: "0")
  String casesNew;
  int active;
  int critical;
  int recovered;
  int total;

  Cases({
    this.casesNew,
    this.active,
    this.critical,
    this.recovered,
    this.total,
  });

  factory Cases.fromJson(Map<String, dynamic> json) => _$CasesFromJson(json);

  Map<String, dynamic> toJson() => _$CasesToJson(this);
}

@JsonSerializable()
class Deaths {
  @JsonKey(nullable: true, name: "new", defaultValue: "0")
  String deathsNew;
  int total;

  Deaths({
    this.deathsNew,
    this.total,
  });

  factory Deaths.fromJson(Map<String, dynamic> json) => _$DeathsFromJson(json);

  Map<String, dynamic> toJson() => _$DeathsToJson(this);
}

@JsonSerializable()
class Tests {
  @JsonKey(nullable: true, defaultValue: 0)
  int total;

  Tests({
    this.total,
  });

  factory Tests.fromJson(Map<String, dynamic> json) => _$TestsFromJson(json);

  Map<String, dynamic> toJson() => _$TestsToJson(this);
}
