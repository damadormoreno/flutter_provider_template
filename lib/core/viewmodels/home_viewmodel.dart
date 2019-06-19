import 'package:flutter_provider_astro/core/enums/view_state.dart';
import 'package:flutter_provider_astro/core/models/historical_event.dart';
import 'package:flutter_provider_astro/core/repositories/spacex_repository.dart';
import 'package:flutter_provider_astro/core/errors/spacex_api_error.dart';

import '../../locator.dart';
import 'base_viewmodel.dart';

class HomeViewModel extends BaseViewModel {
  SpacexRepository _repository = locator<SpacexRepository>();
  String errorMessage = "";

  List<HistoricalEvent> _historicalEvents;
  List<HistoricalEvent> get historicalEvents => _historicalEvents;

  Future getHistoricalEvents() async {
    setState(ViewState.Loading);
    try {
      _historicalEvents = await _repository.fetchHistoricalEvents();
      setState(ViewState.Success);
    } on GetHistoricalEventsError catch (error) {
      errorMessage = error.message;
      setState(ViewState.Failure);
    } catch (e) {
      setState(ViewState.Failure);
    }
  }
}
