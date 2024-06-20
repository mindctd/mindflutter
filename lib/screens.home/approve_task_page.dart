import 'package:dashboard/screens.home/ItemSeach.dart';
import 'package:dashboard/view_model/approve_view_model.dart';
import 'package:flutter/material.dart';
import '../app_Injector.dart';

class ApproveTaskPage extends StatefulWidget {
  const ApproveTaskPage({super.key});

  @override
  State<ApproveTaskPage> createState() => _ApproveTaskPageState();
}

class _ApproveTaskPageState extends State<ApproveTaskPage> {
  final ApproveViewModel _approveViewModel = getIt();
  final TextEditingController _orderIdController = TextEditingController();
  final TextEditingController _approvalStatusController =
      TextEditingController();
  final List<String> types = [
    'Provisioning',
    'Package/Component Approve',
    // 'Backdate Order Approval',
  ];
  String? selectedValue;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  void _search() {
    String orderId = _orderIdController.text.trim();
    String approvalStatus = _approvalStatusController.text.trim();

    print('Order ID: $orderId');
    print('Approval Status: $approvalStatus');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(60),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Approve Task",
                style: TextStyle(fontSize: 36, fontWeight: FontWeight.w700),
              ),
              const SizedBox(
                height: 24,
              ),
              Container(
                padding: const EdgeInsets.all(60),
                width: MediaQuery.of(context).size.width,
                decoration: primaryBorder(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Standard search",
                      style:
                          TextStyle(fontSize: 32, fontWeight: FontWeight.w700),
                    ),
                    const SizedBox(
                      height: 36,
                    ),
                    Row(
                      children: [
                        ItemSearch(
                            title: "Task type",
                            dropdownList: types,
                            inputType: TypeInput.itemDropDown),
                        const SizedBox(
                          width: 20,
                        ),
                        ItemSearch(
                          title: "Order ID",
                          inputType: TypeInput.itemTextField,
                          controller: _orderIdController,
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        ItemSearch(
                          title: "Approval Status",
                          inputType: TypeInput.itemTextField,
                          controller: _approvalStatusController,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 60,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          height: 42,
                          width: MediaQuery.of(context).size.width * 0.1,
                          child: OutlinedButton(
                            style: OutlinedButton.styleFrom(
                              side: const BorderSide(
                                  width: 1, color: Colors.blue),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12)),
                              backgroundColor: Colors.white,
                            ),
                            onPressed: () {},
                            child: const Text('Clear',
                                style: TextStyle(
                                    fontSize: 22, color: Colors.blue)),
                          ),
                        ),
                        const SizedBox(
                          width: 18,
                        ),
                        Container(
                          height: 42,
                          width: MediaQuery.of(context).size.width * 0.1,
                          child: OutlinedButton(
                            style: OutlinedButton.styleFrom(
                              backgroundColor: Colors.blue,
                              side: const BorderSide(
                                  width: 1, color: Colors.blue),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12)),
                            ),
                            onPressed: _search,
                            child: const Text(
                              'Search',
                              style:
                                  TextStyle(fontSize: 22, color: Colors.white),
                            ),
                          ),
                        ),
                      ],
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
}

// ignore: camel_case_types
class itemSearch extends StatelessWidget {
  final String title;
  final Widget? widget;

  const itemSearch(this.title, {this.widget, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 18),
        ),
        const SizedBox(
          height: 4,
        ),
        Container(
          decoration: primaryBorder(radius: 12),
          height: 30,
          child: widget,
        )
      ],
    );
  }
}

BoxDecoration primaryBorder(
    {double? radius, Color? color, Color? colorBorder}) {
  return BoxDecoration(
    border: Border.all(width: 1.0, color: colorBorder ?? Colors.amber),
    color: color ?? Colors.white,
    borderRadius: BorderRadius.all(Radius.circular(radius ?? 20.0)),
  );
}
