import 'package:dashboard/dependency_Injector.dart';
import 'package:dashboard/view_model/dash_board_status_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/dashboard_count_model.dart';
import '../view_model/dashboard_view_model.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  DashboardCountViewModel dashboardCountViewModel = getIt();

  // DashboardStatusViewModel dashboardStatusViewModel = getIt();

  @override
  void initState() {
    // Provider.of<DashboardCountViewModel>(context, listen: false).getDashBoard();
    // Provider.of<DashboardStatusViewModel>(context, listen: false)
    //     .getDashBoard();
    // dashboardCountViewModel.postData();
    super.initState();
    // dashboardCountViewModel.postData();
    dashboardCountViewModel.getCountDashboard();
    dashboardCountViewModel.getStatusDashboard();
    // dashboardCountViewModel.getDashBoard();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChangeNotifierProvider(
          create: (context) => dashboardCountViewModel,
          builder: (context, _) {
            return Consumer<DashboardCountViewModel>(
                builder: (context, viewModel, child) {
              if (viewModel.count == null || viewModel.status2 == null) {
                return Center(child: CircularProgressIndicator());
              }
              return SingleChildScrollView(
                  child: Expanded(
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      margin: const EdgeInsets.fromLTRB(30, 40, 30, 20),
                      child: const Text(
                        "Order Status : New",
                        style: TextStyle(fontSize: 18, color: Colors.amber),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      margin: const EdgeInsets.fromLTRB(30, 22, 30, 0),
                      child: const Text(
                        'Order Type',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 8,
                            color: Colors.black),
                      ),
                    ),

                    // Consumer<DashboardCountViewModel>(
                    //     builder: (context, viewModel, child) {
                    //   if (viewModel.count == null) {
                    //     return Center(child: CircularProgressIndicator());
                    //   }

                    Padding(
                        padding: const EdgeInsets.fromLTRB(30, 10, 30, 60),
                        child: Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                  child: _buildTextContainer(
                                      'New :',
                                      (viewModel.count?.data?[0].newType ?? 0)
                                          .toString())),
                              SizedBox(width: 16),
                              Expanded(
                                  child: _buildTextContainer(
                                      'Modify :',
                                      (viewModel.count?.data?[0].modifyType ??
                                              0)
                                          .toString())),
                              SizedBox(width: 16),
                              Expanded(
                                  child: _buildTextContainer(
                                      'Suspend :',
                                      (viewModel.count?.data?[0].suspendType ??
                                              0)
                                          .toString())),
                              SizedBox(width: 16),
                              Expanded(
                                  child: _buildTextContainer(
                                      'Reconnect :',
                                      (viewModel.count?.data?[0]
                                                  .reconnectType ??
                                              0)
                                          .toString())),
                              SizedBox(width: 16),
                              Expanded(
                                  child: _buildTextContainer(
                                      'Terminate :',
                                      (viewModel.count?.data?[0]
                                                  .terminateType ??
                                              0)
                                          .toString())),
                            ],
                          ),
                        )),
                    // }),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: const Text(
                        '28 Records',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 8,
                            color: Colors.black),
                      ),
                      width: double.infinity,
                      margin: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(color: Colors.amber),
                      ),

                      child: DataTable1(dashboardCountViewModel),
                      margin: EdgeInsets.fromLTRB(30, 10, 30,
                          0), // ปรับค่า margin เพื่อให้ห่างจากขอบซ้ายและขวาทั้งคู่ละ 30
                      width: double.infinity,
                    ),
                  ],
                ),
              ));
            });
          }),
    );
  }
}

class StarCheckbox extends StatefulWidget {
  @override
  _StarCheckboxState createState() => _StarCheckboxState();
}

class _StarCheckboxState extends State<StarCheckbox> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isChecked = !isChecked;
        });
      },
      child: Icon(
        isChecked ? Icons.star : Icons.star_border,
        color: isChecked ? Colors.amber : null,
        size: 30.0, // ขนาดของดาว
      ),
    );
  }
}

