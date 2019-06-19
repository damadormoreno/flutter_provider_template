import 'package:flutter/material.dart';
import 'package:flutter_provider_astro/core/viewmodels/base_viewmodel.dart';
import 'package:provider/provider.dart';

import '../../locator.dart';

class BasePage<T extends BaseViewModel> extends StatefulWidget {
  final Widget Function(BuildContext context, T model, Widget child) builder;
  final Function(T) onModelReady;

  BasePage({this.builder, this.onModelReady});

  @override
  State<StatefulWidget> createState() => _BasePageState<T>();
}

class _BasePageState<T extends BaseViewModel> extends State<BasePage<T>> {
  T model = locator<T>();

  @override
  void initState() {
    if (widget.onModelReady != null) {
      widget.onModelReady(model);
    }
    super.initState();
  }

  Widget build(BuildContext context) {
    return ChangeNotifierProvider<T>(
      builder: (context) => model,
      child: Consumer<T>(builder: widget.builder),
    );
  }
}
