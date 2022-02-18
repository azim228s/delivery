import 'package:delivery/screens/delivery_screen/delivery_presenter.dart';
import 'package:delivery/screens/delivery_screen/delivery_view_model.dart';
import 'package:flutter/material.dart';

class DeliveryScreen extends StatefulWidget {
  const DeliveryScreen({Key? key}) : super(key: key);

  @override
  State<DeliveryScreen> createState() => _DeliveryScreenState();
}

class _DeliveryScreenState extends State<DeliveryScreen> {

  final DeliveryPresenter _presenter = DeliveryPresenter(DeliveryViewModel());

  @override
  void didChangeDependencies() {
    _presenter.initWithContext(context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<DeliveryViewModel>(
      stream: _presenter.stream,
      builder: (context, snapshot) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("Доставка"),
            centerTitle: true,
            automaticallyImplyLeading: false,
          ),
        );
      }
    );
  }
}