Widget _buildTextContainer(String leftText, String rightText) {
  return Container(
    width: 280,
    height: 40,
    decoration: BoxDecoration(
      color: Color(0xFFFFEDBF),
      borderRadius: BorderRadius.circular(7),
      border: Border.all(color: Colors.amber),
    ),
    child: Row(
      children: [
        Container(
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.only(left: 10),
          child: Text(
            leftText,
            style: TextStyle(color: Colors.black),
          ),
        ),
        Spacer(),
        if (rightText.isNotEmpty)
          Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.only(right: 10),
            child: Text(
              rightText,
              style: TextStyle(color: Colors.black),
            ),
          ),
      ],
    ),
  );
}

class Inprogress extends StatelessWidget {
  const Inprogress({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CombinedValueBarChart(
            dataMap: {"Flutter": 100, "React": 40, "Xamarin": 40, "4": 197},
          ),
        ],
      ),
    );
  }
}

class CombinedValueBarChart extends StatelessWidget {
  final Map<String, double> dataMap;
  final List<Color> colors = [
    Color(0xFFF3B949), // สีเหลือง
    Color(0xFFEB894E), // สีส้ม
    Color(0xFFB182BF),
    Color(0xFF7BB6E8),
  ];

  CombinedValueBarChart({Key? key, required this.dataMap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double totalValue = dataMap.values.reduce((a, b) => a + b);

    return Column(
      children: [
        Row(
          children: dataMap.keys.map((key) {
            int index = dataMap.keys.toList().indexOf(key);
            return Expanded(
              flex: (dataMap[key]! / totalValue * 100).toInt(),
              child: Container(
                height: 12,
                decoration: BoxDecoration(
                  color: colors[index % colors.length],
                ),
                margin: EdgeInsets.symmetric(horizontal: 0.5),
              ),
            );
          }).toList(),
        ),
        SizedBox(height: 16),
      ],
    );
  }
}

Widget _buildTextContainer2(String leftText, String rightText) {
  return Container(
    width: 200,
    height: 40,
    decoration: BoxDecoration(
      color: Colors.yellow[600],
      borderRadius: BorderRadius.circular(7),
    ),
    child: Row(
      children: [
        Container(
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.only(left: 10),
          child: Text(
            leftText,
            style: TextStyle(color: Colors.black),
          ),
        ),
        Spacer(),
        if (rightText.isNotEmpty)
          Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.only(right: 10),
            child: Text(
              rightText,
              style: TextStyle(color: Colors.black),
            ),
          ),
      ],
    ),
  );
}

class Inprogress2 extends StatelessWidget {
  const Inprogress2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CombinedValueBarChart2(
            dataMap: {"Flutter": 100, "React": 160, "Xamarin": 40, "4": 77},
          ),
        ],
      ),
    );
  }
}

class CombinedValueBarChart2 extends StatelessWidget {
  final Map<String, double> dataMap;
  final List<Color> colors = [
    Color(0xFFF3B949), // สีเหลือง
    Color(0xFFB182BF),
    Color(0xFF7BB6E8),
    Color(0xFF80BE5B),
  ];

