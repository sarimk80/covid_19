// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ApiService.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

class _$ApiService extends ApiService {
  _$ApiService([ChopperClient client]) {
    if (client == null) return;
    this.client = client;
  }

  final definitionType = ApiService;

  Future<Response> getResponse() {
    final $url = '';
    final $headers = {
      'x-rapidapi-key': 'mmrHF1nWX7mshrLrbj77pmB1h2lPp1wyHkUjsnf7nGYl6bhcmc'
    };
    final $request = Request('GET', $url, client.baseUrl, headers: $headers);
    return client.send<dynamic, dynamic>($request);
  }
}
