import 'package:delivery/constants/colors.dart';
import 'package:delivery/screens/analitics_screen/analytics_presenter.dart';
import 'package:delivery/screens/analitics_screen/analytics_view_model.dart';
import 'package:delivery/screens/analitics_screen/widgets/graph.dart';
import 'package:delivery/screens/analitics_screen/widgets/pie_chart.dart';
import 'package:flutter/material.dart';

class AnalyticsScreen extends StatefulWidget {
  const AnalyticsScreen({Key? key}) : super(key: key);

  @override
  State<AnalyticsScreen> createState() => _AnalyticsScreenState();
}

class _AnalyticsScreenState extends State<AnalyticsScreen> with SingleTickerProviderStateMixin {
  final AnalyticsPresenter _presenter = AnalyticsPresenter(AnalyticsViewModel());

  @override
  void didChangeDependencies() {
    _presenter.initWithContext(context);
    super.didChangeDependencies();
  }

  List<Color> colors = [AppColors.mainColor, AppColors.green, AppColors.monoRed, AppColors.violet];

  final List<Tab> myTabs = <Tab>[
    const Tab(text: 'Дни'),
    const Tab(text: 'Месяца'),
  ];

  late TabController _tabController;

  String filterValue = "KZT";

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: myTabs.length);
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<AnalyticsViewModel>(
        stream: _presenter.stream,
        builder: (context, snapshot) {
          return Scaffold(
            appBar: AppBar(
              elevation: 0,
              title: const Text(
                "Статистика",
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                ),
              ),
              automaticallyImplyLeading: false,
              centerTitle: true,
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    height: 310,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(32),
                          bottomRight: Radius.circular(32),
                        ),
                        color: AppColors.mainColor),
                    child: Column(
                      children: [
                        const SizedBox(height: 8,),
                        Row(
                          children: const [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 16),
                              child: Text(
                                'Показатели денежных рассчетов',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: AppColors.monoWhite,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16,),
                        Row(
                          children: [
                            Flexible(
                              child: TabBar(
                                indicatorColor: AppColors.monoWhite,
                                controller: _tabController,
                                tabs: myTabs,
                              ),
                            ),
                            const SizedBox(
                              width: 16,
                            ),
                            Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                  color: AppColors.mainColor,
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(color: AppColors.monoWhite, width: 1)),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const Icon(
                                    Icons.filter_alt_rounded,
                                    color: AppColors.monoWhite,
                                  ),
                                  SizedBox(
                                    height: 30,
                                    child: DropdownButton<String>(
                                      borderRadius: BorderRadius.circular(8),
                                      value: filterValue,
                                      onChanged: (String? newValue) => setState(() {
                                        filterValue = newValue!;
                                      }),
                                      style: const TextStyle(color: AppColors.monoWhite),
                                      iconEnabledColor: AppColors.monoWhite,
                                      dropdownColor: AppColors.mainColor,
                                      underline: const SizedBox(),
                                      items: <String>['KZT', 'USD', 'EUR'].map((String value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Text(
                                            value,
                                          ),
                                        );
                                      }).toList(),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              width: 16,
                            )
                          ],
                        ),
                        const LineChartSample2()
                      ],
                    ),
                  ),
                  Row(
                    children: const [
                      Padding(
                        padding: EdgeInsets.only(top: 25, left: 16),
                        child: Text(
                          'Показатели доставок',
                          style: TextStyle(
                            fontSize: 20,
                            color: AppColors.mainColor,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const PieChartSample2(),
                ],
              ),
            ),
          );
        });
  }
}
