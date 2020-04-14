import 'package:chopper/chopper.dart';
import 'package:covid_19/model/Statistics.dart';
import 'package:meta/meta.dart';

@immutable
abstract class StatisticsState {}

class InitialStatisticsState extends StatisticsState {}

class LoadingStatisticsState extends StatisticsState {}

class LoadedStatisticsState extends StatisticsState {
  final Statistics statistics;

  LoadedStatisticsState({@required this.statistics});
}

class ErrorStatisticsState extends StatisticsState {
  final String error;

  ErrorStatisticsState({@required this.error});
}
