import 'package:delivery/constants/colors.dart';
import 'package:delivery/screens/delivery_screen/delivery_presenter.dart';
import 'package:delivery/screens/delivery_screen/delivery_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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

  List<bool> signs = [
    false,
    true,
  ];

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<DeliveryViewModel>(
        stream: _presenter.stream,
        builder: (context, snapshot) {
          return Scaffold(
            appBar: AppBar(
              elevation: 0,
              title: const Text(
                "История заявок",
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                ),
              ),
              centerTitle: true,
              automaticallyImplyLeading: false,
            ),
            body: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  buildProductCard(
                    title: 'Компания 1',
                    isDelivered: signs[0],
                    index: 0,
                  ),
                  buildProductCard(
                    title: 'Компания 2',
                    isDelivered: signs[1],
                    index: 1,
                  ),
                ],
              ),
            ),
          );
        });
  }

  Widget buildProductCard({
    required String title,
    required bool isDelivered,
    required int index,
  }) {
    return Padding(
      padding: const EdgeInsets.only(top: 18, left: 16, right: 16),
      child: Card(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(32),
            topLeft: Radius.circular(32),
            bottomRight: Radius.circular(8),
            topRight: Radius.circular(8),
          ),
        ),
        elevation: 10,
        shadowColor: Colors.black,
        color: Colors.white,
        child: Container(
          height: 160,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(32),
              topLeft: Radius.circular(32),
            ),
          ),
          child: Row(
            children: [
              Flexible(
                flex: 3,
                child: Container(
                  decoration: const BoxDecoration(
                    color: AppColors.mainColor,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(32),
                      topLeft: Radius.circular(32),
                    ),
                  ),
                  height: 160,
                  width: 100,
                  child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: isDelivered
                          ? const Icon(
                              Icons.check,
                              size: 50,
                              color: AppColors.monoWhite,
                            )
                          : SvgPicture.asset("assets/icons/ic_truck.svg")),
                ),
              ),
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
                        title,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: AppColors.monoBlack,
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      isDelivered
                          ? Column(
                              children: [
                                progressBar(true),
                                SizedBox(
                                  height: 40,
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Spacer(),
                                      InkWell(
                                        radius: 36,
                                        child: DecoratedBox(
                                          decoration: const BoxDecoration(
                                            color: AppColors.mainColor,
                                            borderRadius: BorderRadius.all(Radius.circular(32)),
                                          ),
                                          child: Container(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 16, vertical: 10),
                                            child: const Center(
                                              child: Text(
                                                'Подтвердить',
                                                style: TextStyle(
                                                  color: AppColors.monoWhite,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        onTap: () async {
                                          //TODO: send status changed and remove orde from list
                                        },
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            )
                          : Column(
                              children: [
                                progressBar(false),
                                infoTile(
                                  "5 hours",
                                  "product",
                                ),
                              ],
                            ),
                      const SizedBox(
                        height: 8,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget progressBar(bool isDelivered) {
    return Padding(
      padding: const EdgeInsets.only(top: 8, bottom: 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 10,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: AppColors.mainColor,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 10,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: isDelivered
                            ? AppColors.mainColor
                            : AppColors.monoBlack.withOpacity(0.5),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
                    height: 25,
                    width: 25,
                    decoration: BoxDecoration(
                      color: AppColors.mainColor,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: const Icon(
                      Icons.arrow_forward,
                      color: AppColors.monoWhite,
                    ),
                  ),
                  const Spacer(),
                  Container(
                    height: 25,
                    width: 25,
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: AppColors.mainColor,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: SvgPicture.asset("assets/icons/ic_truck.svg"),
                  ),
                  const Spacer(),
                  isDelivered
                      ? Container(
                          height: 25,
                          width: 25,
                          decoration: BoxDecoration(
                            color: AppColors.mainColor,
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: const Icon(
                            Icons.check,
                            color: AppColors.monoWhite,
                          ),
                        )
                      : Container(
                          height: 25,
                          width: 25,
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(25),
                          ),
                        ),
                ],
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                "Отправлен",
                style: TextStyle(color: AppColors.mainColor, fontSize: 12),
              ),
              Text(
                "В пути",
                style: TextStyle(color: AppColors.mainColor, fontSize: 12),
              ),
              Text(
                "Доставлен",
                style: TextStyle(color: AppColors.mainColor, fontSize: 12),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget infoTile(
    String expectedTime,
    String product,
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
              product,
              Icons.star_border_rounded,
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
