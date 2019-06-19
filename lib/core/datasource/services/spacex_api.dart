import 'dart:convert';

import 'package:flutter_provider_astro/core/errors/spacex_api_error.dart';
import 'package:flutter_provider_astro/core/models/historical_event.dart';
import 'package:http/http.dart' as http;

class SpacexApi {
  static const baseUrlHistoricalEvents =
      "https://api.spacexdata.com/v3/history";

  var client = new http.Client();

  Future<List<HistoricalEvent>> getHistoricalEvents() async {
    var historicalsEvents = List<HistoricalEvent>();
    var response = await client.get(baseUrlHistoricalEvents);
    if (response.statusCode == 200) {
      var parsed = json.decode(response.body) as List<dynamic>;
      for (var historicalevent in parsed) {
        historicalsEvents.add(HistoricalEvent.fromJson(historicalevent));
      }
      return historicalsEvents;
    } else {
      throw GetHistoricalEventsError(message: "Error get Historical Events");
    }
  }
}
