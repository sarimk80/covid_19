import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:chopper/chopper.dart';
import 'package:covid_19/model/Statistics.dart' as stats;
import 'package:covid_19/service/ApiService.dart';
import './bloc.dart';

class StatisticsBloc extends Bloc<StatisticsEvent, StatisticsState> {
  @override
  StatisticsState get initialState => InitialStatisticsState();

  @override
  Stream<StatisticsState> mapEventToState(StatisticsEvent event) async* {
    if (event is Fetch) {
      yield LoadingStatisticsState();
      try {
        final Response response = await ApiService.create().getResponse();

        final stats.Statistics jsonStatisticsResponse =
            stats.Statistics.fromJson(response.body);

        yield LoadedStatisticsState(statistics: jsonStatisticsResponse);
      } catch (e) {
        yield ErrorStatisticsState(error: e.toString());
      }
    }
  }
}
