import 'package:flutter_provider_astro/core/models/historical_event.dart';
import 'package:flutter_provider_astro/core/datasource/services/spacex_api.dart';

import '../../locator.dart';

class SpacexRepository {
  SpacexApi _api = locator<SpacexApi>();

  //TODO: get events from db and fetch in time
  Future<List<HistoricalEvent>> fetchHistoricalEvents() =>
      _api.getHistoricalEvents();
}
