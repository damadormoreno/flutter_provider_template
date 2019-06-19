import 'package:flutter/material.dart';
import 'package:flutter_provider_astro/core/enums/view_state.dart';
import 'package:flutter_provider_astro/core/viewmodels/home_viewmodel.dart';
import 'package:flutter_provider_astro/ui/widgets/historical_event_list_item.dart';

import 'base_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BasePage<HomeViewModel>(
      onModelReady: (model) => model.getHistoricalEvents(),
      builder: (context, model, child) => Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              title: Text(
                "SpaceX Events",
                style: TextStyle(color: Colors.black),
              ),
              centerTitle: true,
            ),
            backgroundColor: Colors.blue,
            body: buildWidget(model.state, model),
          ),
    );
  }

  Widget buildWidget(ViewState state, HomeViewModel model) {
    switch (state) {
      case ViewState.Loading:
        return Center(
          child: CircularProgressIndicator(),
        );
      case ViewState.Initial:
        return Center(
          child: CircularProgressIndicator(),
        );
      case ViewState.Failure:
        return Center(child: Text(model.errorMessage));
      case ViewState.Success:
        return ListView.builder(
            itemCount: model.historicalEvents.length,
            itemBuilder: (context, index) => HistoricalEventListItem(
                  historicalEvent: model.historicalEvents[index],
                  onTap: () {},
                ));
    }
  }
}