  CombinedValueBarChart2({Key? key, required this.dataMap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double totalValue = dataMap.values.reduce((a, b) => a + b);

    return Column(
      children: [
        Row(
          children: dataMap.keys.map((key) {
            int index = dataMap.keys.toList().indexOf(key);
            return Expanded(
              flex: (dataMap[key]! / totalValue * 100).toInt(),
              child: Container(
                height: 12,
                decoration: BoxDecoration(
                  color: colors[index % colors.length],
                ),
                margin: EdgeInsets.symmetric(horizontal: 0.5),
              ),
            );
          }).toList(),
        ),
        SizedBox(height: 16),
      ],
    );
  }
}

// class Inprogress3 extends StatelessWidget {
//   const Inprogress3({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return widget(
//       child: Container(
//         padding: EdgeInsets.only(top: 30),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             CombinedValueBarChart3(
//               dataMap: {
//                 "Flutter": 100,
//                 "React": 60,
//                 "Xamarin": 117,
//                 "4": 40,
//                 "5": 59,
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
class Inprogress3 extends StatelessWidget {
  const Inprogress3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<DashboardCountViewModel>(
      builder: (context, viewModel, child) {
        if (viewModel.listItems == null) {
          return Center(child: CircularProgressIndicator());
        }

        // คำนวณค่าต่างๆ
        double newStatusSum = viewModel.listItems!
            .fold(0, (sum, item) => sum + (item.newStatus ?? 0))
            .toDouble();
        double provisioningSum = viewModel.listItems!
            .fold(0, (sum, item) => sum + (item.provisioning ?? 0))
            .toDouble();
        double billingSum = viewModel.listItems!
            .fold(0, (sum, item) => sum + (item.billing ?? 0))
            .toDouble();
        double completeSum = viewModel.listItems!
            .fold(0, (sum, item) => sum + (item.complete ?? 0))
            .toDouble(); 

        //คำนวณผลรวม
        double totalSum =
            newStatusSum + provisioningSum + billingSum + completeSum;

        //คำนวณสัดส่วนเพื่อให้รวมกันเท่ากับ100
        Map<String, double> dataMap = {
          "New": (newStatusSum / totalSum) * 1,
          "Provisioning": (provisioningSum / totalSum) * 1,
          "Billing": (billingSum / totalSum) * 1,
          "Complete": (completeSum / totalSum) * 1,
        };

        return Container(
          padding: EdgeInsets.only(top: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CombinedValueBarChart3(dataMap: dataMap),
            ],
          ),
        );
      },
    );
  }
}

class CombinedValueBarChart3 extends StatelessWidget {
  final Map<String, double> dataMap;
  final List<Color> colors = [
    Color(0xFFF3B949), // สีเหลือง
    Color(0xFFEB894E), // สีส้ม
    Color(0xFFB182BF),
    Color(0xFF7BB6E8),
    Color(0xFF80BE5B),
  ];

  CombinedValueBarChart3({Key? key, required this.dataMap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double totalValue = dataMap.values.reduce((a, b) => a + b);

    return Column(
      children: [
        Row(
          children: dataMap.keys.map((key) {
            int index = dataMap.keys.toList().indexOf(key);
            return Expanded(
              flex: (dataMap[key]! / totalValue * 100).toInt(),
              child: Tooltip(
                message: '$key : ${dataMap[key]!}',
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 5,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                textStyle: TextStyle(
                  color: Colors.black,
                ),
                child: Container(
                  height: 12,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: colors[index % colors.length],
                  ),
                  margin: EdgeInsets.symmetric(horizontal: 0.5),
                ),
              ),
            );
          }).toList(),
        ),
        SizedBox(height: 16),
      ],
    );
  }
}

class Inprogress4 extends StatelessWidget {
  const Inprogress4({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CombinedValueBarChart4(
            dataMap: {
              "Flutter": 80,
              "React": 14,
              "Xamarin": 60,
              "4": 12,
              "5": 210,
            },
          ),
        ],
      ),
    );
  }
}

class CombinedValueBarChart4 extends StatelessWidget {
  final Map<String, double> dataMap;
  final List<Color> colors = [
    Color(0xFFF3B949), // สีเหลือง
    Color(0xFFEB894E), // สีส้ม
    Color(0xFFB182BF),
    Color(0xFF7BB6E8),
    Color(0xFF80BE5B),
  ];

  CombinedValueBarChart4({Key? key, required this.dataMap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double totalValue = dataMap.values.reduce((a, b) => a + b);

    return Column(
      children: [
        Row(
          children: dataMap.keys.map((key) {
            int index = dataMap.keys.toList().indexOf(key);
            return Expanded(
              flex: (dataMap[key]! / totalValue * 100).toInt(),
              child: Container(
                height: 12,
                decoration: BoxDecoration(
                  color: colors[index % colors.length],
                ),
                margin: EdgeInsets.symmetric(horizontal: 0.5),
              ),
            );
          }).toList(),
        ),
        SizedBox(height: 16),
      ],
    );
  }
}

class Inprogress5 extends StatelessWidget {
  const Inprogress5({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CombinedValueBarChart5(
            dataMap: {
              "Flutter": 89,
              "React": 290,
            },
          ),
        ],
      ),
    );
  }
}

