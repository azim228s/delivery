import 'package:delivery/screens/home_screen/home_presenter.dart';
import 'package:delivery/screens/home_screen/home_view_model.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final HomePresenter _presenter = HomePresenter(HomeViewModel());

  @override
  void didChangeDependencies() {
    _presenter.initWithContext(context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<HomeViewModel>(
      stream: _presenter.stream,
      builder: (context, snapshot) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("Заявки"),
            automaticallyImplyLeading: false,
            centerTitle: true,
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [

              ],
            ),
          ),
        );
      }
    );
  }
}
