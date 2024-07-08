import 'package:dashboard/screens.home/ItemSeach.dart';
import 'package:dashboard/screens.home/Task.dart';
import 'package:dashboard/view_model/approve_view_model.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../app_Injector.dart';

import '../model/inquire_model.dart';

class InquireTaskPage extends StatefulWidget {
  const InquireTaskPage({super.key});

  @override
  State<InquireTaskPage> createState() => _InquireTaskPageState();
}

class _InquireTaskPageState extends State<InquireTaskPage> {
  final InquireViewModel _inquireViewModel = getIt();
  final TextEditingController _orderIdController = TextEditingController();

  final List<String> types = [
    'Provisioning',
    'Package/Component Approve',
    // 'Backdate Order Approval',
  ];
  String? selectedValue;

  @override
  void initState() {
    // TODO: implement initState

    _inquireViewModel.getInquire();
    // _approveViewModel.setDropDown();
    super.initState();
  }

  void _search() {
    String orderId = _orderIdController.text.trim();

    print('Order ID: $orderId');
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => _inquireViewModel,
        builder: (context, _) {
          return Scaffold(
            body: Consumer<InquireViewModel>(builder: (context, viewModel, _) {
              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(60),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Approve Task",
                          style: TextStyle(
                              fontSize: 36, fontWeight: FontWeight.w700),
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
                                style: TextStyle(
                                    fontSize: 32, fontWeight: FontWeight.w700),
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
                                  // ItemSearch(
                                  //     title: "Approval Status",
                                  //     dropdownList: types,
                                  //     inputType: TypeInput.itemDropDown),
                                  Container(
                                    child: Text("mind"),
                                  )
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
                                    width:
                                        MediaQuery.of(context).size.width * 0.1,
                                    child: OutlinedButton(
                                      style: OutlinedButton.styleFrom(
                                        side: const BorderSide(
                                            width: 1, color: Colors.amber),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(12)),
                                        backgroundColor: Colors.white,
                                      ),
                                      onPressed: () {},
                                      child: const Text('Clear',
                                          style: TextStyle(
                                              fontSize: 22,
                                              color: Colors.amber)),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 18,
                                  ),
                                  Container(
                                    height: 42,
                                    width:
                                        MediaQuery.of(context).size.width * 0.1,
                                    child: OutlinedButton(
                                      style: OutlinedButton.styleFrom(
                                        backgroundColor: Colors.amber,
                                        side: const BorderSide(
                                            width: 1, color: Colors.amber),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(12)),
                                      ),
                                      onPressed: _search,
                                      child: const Text(
                                        'Search',
                                        style: TextStyle(
                                            fontSize: 22, color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 60, 0, 20),
                          child: Container(
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.fromLTRB(0.5, 0, 0, 0),
                                    child: Text(
                                      "Result",
                                      style: TextStyle(
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Container(
                                    height: 42,
                                    width: MediaQuery.of(context).size.width *
                                        0.07,
                                    child: OutlinedButton(
                                      style: OutlinedButton.styleFrom(
                                        backgroundColor: Colors.amber,
                                        side: const BorderSide(
                                            width: 1, color: Colors.amber),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(12)),
                                      ),
                                      onPressed: _search,
                                      child: const Text(
                                        'Close',
                                        style: TextStyle(
                                            fontSize: 22, color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ]),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 0.5),
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                border: Border.all(color: Colors.grey),
                                color: Colors.white),
                            child: const DataTableTask(),
                          ),
                        ),
                      ]),
                ),
              );
            }),
          );
        });
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

class DataTableTask extends StatefulWidget {
  const DataTableTask({super.key});

  @override
  State<DataTableTask> createState() => _DataTableTaskState();
}

