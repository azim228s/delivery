import 'package:delivery/constants/colors.dart';
import 'package:delivery/constants/progress.dart';
import 'package:delivery/models/event_model.dart';
import 'package:delivery/screens/delivery_screen/delivery_presenter.dart';
import 'package:delivery/screens/delivery_screen/delivery_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

enum DeliverStatus { inProgress, delivered, failed }

Map<int, DeliverStatus> fromIdToStatus = {
  5: DeliverStatus.inProgress,
  6: DeliverStatus.delivered,
  7: DeliverStatus.failed,
};

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
            body: _presenter.model.isLoading
                ? const ProgressCircular()
                : SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      children: [
                        for (EventModel event in _presenter.events)
                          buildProductCard(eventModel: event),
                      ],
                    ),
                  ),
          );
        });
  }

  Widget buildProductCard({required EventModel eventModel}) {
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
                  decoration: BoxDecoration(
                    color: eventModel.eventTypeId == 7
                        ? AppColors.monoRed.withOpacity(0.5)
                        : AppColors.mainColor,
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(32),
                      topLeft: Radius.circular(32),
                    ),
                  ),
                  height: 160,
                  width: 100,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: eventModel.eventTypeId == 6
                        ? const Icon(
                            Icons.check,
                            size: 75,
                            color: AppColors.monoWhite,
                          )
                        : eventModel.eventTypeId == 5
                            ? SvgPicture.asset("assets/icons/ic_truck.svg")
                            : const Icon(
                                Icons.cancel_outlined,
                                size: 75,
                                color: AppColors.monoWhite,
                              ),
                  ),
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
                        eventModel.deliveryCompanyId.toString() + " Company",
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: AppColors.monoBlack,
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      eventModel.eventTypeId == 6
                          ? Column(
                              children: [
                                progressBar(fromIdToStatus[eventModel.eventTypeId]!),
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
                                          _presenter.confirmEvent(eventModel);
                                        },
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            )
                          : eventModel.eventTypeId == 5
                              ? Column(
                                  children: [
                                    progressBar(fromIdToStatus[eventModel.eventTypeId]!),
                                    infoTile(
                                      DateFormat('MMMMd').format(eventModel.expectingDeliveryDate),
                                      eventModel.weightKg.toString(),
                                    ),
                                  ],
                                )
                              : Column(
                                  children: [
                                    progressBar(fromIdToStatus[eventModel.eventTypeId]!),
                                    cancelTile(
                                      "Грузовик застрял в пробках Алматы",
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

  Widget progressBar(DeliverStatus status) {
    return Padding(
      padding: const EdgeInsets.only(top: 8, bottom: 8),
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
                        color: status == DeliverStatus.failed
                            ? AppColors.monoRed.withOpacity(0.5)
                            : status == DeliverStatus.delivered
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
                  status == DeliverStatus.delivered
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
            children: [
              const Text(
                "Отправлен",
                style: TextStyle(color: AppColors.mainColor, fontSize: 12),
              ),
              Container(
                height: 15,
                width: 1,
                color: AppColors.mainColor,
              ),
              const Text(
                "В пути",
                style: TextStyle(color: AppColors.mainColor, fontSize: 12),
              ),
              Container(
                height: 15,
                width: 1,
                color: AppColors.mainColor,
              ),
              Text(
                status != DeliverStatus.failed ? "Доставлен" : "Не\nдоставлен",
                style: const TextStyle(color: AppColors.mainColor, fontSize: 12),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget cancelTile(
    String reason,
  ) {
    return infoRow(
        text: reason, icon: Icons.question_answer, color: AppColors.monoRed.withOpacity(0.5));
  }

  Widget infoTile(
    String expectedTime,
    String weight,
  ) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            infoRow(
              text: expectedTime,
              icon: Icons.timer_rounded,
            ),
            infoRow(
              text: weight,
              icon: Icons.star_border_rounded,
            ),
          ],
        ),
      ],
    );
  }

  Widget infoRow(
      {required String text, required IconData icon, Color color = AppColors.mainColor}) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          icon,
          color: color,
        ),
        const SizedBox(
          width: 8,
        ),
        Flexible(
          child: Text(
            text,
            style: TextStyle(
              color: color,
              fontSize: 16,
            ),
          ),
        )
      ],
    );
  }
}
