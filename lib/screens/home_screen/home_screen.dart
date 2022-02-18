import 'package:delivery/constants/colors.dart';
import 'package:delivery/constants/progress.dart';
import 'package:delivery/models/event_model.dart';
import 'package:delivery/screens/home_screen/home_presenter.dart';
import 'package:delivery/screens/home_screen/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

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
              elevation: 0,
              title: const Text(
                "Заявки",
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                ),
              ),
              automaticallyImplyLeading: false,
              centerTitle: true,
            ),
            // ignore: prefer_const_constructors
            body: _presenter.model.isLoading
                ? const ProgressCircular()
                : SingleChildScrollView(
                    child: Column(
                      children: [
                        for (EventModel event in _presenter.offers)
                          buildProductCard(eventModel: event)
                      ],
                    ),
                  ),
          );
        });
  }

  Widget buildProductCard({
    required EventModel eventModel,
  }) {
    return Padding(
      padding: const EdgeInsets.only(top: 18, left: 16, right: 16),
      child: Card(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(8),
            topLeft: Radius.circular(8),
            bottomRight: Radius.circular(32),
            topRight: Radius.circular(32),
          ),
        ),
        elevation: 10,
        shadowColor: Colors.black,
        color: Colors.white,
        child: Container(
          height: 130,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(32),
              bottomRight: Radius.circular(32),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                flex: 6,
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 15,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 12,
                      ),
                      Text(
                        eventModel.deliveryCompanyId.toString() + " Company",
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: AppColors.mainColor,
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      infoTile(
                        DateFormat('MMMMd').format(eventModel.expectingDeliveryDate),
                        eventModel.offeredPriceTenge.toString(),
                        eventModel.weightKg.toString(),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                    ],
                  ),
                ),
              ),
              Flexible(
                flex: 3,
                child: Column(
                  children: [
                    InkWell(
                      onTap: () {
                        _presenter.acceptOffer(eventModel);
                      },
                      borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(32), bottomLeft: Radius.circular(32)),
                      child: Container(
                        decoration: const BoxDecoration(
                          color: AppColors.mainColor,
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(32), bottomLeft: Radius.circular(32)),
                        ),
                        height: 80,
                        width: 130,
                        child: const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          child: Icon(
                            Icons.check,
                            size: 50,
                            color: AppColors.monoWhite,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget infoTile(String expectedTime, String price, String weight) {
    return Row(
      children: [
        Container(
          height: 70,
          width: 70,
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: AppColors.mainColor,
            borderRadius: BorderRadius.circular(25),
          ),
          child: SvgPicture.asset(
            "assets/icons/ic_company.svg",
          ),
        ),
        const SizedBox(
          width: 8,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            infoRow(
              expectedTime,
              Icons.timer_rounded,
            ),
            infoRow(
              price + " KZT",
              Icons.attach_money_rounded,
            ),
            infoRow(
              weight + " kg",
              Icons.next_week_rounded,
            ),
          ],
        ),
      ],
    );
  }

  Widget infoRow(String text, IconData icon) {
    return Row(
      children: [
        Icon(
          icon,
          color: AppColors.mainColor,
        ),
        const SizedBox(
          width: 8,
        ),
        Text(
          text,
          style: const TextStyle(
            color: AppColors.mainColor,
            fontSize: 16,
          ),
        )
      ],
    );
  }
}