class CombinedValueBarChart5 extends StatelessWidget {
  final Map<String, double> dataMap;
  final List<Color> colors = [
    // สีเหลือง
    Color(0xFFEB894E),
    Color(0xFF80BE5B),
  ];

  CombinedValueBarChart5({Key? key, required this.dataMap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double totalValue = dataMap.values.reduce((a, b) => a + b);

    return Column(
      children: [
        Row(
          children: dataMap.keys.map((key) {
            int index = dataMap.keys.toList().indexOf(key);
            return Expanded(
              flex: (dataMap[key]! / totalValue * 100).toInt(),
              child: Container(
                height: 12,
                decoration: BoxDecoration(
                  color: colors[index % colors.length],
                ),
                margin: EdgeInsets.symmetric(horizontal: 0.5),
              ),
            );
          }).toList(),
        ),
        SizedBox(height: 16),
      ],
    );
  }
}

class Inprogress6 extends StatelessWidget {
  const Inprogress6({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CombinedValueBarChart6(
            dataMap: {
              "Flutter": 100,
              "React": 40,
              "Xamarin": 50,
              "4": 187,
            },
          ),
        ],
      ),
    );
  }
}

class CombinedValueBarChart6 extends StatelessWidget {
  final Map<String, double> dataMap;
  final List<Color> colors = [
    Color(0xFFF3B949), // สีเหลือง
    Color(0xFFEB894E), // สีส้ม
    Color(0xFFB182BF),
    Color(0xFF7BB6E8),
  ];

  CombinedValueBarChart6({Key? key, required this.dataMap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double totalValue = dataMap.values.reduce((a, b) => a + b);

    return Column(
      children: [
        Row(
          children: dataMap.keys.map((key) {
            int index = dataMap.keys.toList().indexOf(key);
            return Expanded(
              flex: (dataMap[key]! / totalValue * 100).toInt(),
              child: Container(
                height: 12,
                decoration: BoxDecoration(
                  color: colors[index % colors.length],
                ),
                margin: EdgeInsets.symmetric(horizontal: 0.5),
              ),
            );
          }).toList(),
        ),
        SizedBox(height: 16),
      ],
    );
  }
}

class Inprogress7 extends StatelessWidget {
  const Inprogress7({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CombinedValueBarChart7(
            dataMap: {
              "Flutter": 100,
              "React": 60,
              "Xamarin": 218,
            },
          ),
        ],
      ),
    );
  }
}

class CombinedValueBarChart7 extends StatelessWidget {
  final Map<String, double> dataMap;
  final List<Color> colors = [
    Color(0xFF7BB6E8),
    Color(0xFF80BE5B),
  ];

  CombinedValueBarChart7({Key? key, required this.dataMap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double totalValue = dataMap.values.reduce((a, b) => a + b);

    return Column(
      children: [
        Row(
          children: dataMap.keys.map((key) {
            int index = dataMap.keys.toList().indexOf(key);
            return Expanded(
              flex: (dataMap[key]! / totalValue * 100).toInt(),
              child: Container(
                height: 12,
                decoration: BoxDecoration(
                  color: colors[index % colors.length],
                ),
                margin: EdgeInsets.symmetric(horizontal: 0.5),
              ),
            );
          }).toList(),
        ),
        SizedBox(height: 16),
      ],
    );
  }
}

class Inprogress8 extends StatelessWidget {
  const Inprogress8({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CombinedValueBarChart8(
            dataMap: {
              "Flutter": 100,
              "React": 40,
              "Xamarin": 238,
            },
          ),
        ],
      ),
    );
  }
}

class CombinedValueBarChart8 extends StatelessWidget {
  final Map<String, double> dataMap;
  final List<Color> colors = [
    Color(0xFFF3B949), // สีเหลือง
    Color(0xFFEB894E), // สีส้ม
    Color(0xFF80BE5B),
  ];

