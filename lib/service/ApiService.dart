import 'package:chopper/chopper.dart';
import 'package:covid_19/global.dart';


part 'ApiService.chopper.dart';

@ChopperApi()
abstract class ApiService extends ChopperService {
  @Get(headers: {"x-rapidapi-key": Global.apiKey})
  Future<Response> getResponse();

  static ApiService create() {
    final client = ChopperClient(
        baseUrl: "https://covid-193.p.rapidapi.com/statistics",
        services: [_$ApiService()],
        converter: JsonConverter(),
        errorConverter: JsonConverter());

    return _$ApiService(client);
  }
}
