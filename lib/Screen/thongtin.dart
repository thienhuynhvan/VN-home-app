import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:test_thuetro/Screen/diachi.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: thongtinScreen(),
  ));
}

class thongtinScreen extends StatefulWidget {
  const thongtinScreen({super.key});

  @override
  State<thongtinScreen> createState() => _thongtinScreenState();
}

class _thongtinScreenState extends State<thongtinScreen> {
  String documentsend = DateTime.now().millisecond.toString();
  String? typeofhome;
  String? gioitinh;
  final TextEditingController soluongphongctl = TextEditingController();
  final TextEditingController SucChuactl = TextEditingController();
  final TextEditingController dientichctl = TextEditingController();
  final TextEditingController giachothuectl = TextEditingController();
  final TextEditingController tiendienctl = TextEditingController();
  final TextEditingController tiennuocctl = TextEditingController();
  bool checkedValue = false;
  String? chodexe;

  void _onRememberMeChanged(bool newValue) => setState(() {
        checkedValue = newValue;

        if (checkedValue) {
          print(newValue.toString());
        } else {
          print('ban chua tick vao checkbox');
        }
      });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            Center(
                child: Text(
              'ĐĂNG PHÒNG',
              style: TextStyle(fontSize: 25),
            )),
            SizedBox(
              height: 100,
            ),
            // ElevatedButton(
            //     onPressed: () {
            //       print(chodexe);
            //     },
            //     child: Text('CLICK')),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(
                      left: 0.0, top: 8.0, bottom: 8.0, right: 12.0),
                  width: 5.0,
                  height: 5.0,
                  decoration: BoxDecoration(),
                ),
                Directionality(
                    textDirection: TextDirection.ltr,
                    child: Text(
                      'Thông tin phòng',
                      style: TextStyle(fontSize: 20),
                    ))
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(
                      left: 8.0, top: 8.0, bottom: 8.0, right: 12.0),
                  width: 10.0,
                  height: 0,
                  decoration: BoxDecoration(),
                ),
                Directionality(
                    textDirection: TextDirection.ltr,
                    child: Text(
                      'LOẠI PHÒNG',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.grey,
                      ),
                    ))
              ],
            ),
            Stack(children: [
              Column(
                children: [
                  RadioListTile(
                    title: Text("Kí túc xá/Homestay"),
                    value: "kí túc xá/Homestay",
                    groupValue: typeofhome,
                    onChanged: (value) {
                      setState(() {
                        typeofhome = value.toString();
                        print('$typeofhome');
                      });
                    },
                  ),
                  RadioListTile(
                    title: Text("Phòng cho thuê"),
                    value: "Phòng cho thuê",
                    groupValue: typeofhome,
                    onChanged: (value) {
                      setState(() {
                        typeofhome = value.toString();
                        print('$typeofhome');
                      });
                    },
                  ),
                  RadioListTile(
                    title: Text("Phòng ở ghép"),
                    value: "Phòng ở ghép",
                    groupValue: typeofhome,
                    onChanged: (value) {
                      setState(() {
                        typeofhome = value.toString();
                        print('$typeofhome');
                      });
                    },
                  ),
                  RadioListTile(
                    title: Text("Nhà nguyên căn"),
                    value: "Nhà nguyên căn",
                    groupValue: typeofhome,
                    onChanged: (value) {
                      setState(() {
                        typeofhome = value.toString();
                        print('$typeofhome');
                      });
                    },
                  ),
                  RadioListTile(
                    title: Text("Căn hộ"),
                    value: "Căn hộ",
                    groupValue: typeofhome,
                    onChanged: (value) {
                      setState(() {
                        typeofhome = value.toString();
                        print('$typeofhome');
                      });
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                            left: 8.0, top: 8.0, bottom: 8.0, right: 12.0),
                        width: 10.0,
                        height: 0,
                        decoration: BoxDecoration(),
                      ),
                      Directionality(
                          textDirection: TextDirection.ltr,
                          child: Text(
                            'SỐ LƯỢNG PHÒNG',
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.grey,
                            ),
                          ))
                    ],
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                    child: SizedBox(
                      width: 350,
                      child: TextField(
                        controller: soluongphongctl,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                            border: UnderlineInputBorder(),
                            hintText: 'Nhập số phòng bạn muốn cho thuê',
                            hintStyle: TextStyle(color: Colors.grey)),
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                            left: 8.0, top: 8.0, bottom: 8.0, right: 12.0),
                        width: 10.0,
                        height: 0,
                        decoration: BoxDecoration(),
                      ),
                      Directionality(
                          textDirection: TextDirection.ltr,
                          child: Text(
                            'SỨC CHỨA',
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.grey,
                            ),
                          ))
                    ],
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 15),
                    child: SizedBox(
                      width: 350,
                      child: TextField(
                        controller: SucChuactl,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                            border: UnderlineInputBorder(),
                            hintText: 'Nhập số người/phòng',
                            hintStyle: TextStyle(color: Colors.grey)),
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                            left: 8.0, top: 8.0, bottom: 8.0, right: 12.0),
                        width: 10.0,
                        height: 0,
                        decoration: BoxDecoration(),
                      ),
                      Directionality(
                          textDirection: TextDirection.ltr,
                          child: Text(
                            'Giới tính',
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.grey,
                            ),
                          ))
                    ],
                  ),
                  Column(children: [
                    RadioListTile(
                      title: Text("Tất cả"),
                      value: "Tất cả",
                      groupValue: gioitinh,
                      onChanged: (value) {
                        setState(() {
                          gioitinh = value.toString();
                        });
                      },
                    ),
                    RadioListTile(
                      title: Text("Nam"),
                      value: "Nam",
                      groupValue: gioitinh,
                      onChanged: (value) {
                        setState(() {
                          gioitinh = value.toString();
                        });
                      },
                    ),
                    RadioListTile(
                      title: Text("Nữ"),
                      value: "Nữ",
                      groupValue: gioitinh,
                      onChanged: (value) {
                        setState(() {
                          gioitinh = value.toString();
                        });
                      },
                    ),
                  ]),
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                            left: 0, top: 8.0, bottom: 8.0, right: 12.0),
                        width: 10.0,
                        height: 0,
                        decoration: BoxDecoration(),
                      ),
                      Directionality(
                          textDirection: TextDirection.ltr,
                          child: Text(
                            'DIỆN TÍCH',
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.grey,
                            ),
                          ))
                    ],
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 15),
                    child: SizedBox(
                      width: 350,
                      child: TextField(
                        controller: dientichctl,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                            border: UnderlineInputBorder(),
                            hintText: 'Nhập diện tích phòng (m2)',
                            hintStyle: TextStyle(color: Colors.grey)),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                            left: 0.0, top: 8.0, bottom: 8.0, right: 12.0),
                        width: 5.0,
                        height: 5.0,
                        decoration: BoxDecoration(),
                      ),
                      Directionality(
                          textDirection: TextDirection.ltr,
                          child: Text(
                            'Chi Phí',
                            style: TextStyle(fontSize: 20),
                          ))
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                            left: 0, top: 8.0, bottom: 8.0, right: 12.0),
                        width: 10.0,
                        height: 0,
                        decoration: BoxDecoration(),
                      ),
                      Directionality(
                          textDirection: TextDirection.ltr,
                          child: Text(
                            'GIÁ CHO THUÊ',
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.grey,
                            ),
                          ))
                    ],
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 15),
                    child: SizedBox(
                      width: 350,
                      child: TextField(
                        controller: giachothuectl,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                            border: UnderlineInputBorder(),
                            hintText: 'Nhập giá cho thuê (VND/PHÒNG)',
                            hintStyle: TextStyle(color: Colors.grey)),
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                            left: 0, top: 8.0, bottom: 8.0, right: 12.0),
                        width: 10.0,
                        height: 0,
                        decoration: BoxDecoration(),
                      ),
                      Directionality(
                          textDirection: TextDirection.ltr,
                          child: Text(
                            'TIỀN ĐIỆN',
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.grey,
                            ),
                          ))
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 15),
                        child: Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: 15),
                              width: 300,
                              child: TextField(
                                controller: tiendienctl,
                                keyboardType: TextInputType.number,
                                decoration: const InputDecoration(
                                    border: UnderlineInputBorder(),
                                    hintText: 'Nhập số tiền',
                                    hintStyle: TextStyle(color: Colors.grey)),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                            left: 0, top: 8.0, bottom: 8.0, right: 12.0),
                        width: 10.0,
                        height: 0,
                        decoration: BoxDecoration(),
                      ),
                      Directionality(
                          textDirection: TextDirection.ltr,
                          child: Text(
                            'TIỀN NƯỚC',
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.grey,
                            ),
                          ))
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 15),
                        child: Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: 15),
                              width: 300,
                              child: TextField(
                                controller: tiennuocctl,
                                keyboardType: TextInputType.number,
                                decoration: const InputDecoration(
                                    border: UnderlineInputBorder(),
                                    hintText: 'Nhập số tiền',
                                    hintStyle: TextStyle(color: Colors.grey)),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 10,
                      ),
                      Checkbox(
                        value: this.checkedValue,
                        onChanged: (bool? value) {
                          setState(() {
                            checkedValue = value!;
                            if (checkedValue == true) {
                              chodexe = 'có chỗ để xe';
                            } else {
                              chodexe = 'không có chỗ để xe';
                            }
                          });
                        },
                      ),
                      Text(
                        'Có chỗ để xe',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      OutlinedButton(
                          onPressed: () async {
                            CollectionReference Post1 =
                                FirebaseFirestore.instance.collection('Post');
                            await Post1.doc('$documentsend')
                                .set({
                                  'Post ID' : documentsend,
                                  'LoaiPhong': typeofhome,
                                  'SoLuongPhong': soluongphongctl.text,
                                  'SucChua': SucChuactl.text,
                                  'GioiTinh': gioitinh,
                                  'DienTich': dientichctl.text,
                                  'Giachothue': giachothuectl.text,
                                  'Tiendien': tiendienctl.text,
                                  'tiennuoc': tiennuocctl.text,
                                  'Cho de xe': chodexe,
                                })
                                .then((value) => print("Success Added"))
                                .catchError((error) =>
                                    print("Failed to add data: $error"));
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DiachiScreen(
                                      documentsend2: documentsend,
                                   
                                      )),
                            );
                          },
                          child: Text('Tiếp Theo')),
                    ],
                  )
                ],
              ),
            ]),
          ],
        ),
      ),
    );
  }
}
