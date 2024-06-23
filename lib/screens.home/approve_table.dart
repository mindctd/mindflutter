import 'package:flutter/material.dart';

class ApproveTable extends StatefulWidget {
  const ApproveTable({super.key});

  @override
  State<ApproveTable> createState() => _ApproveTableState();
}

class _ApproveTableState extends State<ApproveTable> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            border: Border.all(color: Colors.grey),
          ),
          child: DataTableTask(),
          margin: EdgeInsets.fromLTRB(30, 10, 30,
              0), // ปรับค่า margin เพื่อให้ห่างจากขอบซ้ายและขวาทั้งคู่ละ 30
          width: double.infinity,
        ),
      ),
    );
  }
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
          headingRowColor:
              MaterialStateColor.resolveWith((states) => Color(0xFFFAFBFE)),
          columns: const <DataColumn>[
            DataColumn(
              label: Expanded(child: CheckBoxEx()),
            ),
            DataColumn(
              label: Expanded(
                child: SizedBox(
                  child: Text(
                    'Subject',
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
                DataCell(CheckBox()),
                DataCell(Container(
                  child: Column(
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
                DataCell(Text('xxxxxxxxxx')),
                DataCell(Text('2023-10-26')),
                DataCell(Text('Opent')),
                DataCell(Text('-')),
                DataCell(Icon(
                  Icons.insert_page_break_outlined,
                  color: Colors.amber,
                )),
                DataCell(Icon(
                  Icons.insert_page_break_outlined,
                  color: Colors.amber,
                )),
              ],
            ),
            DataRow(
              cells: <DataCell>[
                DataCell(CheckBox()),
                DataCell(Container(
                  child: Column(
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
                DataCell(Text('xxxxxxxxxx')),
                DataCell(Text('2023-10-26')),
                DataCell(Text('Opent')),
                DataCell(Text('-')),
                DataCell(Icon(
                  Icons.insert_page_break_outlined,
                  color: Colors.amber,
                )),
                DataCell(Icon(
                  Icons.insert_page_break_outlined,
                  color: Colors.amber,
                )),
              ],
            ),
            DataRow(
              cells: <DataCell>[
                DataCell(CheckBox()),
                DataCell(Container(
                  child: Column(
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
                DataCell(Text('xxxxxxxxxx')),
                DataCell(Text('2023-10-26')),
                DataCell(Text('Opent')),
                DataCell(Text('-')),
                DataCell(Icon(
                  Icons.insert_page_break_outlined,
                  color: Colors.amber,
                )),
                DataCell(Icon(
                  Icons.insert_page_break_outlined,
                  color: Colors.amber,
                )),
              ],
            ),
            DataRow(
              cells: <DataCell>[
                DataCell(CheckBox()),
                DataCell(Container(
                  child: Column(
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
                DataCell(Text('xxxxxxxxxx')),
                DataCell(Text('2023-10-26')),
                DataCell(Text('Opent')),
                DataCell(Text('-')),
                DataCell(Icon(
                  Icons.insert_page_break_outlined,
                  color: Colors.amber,
                )),
                DataCell(Icon(
                  Icons.insert_page_break_outlined,
                  color: Colors.amber,
                )),
              ],
            ),
            DataRow(
              cells: <DataCell>[
                DataCell(CheckBox()),
                DataCell(Container(
                  child: Column(
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
                DataCell(Text('xxxxxxxxxx')),
                DataCell(Text('2023-10-26')),
                DataCell(Text('Opent')),
                DataCell(Text('-')),
                DataCell(Icon(
                  Icons.insert_page_break_outlined,
                  color: Colors.amber,
                )),
                DataCell(Icon(
                  Icons.insert_page_break_outlined,
                  color: Colors.amber,
                )),
              ],
            ),
            DataRow(
              cells: <DataCell>[
                DataCell(CheckBox()),
                DataCell(Container(
                  child: Column(
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
                DataCell(Text('xxxxxxxxxx')),
                DataCell(Text('2023-10-26')),
                DataCell(Text('Opent')),
                DataCell(Text('-')),
                DataCell(Icon(
                  Icons.insert_page_break_outlined,
                  color: Colors.amber,
                )),
                DataCell(Icon(
                  Icons.insert_page_break_outlined,
                  color: Colors.amber,
                )),
              ],
            ),
            DataRow(
              cells: <DataCell>[
                DataCell(CheckBox()),
                DataCell(Container(
                  child: Column(
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
                DataCell(Text('xxxxxxxxxx')),
                DataCell(Text('2023-10-26')),
                DataCell(Text('Opent')),
                DataCell(Text('-')),
                DataCell(Icon(
                  Icons.insert_page_break_outlined,
                  color: Colors.amber,
                )),
                DataCell(Icon(
                  Icons.insert_page_break_outlined,
                  color: Colors.amber,
                )),
              ],
            ),
            DataRow(
              cells: <DataCell>[
                DataCell(CheckBox()),
                DataCell(Container(
                  child: Column(
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
                DataCell(Text('xxxxxxxxxx')),
                DataCell(Text('2023-10-26')),
                DataCell(Text('Opent')),
                DataCell(Text('-')),
                DataCell(Icon(
                  Icons.insert_page_break_outlined,
                  color: Colors.amber,
                )),
                DataCell(Icon(
                  Icons.insert_page_break_outlined,
                  color: Colors.amber,
                )),
              ],
            ),
            DataRow(
              cells: <DataCell>[
                DataCell(CheckBox()),
                DataCell(Container(
                  child: Column(
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
                DataCell(Text('xxxxxxxxxx')),
                DataCell(Text('2023-10-26')),
                DataCell(Text('Opent')),
                DataCell(Text('-')),
                DataCell(Icon(
                  Icons.insert_page_break_outlined,
                  color: Colors.amber,
                )),
                DataCell(Icon(
                  Icons.insert_page_break_outlined,
                  color: Colors.amber,
                )),
              ],
            ),
            DataRow(
              cells: <DataCell>[
                DataCell(CheckBox()),
                DataCell(Container(
                  child: Column(
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
                DataCell(Text('xxxxxxxxxx')),
                DataCell(Text('2023-10-26')),
                DataCell(Text('Opent')),
                DataCell(Text('-')),
                DataCell(Icon(
                  Icons.insert_page_break_outlined,
                  color: Colors.amber,
                )),
                DataCell(Icon(
                  Icons.insert_page_break_outlined,
                  color: Colors.amber,
                )),
              ],
            ),
          ],
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
          side: BorderSide(color: Colors.amber, width: 1),
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

class CheckBoxEx extends StatelessWidget {
  const CheckBoxEx({super.key});

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        checkboxTheme: CheckboxThemeData(
          side: BorderSide(color: Colors.amber, width: 1),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4.0), // กำหนดความโค้งที่นี่
          ),
        ),
      ),
      child: CheckBox(),
    );
  }
}
