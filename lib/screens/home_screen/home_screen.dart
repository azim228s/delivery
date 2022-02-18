import 'package:delivery/constants/colors.dart';
import 'package:delivery/screens/home_screen/home_presenter.dart';
import 'package:delivery/screens/home_screen/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

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
              title: const Text("Заявки"),
              automaticallyImplyLeading: false,
              centerTitle: true,
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  buildProductCard(
                    companyName: "haha",
                    transportation: 'truck',
                    price: '2500',
                    time: '10 hours',
                  )
                ],
              ),
            ),
          );
        });
  }

  Widget buildProductCard({
    required String companyName,
    required String price,
    required String time,
    required String transportation,
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
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 12,
                      ),
                      Text(
                        companyName,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: AppColors.mainColor,
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      infoTile(time, price, transportation),
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
                        //TODO: принять заявку
                      },
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

  Widget infoTile(
      String expectedTime,
      String price,
      String truck
      ) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            infoRow(
              expectedTime,
              Icons.timer_rounded,
            ),
            infoRow(
              price,
              Icons.attach_money_rounded,
            ),
            infoRow(
              truck,
              Icons.car_rental,
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
