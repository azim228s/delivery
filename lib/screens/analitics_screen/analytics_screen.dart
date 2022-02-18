import 'package:delivery/screens/analitics_screen/analytics_presenter.dart';
import 'package:delivery/screens/analitics_screen/analytics_view_model.dart';
import 'package:flutter/material.dart';

class AnalyticsScreen extends StatefulWidget {
  const AnalyticsScreen({Key? key}) : super(key: key);

  @override
  State<AnalyticsScreen> createState() => _AnalyticsScreenState();
}

class _AnalyticsScreenState extends State<AnalyticsScreen> {

  final AnalyticsPresenter _presenter = AnalyticsPresenter(AnalyticsViewModel());

  @override
  void didChangeDependencies() {
    _presenter.initWithContext(context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<AnalyticsViewModel>(
      stream: _presenter.stream,
      builder: (context, snapshot) {
        return Scaffold(
          appBar: AppBar(
            elevation: 0,
            title: const Text("Статистика"),
            automaticallyImplyLeading: false,
            centerTitle: true,
          ),
        );
      }
    );
  }
}