class _DataTableTaskState extends State<DataTableTask> {
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
                width: 1, color: Color.fromRGBO(255, 255, 255, 0.247)),
          ),
          dataRowMaxHeight: rowHeight,
          headingRowColor: MaterialStateColor.resolveWith(
              (states) => const Color(0xFFFAFBFE)),
          columns: const <DataColumn>[
            DataColumn(
              label: Expanded(child: SizedBox(width: 10, child: CheckBox())),
            ),
            DataColumn(
              label: Expanded(
                child: SizedBox(
                  width: double.infinity,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Subject',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ),
            DataColumn(
              label: Expanded(
                child: SizedBox(
                  child: Text(
                    'Order ID',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            DataColumn(
              label: Expanded(
                child: SizedBox(
                    child: Text(
                  'Date Due',
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                )),
              ),
            ),
            DataColumn(
              label: Expanded(
                child: SizedBox(
                  child: Text(
                    'Status',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            DataColumn(
              label: Expanded(
                child: SizedBox(
                  width: 60,
                  child: Text(
                    'User ID',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            DataColumn(
              label: Expanded(
                child: SizedBox(
                  width: 70,
                  child: Text(
                    'View Task',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            DataColumn(
              label: Expanded(
                child: SizedBox(
                  width: 70,
                  child: Text(
                    'View Order',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ],
          rows: <DataRow>[
            DataRow(
              cells: <DataCell>[
                const DataCell(CheckBox()),
                DataCell(Container(
                  child: const Column(
                    children: [
                      Text(
                        "1.1 Check Order Information [Order No: 32102653481001 Order Type: Modify CATID: IDC00002169 Service: IDC (บจก.แพคเซิร์ฟ)]",
                        style: TextStyle(fontSize: 11),
                      ),
                      Text(
                        "1.1 Check Order Information [Order No: 32102653481001 Order Type: Modify CATID: IDC00002169 Service: IDC (บจก.แพคเซิร์ฟ)]",
                        style: TextStyle(fontSize: 11),
                      )
                    ],
                  ),
                )),
                const DataCell(Text('xxxxxxxxxx')),
                const DataCell(Text('2023-10-26')),
                const DataCell(Text('Opent')),
                const DataCell(Text('-')),
                DataCell(IconButton(
                    onPressed: () {
                      openDialog(context);
                    },
                    icon: const Icon(
                      Icons.insert_page_break_outlined,
                      color: Colors.amber,
                    ))),
                DataCell(IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.insert_page_break_outlined,
                      color: Colors.amber,
                    ))),
              ],
            ),
            DataRow(
              cells: <DataCell>[
                const DataCell(CheckBox()),
                DataCell(Container(
                  child: const Column(
                    children: [
                      Text(
                        "1.1 Check Order Information [Order No: 32102653481001 Order Type: Modify CATID: IDC00002169 Service: IDC (บจก.แพคเซิร์ฟ)]",
                        style: TextStyle(fontSize: 11),
                      ),
                      Text(
                        "1.1 Check Order Information [Order No: 32102653481001 Order Type: Modify CATID: IDC00002169 Service: IDC (บจก.แพคเซิร์ฟ)]",
                        style: TextStyle(fontSize: 11),
                      )
                    ],
                  ),
                )),
                const DataCell(Text('xxxxxxxxxx')),
                const DataCell(Text('2023-10-26')),
                const DataCell(Text('Opent')),
                const DataCell(Text('-')),
                DataCell(IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.insert_page_break_outlined,
                      color: Colors.amber,
                    ))),
                DataCell(IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.insert_page_break_outlined,
                      color: Colors.amber,
                    ))),
              ],
            ),
            DataRow(
              cells: <DataCell>[
                const DataCell(CheckBox()),
                DataCell(Container(
                  child: const Column(
                    children: [
                      Text(
                        "1.1 Check Order Information [Order No: 32102653481001 Order Type: Modify CATID: IDC00002169 Service: IDC (บจก.แพคเซิร์ฟ)]",
                        style: TextStyle(fontSize: 11),
                      ),
                      Text(
                        "1.1 Check Order Information [Order No: 32102653481001 Order Type: Modify CATID: IDC00002169 Service: IDC (บจก.แพคเซิร์ฟ)]",
                        style: TextStyle(fontSize: 11),
                      )
                    ],
                  ),
                )),
                const DataCell(Text('xxxxxxxxxx')),
                const DataCell(Text('2023-10-26')),
                const DataCell(Text('Opent')),
                const DataCell(Text('-')),
                DataCell(IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.insert_page_break_outlined,
                      color: Colors.amber,
                    ))),
                DataCell(IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.insert_page_break_outlined,
                      color: Colors.amber,
                    ))),
              ],
            ),
            DataRow(
              cells: <DataCell>[
                const DataCell(CheckBox()),
                DataCell(Container(
                  child: const Column(
                    children: [
                      Text(
                        "1.1 Check Order Information [Order No: 32102653481001 Order Type: Modify CATID: IDC00002169 Service: IDC (บจก.แพคเซิร์ฟ)]",
                        style: TextStyle(fontSize: 11),
                      ),
                      Text(
                        "1.1 Check Order Information [Order No: 32102653481001 Order Type: Modify CATID: IDC00002169 Service: IDC (บจก.แพคเซิร์ฟ)]",
                        style: TextStyle(fontSize: 11),
                      )
                    ],
                  ),
                )),
                const DataCell(Text('xxxxxxxxxx')),
                const DataCell(Text('2023-10-26')),
                const DataCell(Text('Opent')),
                const DataCell(Text('-')),
                DataCell(IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.insert_page_break_outlined,
                      color: Colors.amber,
                    ))),
                DataCell(IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.insert_page_break_outlined,
                      color: Colors.amber,
                    ))),
              ],
            ),
            DataRow(
              cells: <DataCell>[
                const DataCell(CheckBox()),
                DataCell(Container(
                  child: const Column(
                    children: [
                      Text(
                        "1.1 Check Order Information [Order No: 32102653481001 Order Type: Modify CATID: IDC00002169 Service: IDC (บจก.แพคเซิร์ฟ)]",
                        style: TextStyle(fontSize: 11),
                      ),
                      Text(
                        "1.1 Check Order Information [Order No: 32102653481001 Order Type: Modify CATID: IDC00002169 Service: IDC (บจก.แพคเซิร์ฟ)]",
                        style: TextStyle(fontSize: 11),
                      )
                    ],
                  ),
                )),
                const DataCell(Text('xxxxxxxxxx')),
                const DataCell(Text('2023-10-26')),
                const DataCell(Text('Opent')),
                const DataCell(Text('-')),
                DataCell(IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.insert_page_break_outlined,
                      color: Colors.amber,
                    ))),
                DataCell(IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.insert_page_break_outlined,
                      color: Colors.amber,
                    ))),
              ],
            ),
            DataRow(
              cells: <DataCell>[
                const DataCell(CheckBox()),
                DataCell(Container(
                  child: const Column(
                    children: [
                      Text(
                        "1.1 Check Order Information [Order No: 32102653481001 Order Type: Modify CATID: IDC00002169 Service: IDC (บจก.แพคเซิร์ฟ)]",
                        style: TextStyle(fontSize: 11),
                      ),
                      Text(
                        "1.1 Check Order Information [Order No: 32102653481001 Order Type: Modify CATID: IDC00002169 Service: IDC (บจก.แพคเซิร์ฟ)]",
                        style: TextStyle(fontSize: 11),
                      )
                    ],
                  ),
                )),
                const DataCell(Text('xxxxxxxxxx')),
                const DataCell(Text('2023-10-26')),
                const DataCell(Text('Opent')),
                const DataCell(Text('-')),
                DataCell(IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.insert_page_break_outlined,
                      color: Colors.amber,
                    ))),
                DataCell(IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.insert_page_break_outlined,
                      color: Colors.amber,
                    ))),
              ],
            ),
            DataRow(
              cells: <DataCell>[
                const DataCell(CheckBox()),
                DataCell(Container(
                  child: const Column(
                    children: [
                      Text(
                        "1.1 Check Order Information [Order No: 32102653481001 Order Type: Modify CATID: IDC00002169 Service: IDC (บจก.แพคเซิร์ฟ)]",
                        style: TextStyle(fontSize: 11),
                      ),
                      Text(
                        "1.1 Check Order Information [Order No: 32102653481001 Order Type: Modify CATID: IDC00002169 Service: IDC (บจก.แพคเซิร์ฟ)]",
                        style: TextStyle(fontSize: 11),
                      )
                    ],
                  ),
                )),
                const DataCell(Text('xxxxxxxxxx')),
                const DataCell(Text('2023-10-26')),
                const DataCell(Text('Opent')),
                const DataCell(Text('-')),
                DataCell(IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.insert_page_break_outlined,
                      color: Colors.amber,
                    ))),
                DataCell(IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.insert_page_break_outlined,
                      color: Colors.amber,
                    ))),
              ],
            ),
            DataRow(
              cells: <DataCell>[
                const DataCell(CheckBox()),
                DataCell(Container(
                  child: const Column(
                    children: [
                      Text(
                        "1.1 Check Order Information [Order No: 32102653481001 Order Type: Modify CATID: IDC00002169 Service: IDC (บจก.แพคเซิร์ฟ)]",
                        style: TextStyle(fontSize: 11),
                      ),
                      Text(
                        "1.1 Check Order Information [Order No: 32102653481001 Order Type: Modify CATID: IDC00002169 Service: IDC (บจก.แพคเซิร์ฟ)]",
                        style: TextStyle(fontSize: 11),
                      )
                    ],
                  ),
                )),
                const DataCell(Text('xxxxxxxxxx')),
                const DataCell(Text('2023-10-26')),
                const DataCell(Text('Opent')),
                const DataCell(Text('-')),
                DataCell(IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.insert_page_break_outlined,
                      color: Colors.amber,
                    ))),
                DataCell(IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.insert_page_break_outlined,
                      color: Colors.amber,
                    ))),
              ],
            ),
            DataRow(
              cells: <DataCell>[
                const DataCell(CheckBox()),
                DataCell(Container(
                  child: const Column(
                    children: [
                      Text(
                        "1.1 Check Order Information [Order No: 32102653481001 Order Type: Modify CATID: IDC00002169 Service: IDC (บจก.แพคเซิร์ฟ)]",
                        style: TextStyle(fontSize: 11),
                      ),
                      Text(
                        "1.1 Check Order Information [Order No: 32102653481001 Order Type: Modify CATID: IDC00002169 Service: IDC (บจก.แพคเซิร์ฟ)]",
                        style: TextStyle(fontSize: 11),
                      )
                    ],
                  ),
                )),
                const DataCell(Text('xxxxxxxxxx')),
                const DataCell(Text('2023-10-26')),
                const DataCell(Text('Opent')),
                const DataCell(Text('-')),
                DataCell(IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.insert_page_break_outlined,
                      color: Colors.amber,
                    ))),
                DataCell(IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.insert_page_break_outlined,
                      color: Colors.amber,
                    ))),
              ],
            ),
            DataRow(
              cells: <DataCell>[
                const DataCell(CheckBox()),
                DataCell(Container(
                  child: const Column(
                    children: [
                      Text(
                        "1.1 Check Order Information [Order No: 32102653481001 Order Type: Modify CATID: IDC00002169 Service: IDC (บจก.แพคเซิร์ฟ)]",
                        style: TextStyle(fontSize: 11),
                      ),
                      Text(
                        "1.1 Check Order Information [Order No: 32102653481001 Order Type: Modify CATID: IDC00002169 Service: IDC (บจก.แพคเซิร์ฟ)]",
                        style: TextStyle(fontSize: 11),
                      )
                    ],
                  ),
                )),
                const DataCell(Text('xxxxxxxxxx')),
                const DataCell(Text('2023-10-26')),
                const DataCell(Text('Opent')),
                const DataCell(Text('-')),
                DataCell(IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.insert_page_break_outlined,
                      color: Colors.amber,
                    ))),
                DataCell(IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.insert_page_break_outlined,
                      color: Colors.amber,
                    ))),
              ],
            ),
          ],
        ),
      ),
      const Divider(),
      Container(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border:
                  Border.all(color: const Color(0xFFFECE00)), // เพิ่มเส้นขอบ
            ),
            child: ClipRRect(
              borderRadius:
                  BorderRadius.circular(10), // กำหนดให้มีโค้งตามต้องการ
              child: TextButton(
                onPressed: () {},
                child: const Icon(
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
                  child: const Text("1"),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text("2"),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text("3"),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                        color: const Color(0xFFFECE00)), // เพิ่มเส้นขอบ
                  ),
                  child: ClipRRect(
                    borderRadius:
                        BorderRadius.circular(10), // กำหนดให้มีโค้งตามต้องการ
                    child: TextButton(
                      onPressed: () {},
                      child: const Icon(
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
                padding: const EdgeInsets.symmetric(
                  vertical: 2,
                  horizontal: 22,
                ), // เพิ่มระยะห่างของข้อความ

                child: const Text(
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
                padding: const EdgeInsets.symmetric(
                    vertical: 8, horizontal: 16), // เพิ่มระยะห่างของข้อความ
                child: const Text(
                  'Go to',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )),
          const SizedBox(
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
                padding: const EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 16,
                ), // เพิ่มระยะห่างของข้อความ
                child: const TextField(
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
          const Padding(
            padding: EdgeInsets.fromLTRB(0, 0, 40, 0),
            child: Text(
              "Page",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          )
        ],
      ))
    ]);
  }
}