  CombinedValueBarChart8({Key? key, required this.dataMap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double totalValue = dataMap.values.reduce((a, b) => a + b);

    return Column(
      children: [
        Row(
          children: dataMap.keys.map((key) {
            int index = dataMap.keys.toList().indexOf(key);
            return Expanded(
              flex: (dataMap[key]! / totalValue * 100).toInt(),
              child: Container(
                height: 12,
                decoration: BoxDecoration(
                  color: colors[index % colors.length],
                ),
                margin: EdgeInsets.symmetric(horizontal: 0.5),
              ),
            );
          }).toList(),
        ),
        SizedBox(height: 16),
      ],
    );
  }
}

class Inprogress9 extends StatelessWidget {
  const Inprogress9({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CombinedValueBarChart9(
            dataMap: {
              "Flutter": 40,
              "React": 160,
              "Xamarin": 178,
            },
          ),
        ],
      ),
    );
  }
}

class CombinedValueBarChart9 extends StatelessWidget {
  final Map<String, double> dataMap;
  final List<Color> colors = [
    Color(0xFFEB894E), // สีส้ม
    Color(0xFFB182BF),
    Color(0xFF80BE5B),
  ];

  CombinedValueBarChart9({Key? key, required this.dataMap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double totalValue = dataMap.values.reduce((a, b) => a + b);

    return Column(
      children: [
        Row(
          children: dataMap.keys.map((key) {
            int index = dataMap.keys.toList().indexOf(key);
            return Expanded(
              flex: (dataMap[key]! / totalValue * 100).toInt(),
              child: Container(
                height: 12,
                decoration: BoxDecoration(
                  color: colors[index % colors.length],
                ),
                margin: EdgeInsets.symmetric(horizontal: 0.5),
              ),
            );
          }).toList(),
        ),
        SizedBox(height: 16),
      ],
    );
  }
}

class Inprogress10 extends StatelessWidget {
  const Inprogress10({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CombinedValueBarChart10(
            dataMap: {
              "Flutter": 148,
              "React": 40,
              "Xamarin": 190,
            },
          ),
        ],
      ),
    );
  }
}

class CombinedValueBarChart10 extends StatelessWidget {
  final Map<String, double> dataMap;
  final List<Color> colors = [
    Color(0xFFF3B949), // สีเหลือง
    Color(0xFFEB894E), // สีส้ม
    Color(0xFF7BB6E8),
  ];

  CombinedValueBarChart10({Key? key, required this.dataMap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double totalValue = dataMap.values.reduce((a, b) => a + b);

    return Column(
      children: [
        Row(
          children: dataMap.keys.map((key) {
            int index = dataMap.keys.toList().indexOf(key);
            return Expanded(
              flex: (dataMap[key]! / totalValue * 100).toInt(),
              child: Container(
                height: 12,
                decoration: BoxDecoration(
                  color: colors[index % colors.length],
                ),
                margin: EdgeInsets.symmetric(horizontal: 0.5),
              ),
            );
          }).toList(),
        ),
        SizedBox(height: 16),
      ],
    );
  }
}

class DataTable1 extends StatelessWidget {
  final DashboardCountViewModel dashboardCountViewModel;

  const DataTable1(this.dashboardCountViewModel, {super.key});

