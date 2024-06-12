import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class Home2 extends StatefulWidget {
  const Home2({super.key});

  @override
  State<Home2> createState() => _Home2State();
}

class _Home2State extends State<Home2> {
  int selectedRadio = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 58,
          title: Padding(
            padding: const EdgeInsets.fromLTRB(20, 16, 0, 16),
            child: Text(
              "Transfer Approval Task",
              style: TextStyle(
                  fontSize: 24, color: Colors.amber, fontFamily: 'NT'),
            ),
          ),
          backgroundColor: Color.fromARGB(255, 255, 248, 226),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(40, 20, 40, 0),
            child: Container(
              child: Column(
                children: [
                  Row(
                    children: [
                      Radio(
                        value: 1,
                        groupValue: selectedRadio,
                        onChanged: (value) {
                          setState(() {
                            selectedRadio = value as int;
                          });
                        },
                        activeColor: Colors.amber,
                      ),
                      Text("Search by Employee"),
                      Radio(
                        value: 2,
                        groupValue: selectedRadio,
                        onChanged: (value) {
                          setState(() {
                            selectedRadio = value as int;
                          });
                        },
                        activeColor: Colors.amber,
                      ),
                      Text("Search by Employee")
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                    child: Container(
                      alignment: Alignment.centerLeft,
                      child: Text('Approval Group'),
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(0, 7, 0, 0),
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: 'Please select', // ข้อความ hint
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15)),
                                borderSide: BorderSide(color: Colors.grey),
                              ),
                              // border: InputBorder.none,

                              // ไม่มีเส้นขอบสำหรับ TextField
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 22),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(12, 0, 0, 0),
                        child: Container(
                          width: 120,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Color(0xFFFECE00),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: TextButton(
                            onPressed: () {
                              // การกดปุ่ม Search
                            },
                            child: Text(
                              'Search',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 40, 0, 0),
                    child: Divider(),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                    child: Container(
                      alignment: Alignment.centerLeft,
                      child: Text('Select Transfer Approaval Task'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
                    child: Container(
                      child: DataTable1(),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 40, 0, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          width: 160,
                          height: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                                color: Color(0xFFFECE00)), // เพิ่มเส้นขอบ
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(
                                10), // กำหนดให้มีโค้งตามต้องการ
                            child: TextButton(
                              onPressed: () {},
                              child: Text(
                                "Cancel",
                                style: TextStyle(
                                    color: Color(0xFFFECE00),
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                          child: Container(
                            width: 160,
                            height: 40,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Color(0xFFFECE00) // เพิ่มเส้นขอบ
                                ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(
                                  10), // กำหนดให้มีโค้งตามต้องการ
                              child: TextButton(
                                onPressed: () {},
                                child: Text(
                                  'Submit',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}

class DataTable1 extends StatefulWidget {
  const DataTable1({super.key});

  @override
  State<DataTable1> createState() => _DataTable1State();
}

int list = 10;
List<Color> rowColors = List<Color>.generate(list, (index) => Colors.white);
List<bool> showIcon = List<bool>.generate(list, (index) => false);

class _DataTable1State extends State<DataTable1> {
  @override
  Widget build(BuildContext context) {
    double rowHeight = (MediaQuery.of(context).size.height - 56) / 10;
    return Theme(
      data: Theme.of(context).copyWith(
        dividerColor: Colors.amber,
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: Color(0xFFFECE00),
          ),
        ),
        child:
            Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          DataTable(
              showCheckboxColumn: false,
              dataRowMaxHeight: rowHeight,
              headingRowColor: MaterialStateColor.resolveWith(
                  (states) => Colors.grey.withOpacity(0.2)),
              columns: const <DataColumn>[
                DataColumn(
                  label: Expanded(
                    child: SizedBox(
                      width: 1320,
                      child: Text(
                        'Approval Group',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                DataColumn(
                  label: Expanded(
                    child: SizedBox(
                      width: 76,
                      child: Text(
                        '',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
              rows: List<DataRow>.generate(
                  10,
                  (index) => DataRow(
                          color: MaterialStateProperty.resolveWith((states) {
                            return rowColors[index];
                          }),
                          onSelectChanged: (value) {
                            setState(() {
                              rowColors[index] =
                                  rowColors[index] == Colors.white
                                      ? Color.fromRGBO(252, 182, 0, 0.03)
                                      : Colors.white;
                              showIcon[index] = !showIcon[index];
                            });
                          },
                          cells: [
                            DataCell(Text('Group Marketing')),
                            DataCell(showIcon[index]
                                ? Icon(Icons.check)
                                : SizedBox()),
                          ]))),
          Divider(),
          Container(
              height: 57,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Spacer(),
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
                          Icons.arrow_back_ios_new_rounded,
                          color: Color(0xFFFECE00),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                    child: Container(
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
                          TextButton(
                            onPressed: () {},
                            child: Text("5..."),
                          ),
                          TextButton(
                            onPressed: () {},
                            child: Text("59"),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                  color: Color(0xFFFECE00)), // เพิ่มเส้นขอบ
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(
                                  10), // กำหนดให้มีโค้งตามต้องการ
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
                  ),
                ],
              ))
        ]),
      ),
    );
  }
}