class CheckBox extends StatefulWidget {
  const CheckBox({Key? key}) : super(key: key);

  @override
  _CheckBoxState createState() => _CheckBoxState();
}

class _CheckBoxState extends State<CheckBox> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        checkboxTheme: CheckboxThemeData(
          side: const BorderSide(color: Colors.amber, width: 1),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4.0), // กำหนดความโค้งที่นี่
          ),
        ),
      ),
      child: Container(
        child: Checkbox(
          value: isChecked,
          onChanged: (bool? value) {
            setState(() {
              isChecked = value ?? false;
            });
          },
          checkColor: Colors.white,
          activeColor: Colors.amber,
        ),
      ),
    );
  }
}

Future<void> openDialog(BuildContext context) async {
  await showDialog(context: context, builder: (context) => const TaskStatus());
}

class ApproveDropDown extends StatelessWidget {
  final List<Items>? listitem;
  final Items? selectitem;
  final Function(Items)? callback;
  const ApproveDropDown({this.listitem, this.selectitem, this.callback});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Approval Status",
            style: const TextStyle(fontSize: 18),
          ),
          const SizedBox(
            height: 8,
          ),
          Container(
            height: 48,
            decoration: primaryBorder(radius: 12),
            child: Center(
                child: DropdownButtonHideUnderline(
              child: DropdownButton2<Items>(
                isExpanded: true,
                hint: const Text(
                  "Please select",
                  style: TextStyle(fontSize: 20, color: Colors.amber),
                ),
                items: (listitem ?? [])
                    .map((Items item) => DropdownMenuItem<Items>(
                          value: item,
                          child: Text(
                            item.value ?? "",
                            style: const TextStyle(
                                fontSize: 20, color: Colors.amber),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ))
                    .toList(),
                value: selectitem,
                onChanged: (Items? value) {
                  if (value != null) callback?.call(value);
                },
                iconStyleData: const IconStyleData(
                  icon: Padding(
                    padding: EdgeInsets.only(right: 8.0),
                    child: Icon(Icons.keyboard_arrow_down_rounded),
                  ),
                  iconSize: 20,
                  iconEnabledColor: Colors.amber,
                  iconDisabledColor: Colors.grey,
                ),
                menuItemStyleData: const MenuItemStyleData(
                  padding: EdgeInsets.only(right: 14, left: 14),
                ),
              ),
            )),
          )
        ],
      ),
    );
  }
}