  @override
  Widget build(BuildContext context) {
    double rowHeight = (MediaQuery.of(context).size.height - 56) / 10;

    return Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
      ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        child: DataTable(
            border: const TableBorder(
              horizontalInside: BorderSide(
                  width: 1, color: Color.fromRGBO(254, 206, 0, 0.25)),
            ),
            dataRowMaxHeight: rowHeight,
            headingRowColor: MaterialStateColor.resolveWith(
                (states) => Color.fromARGB(255, 255, 183, 0)),
            columns: const <DataColumn>[
              DataColumn(
                label: Expanded(
                  child: Icon(
                    Icons.star_border,
                    color: Colors.white,
                    size: 28,
                  ),
                ),
              ),
              DataColumn(
                label: Expanded(
                  child: SizedBox(
                    width: 100,
                    child: Text(
                      'Order Number',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
              DataColumn(
                label: Expanded(
                  child: SizedBox(
                    width: 100,
                    child: Text(
                      'Order Type',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
              DataColumn(
                label: Expanded(
                  child: SizedBox(
                      width: 120,
                      child: Text(
                        'Order Sub Type',
                        style: TextStyle(color: Colors.white),
                      )),
                ),
              ),
              DataColumn(
                label: Expanded(
                  child: SizedBox(
                    width: 103,
                    child: Text(
                      'Customer Name',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
              DataColumn(
                label: Expanded(
                  child: SizedBox(
                    width: 132,
                    child: Text(
                      'Billing Account Number',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
              DataColumn(
                label: Expanded(
                  child: SizedBox(
                    width: 380,
                    child: Text(
                      'Item Status',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
            rows: (dashboardCountViewModel.listItems ?? [])
                .map((e) => DataRow(
                      cells: [
                        DataCell(StarCheckbox()),
                        DataCell(Text(((e.id ?? 0).toString()))),
                        DataCell(Text(((e.orderTypeLkp ?? 0).toString()))),
                        DataCell(Text(((e.orderSubTypeLkp ?? 0).toString()))),
                        DataCell(Text(((e.customerFullName ?? 0).toString()))),
                        DataCell(Text(((e.baId ?? 0).toString()))),
                        DataCell(Inprogress3()),
                      ],
                    ))
                .toList()

            //     <DataRow>[
            //   DataRow(
            //     cells: <DataCell>[
            //       DataCell(StarCheckbox()),
            //       DataCell(Text('1234567890')),
            //       DataCell(Text('New')),
            //       DataCell(Text('-')),
            //       DataCell(Text('xxxxxxxxxxxxx xxxxxxxxxxxxx')),
            //       DataCell(Text('1234567890')),
            //       DataCell(Flexible(child: Inprogress())),
            //     ],
            //   ),
            //   DataRow(
            //     cells: <DataCell>[
            //       DataCell(StarCheckbox()),
            //       DataCell(Text('1234567890')),
            //       DataCell(Text('New')),
            //       DataCell(Text('-')),
            //       DataCell(Text('xxxxxxxxxxxxx xxxxxxxxxxxxx')),
            //       DataCell(Text('1234567890')),
            //       DataCell(Inprogress2()),
            //     ],
            //   ),
            //   DataRow(
            //     cells: <DataCell>[
            //       DataCell(StarCheckbox()),
            //       DataCell(Text('1234567890')),
            //       DataCell(Text('New')),
            //       DataCell(Text('-')),
            //       DataCell(Text('xxxxxxxxxxxxx xxxxxxxxxxxxx')),
            //       DataCell(Text('1234567890')),
            //       DataCell(Inprogress3()),
            //     ],
            //   ),
            //   DataRow(
            //     cells: <DataCell>[
            //       DataCell(StarCheckbox()),
            //       DataCell(Text('1234567890')),
            //       DataCell(Text('Modify')),
            //       DataCell(Text('-')),
            //       DataCell(Text('xxxxxxxxxxxxx xxxxxxxxxxxxx')),
            //       DataCell(Text('1234567890')),
            //       DataCell(Inprogress4()),
            //     ],
            //   ),
            //   DataRow(
            //     cells: <DataCell>[
            //       DataCell(StarCheckbox()),
            //       DataCell(Text('1234567890')),
            //       DataCell(Text('Modify')),
            //       DataCell(Text('-')),
            //       DataCell(Text('xxxxxxxxxxxxx xxxxxxxxxxxxx')),
            //       DataCell(Text('1234567890')),
            //       DataCell(Inprogress5()),
            //     ],
            //   ),
            //   DataRow(
            //     cells: <DataCell>[
            //       DataCell(StarCheckbox()),
            //       DataCell(Text('1234567890')),
            //       DataCell(Text('Modify')),
            //       DataCell(Text('-')),
            //       DataCell(Text('xxxxxxxxxxxxx xxxxxxxxxxxxx')),
            //       DataCell(Text('1234567890')),
            //       DataCell(Inprogress6()),
            //     ],
            //   ),
            //   DataRow(
            //     cells: <DataCell>[
            //       DataCell(StarCheckbox()),
            //       DataCell(Text('1234567890')),
            //       DataCell(Text('Terminate')),
            //       DataCell(Text('-')),
            //       DataCell(Text('xxxxxxxxxxxxx xxxxxxxxxxxxx')),
            //       DataCell(Text('1234567890')),
            //       DataCell(Inprogress7()),
            //     ],
            //   ),
            //   DataRow(
            //     cells: <DataCell>[
            //       DataCell(StarCheckbox()),
            //       DataCell(Text('1234567890')),
            //       DataCell(Text('Reconnect')),
            //       DataCell(Text('-')),
            //       DataCell(Text('xxxxxxxxxxxxx xxxxxxxxxxxxx')),
            //       DataCell(Text('1234567890')),
            //       DataCell(Inprogress8()),
            //     ],
            //   ),
            //   DataRow(
            //     cells: <DataCell>[
            //       DataCell(StarCheckbox()),
            //       DataCell(Text('1234567890')),
            //       DataCell(Text('Terminate')),
            //       DataCell(Text('-')),
            //       DataCell(Text('xxxxxxxxxxxxx xxxxxxxxxxxxx')),
            //       DataCell(Text('1234567890')),
            //       DataCell(Inprogress9()),
            //     ],
            //   ),
            //   DataRow(
            //     cells: <DataCell>[
            //       DataCell(StarCheckbox()),
            //       DataCell(Text('1234567890')),
            //       DataCell(Text('Suspend')),
            //       DataCell(Text('-')),
            //       DataCell(Text('xxxxxxxxxxxxx xxxxxxxxxxxxx')),
            //       DataCell(Text('1234567890')),
            //       DataCell(Inprogress10()),
            //     ],
            //   ),
            // ],

            ),
      ),
      Divider(),
      Container(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: Padding(
              padding:
                  const EdgeInsets.fromLTRB(40, 0, 0, 0), // กำหนดระยะห่างขอบขวา
              child: Text(
                "Total 28 records",
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Color(0xFFFECE00)), // เพิ่มเส้นขอบ
            ),
            child: ClipRRect(
              borderRadius:
                  BorderRadius.circular(10), // กำหนดให้มีโค้งตามต้องการ
              child: TextButton(
                onPressed: () {},
                child: Icon(
                  Icons.arrow_back_ios_new_rounded,
                  color: Color(0xFFFECE00),
                ),
              ),
            ),
          ),
          Container(
            child: Row(
              children: [
                TextButton(
                  onPressed: () {},
                  child: Text("1"),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text("2"),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text("3"),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border:
                        Border.all(color: Color(0xFFFECE00)), // เพิ่มเส้นขอบ
                  ),
                  child: ClipRRect(
                    borderRadius:
                        BorderRadius.circular(10), // กำหนดให้มีโค้งตามต้องการ
                    child: TextButton(
                      onPressed: () {},
                      child: Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: Color(0xFFFECE00),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: SizedBox(
              width: 100,
              height: 25,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border:
                      Border.all(color: Colors.amber), // เพิ่มเส้นขอบสีเหลือง
                ),
                padding: EdgeInsets.symmetric(
                  vertical: 2,
                  horizontal: 22,
                ), // เพิ่มระยะห่างของข้อความ

                child: Text(
                  '10 / Page',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
              ),
            ),
          ),
          Padding(
              padding: const EdgeInsets.all(0.12),
              child: Container(
                padding: EdgeInsets.symmetric(
                    vertical: 8, horizontal: 16), // เพิ่มระยะห่างของข้อความ
                child: Text(
                  'Go to',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )),
          SizedBox(
            width: 12,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 40, 0),
            child: SizedBox(
              width: 100,
              height: 25,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border:
                      Border.all(color: Colors.amber), // เพิ่มเส้นขอบสีเหลือง
                ),
                padding: EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 16,
                ), // เพิ่มระยะห่างของข้อความ
                child: TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: '', // ใส่ข้อความ placeholder ที่คุณต้องการ
                    hintStyle: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 40, 0),
            child: Text(
              "page",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          )
        ],
      ))
    ]);
  }
}
