import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_svg/svg.dart';
import 'package:http/http.dart';
import 'package:huangjui/Etc/color_for_app.dart';
import 'package:huangjui/Etc/timepickClass.dart';
import 'package:huangjui/api/put_register_form.dart';


String? k;
String? a;
String? b;
String form_name = '';
String form_surename = '';

String? dayBirth = '';
String? monthBirth = '';
String? yearBirth = '';
String? monthInThai = '';
String? hourBirth = '';
String? minuteBirth = '';

String gender = 'ไม่ระบุ';

late Provider_registerForm _provider_registerForm;
final formKey_register_form = GlobalKey<FormState>();
var _nameController = TextEditingController();
var _surenameController = TextEditingController();

class Register_Form extends StatefulWidget {
  String? id = '1';
  String? email = 'x@mail.com';
  Register_Form({Key? key, this.id, this.email}) : super(key: key);

  @override
  State<Register_Form> createState() => _Register_FormState();
}

class _Register_FormState extends State<Register_Form> {
  @override
  void initState() {
    _provider_registerForm = Provider_registerForm();
    super.initState();
  }

  int radioID = 1;
  String x = '';

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Stack(
          children: <Widget>[
            Image.asset('assets/images/background_full.jpg',
                width: MediaQuery.of(context).size.width * 1,
                height: MediaQuery.of(context).size.height * 1,
                fit: BoxFit.fill),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'ลงทะเบียน',
                  style: TextStyle(
                      fontSize: 45,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 215, 190, 138)),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Color.fromARGB(255, 255, 239, 224),
                    ),
                    width: double.infinity,
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(30, 25.0, 30, 30),
                      child: Form(
                        key: formKey_register_form,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(
                              child: Text('กรอกข้อมูลส่วนตัว',
                                  style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold,
                                      color: theRed)),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              'ชื่อ-นามสกุล',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.05,
                                      width: double.infinity,
                                      child: TextFormField(
                                        controller: _nameController,
                                        validator: (value) {
                                          if (value!.isEmpty) {}
                                          return null;
                                        },
                                        keyboardType: TextInputType.name,
                                        onSaved: (input) {
                                          form_name = input.toString();
                                        },
                                        textAlignVertical:
                                            TextAlignVertical.center,
                                        textInputAction: TextInputAction.done,
                                        decoration: InputDecoration(
                                          contentPadding: EdgeInsets.all(10.0),
                                          counterText: "",
                                          filled: true,
                                          fillColor: Colors.white,
                                          hintStyle: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 212, 212, 212)),
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10.0)),
                                            borderSide: BorderSide(
                                                color: Color.fromARGB(
                                                    255, 230, 228, 228),
                                                width: 0),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10.0)),
                                            borderSide: BorderSide(
                                                color: Palette.thisRed,
                                                width: 1),
                                          ),
                                        ),
                                      )),
                                ),
                                VerticalDivider(width: 5),
                                Expanded(
                                  child: SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.05,
                                      width: double.infinity,
                                      child: TextFormField(
                                        controller: _surenameController,
                                        validator: (value) {
                                          if (value!.isEmpty) {}
                                          return null;
                                        },
                                        keyboardType: TextInputType.name,
                                        onSaved: (input) {
                                          form_surename = input.toString();
                                        },
                                        textInputAction: TextInputAction.done,
                                        decoration: InputDecoration(
                                          contentPadding: EdgeInsets.all(10.0),
                                          counterText: "",
                                          filled: true,
                                          fillColor: Colors.white,
                                          hintStyle: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 212, 212, 212)),
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10.0)),
                                            borderSide: BorderSide(
                                                color: Color.fromARGB(
                                                    255, 230, 228, 228),
                                                width: 0),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10.0)),
                                            borderSide: BorderSide(
                                                color: Palette.thisRed,
                                                width: 1),
                                          ),
                                        ),
                                      )),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              'เพศ',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Row(
                                  children: [
                                    Radio(
                                      value: 1,
                                      groupValue: radioID,
                                      onChanged: (val) {
                                        setState(() {
                                          gender = 'ไม่ระบุ';
                                          radioID = 1;
                                        });
                                        print(gender);
                                      },
                                    ),
                                    Text(
                                      'ไม่ระบุ',
                                      style: new TextStyle(fontSize: 17.0),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Row(
                                  children: [
                                    Radio(
                                      value: 2,
                                      groupValue: radioID,
                                      onChanged: (val) {
                                        setState(() {
                                          gender = 'หญิง';
                                          radioID = 2;
                                        });
                                        print(gender);
                                      },
                                    ),
                                    Text(
                                      'หญิง',
                                      style: new TextStyle(
                                        fontSize: 17.0,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Row(
                                  children: [
                                    Radio(
                                      value: 3,
                                      groupValue: radioID,
                                      onChanged: (val) {
                                        setState(() {
                                          gender = 'ชาย';
                                          radioID = 3;
                                        });
                                        print(gender);
                                      },
                                    ),
                                    Text(
                                      'ชาย',
                                      style: new TextStyle(fontSize: 17.0),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            TextButton(
                                style: TextButton.styleFrom(
                                  minimumSize: Size.zero,
                                  padding: EdgeInsets.zero,
                                  tapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,
                                ),
                                onPressed: () {
                                  DatePicker.showDatePicker(context,
                                      showTitleActions: true,
                                      theme: DatePickerTheme(
                                          itemStyle:
                                              TextStyle(fontFamily: 'Kanit'),
                                          doneStyle: TextStyle(
                                              fontFamily: 'Kanit',
                                              fontWeight: FontWeight.bold),
                                          cancelStyle: TextStyle(
                                              fontFamily: 'Kanit',
                                              color: Colors.grey)),
                                      minTime: DateTime(1960, 1, 1),
                                      maxTime: DateTime.now(),
                                      onConfirm: (date) {
                                    if (date.month.toString() == '1') {
                                      setState(() {
                                        monthInThai = 'มกราคม';
                                      });
                                    } else if (date.month.toString() == '2') {
                                      setState(() {
                                        monthInThai = 'กุมภาพันธ์';
                                      });
                                    } else if (date.month.toString() == '3') {
                                      setState(() {
                                        monthInThai = 'มีนาคม';
                                      });
                                    } else if (date.month.toString() == '4') {
                                      setState(() {
                                        monthInThai = 'เมษายน';
                                      });
                                    } else if (date.month.toString() == '5') {
                                      setState(() {
                                        monthInThai = 'พฤษภาคม';
                                      });
                                      print(monthInThai);
                                    } else if (date.month.toString() == '6') {
                                      setState(() {
                                        monthInThai = 'มิถุนายน';
                                      });
                                    } else if (date.month.toString() == '7') {
                                      setState(() {
                                        monthInThai = 'กรกฏาคม';
                                      });
                                      print(monthInThai);
                                    } else if (date.month.toString() == '8') {
                                      setState(() {
                                        monthInThai = 'สิงหาคม';
                                      });
                                    } else if (date.month.toString() == '9') {
                                      setState(() {
                                        monthInThai = 'กันยายน';
                                      });
                                    } else if (date.month.toString() == '10') {
                                      setState(() {
                                        monthInThai = 'ตุลาคม';
                                      });
                                    } else if (date.month.toString() == '11') {
                                      setState(() {
                                        monthInThai = 'พฤษจิกายน';
                                      });
                                    } else {
                                      setState(() {
                                        monthInThai = 'ธันวาคม';
                                      });
                                    }
                                    setState(() {
                                      dayBirth = date.day.toString();
                                      monthBirth = monthInThai;
                                      yearBirth = (date.year + 543).toString();
                                    });
                                    print(dayBirth.toString() +
                                        monthBirth.toString() +
                                        yearBirth.toString());
                                  },
                                      currentTime: DateTime.now(),
                                      locale: LocaleType.th);
                                },
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      'เลือกวันเดือนปีเกิด (วัน/เดือน/ปี)',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Icon(Icons.arrow_drop_down_sharp),
                                  ],
                                )),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.05,
                                  width: 60,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 0,
                                        color:
                                            Color.fromARGB(255, 212, 212, 212)),
                                    color: Colors.white,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10.0)),
                                  ),
                                  child: Center(
                                      child: Text(
                                    dayBirth.toString(),
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  )),
                                ),
                                VerticalDivider(width: 5),
                                Expanded(
                                  child: Container(
                                    height: MediaQuery.of(context).size.height *
                                        0.05,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 0,
                                          color: Color.fromARGB(
                                              255, 212, 212, 212)),
                                      color: Colors.white,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10.0)),
                                    ),
                                    child: Center(
                                        child: Text(
                                      monthBirth.toString(),
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    )),
                                  ),
                                ),
                                VerticalDivider(width: 5),
                                Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.05,
                                  width: 100,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 0,
                                        color:
                                            Color.fromARGB(255, 212, 212, 212)),
                                    color: Colors.white,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10.0)),
                                  ),
                                  child: Center(
                                      child: Text(
                                    yearBirth.toString(),
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  )),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            TextButton(
                                style: TextButton.styleFrom(
                                  minimumSize: Size.zero,
                                  padding: EdgeInsets.zero,
                                  tapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,
                                ),
                                onPressed: () {
                                  DatePicker.showPicker(context,
                                      showTitleActions: true,
                                      theme: DatePickerTheme(
                                          itemStyle:
                                              TextStyle(fontFamily: 'Kanit'),
                                          doneStyle: TextStyle(
                                              fontFamily: 'Kanit',
                                              fontWeight: FontWeight.bold),
                                          cancelStyle: TextStyle(
                                              fontFamily: 'Kanit',
                                              color: Colors.grey)),
                                      onChanged: (date) {}, onConfirm: (time) {
                                    setState(() {
                                      hourBirth =
                                          time.minute.toString() + " นาฬิกา";
                                      minuteBirth =
                                          time.second.toString() + " นาที";
                                    });

                                    print(time.minute.toString() +
                                        " : " +
                                        time.second.toString());
                                  },
                                      pickerModel: CustomPicker(
                                          currentTime: DateTime.now(),
                                          locale: LocaleType.th),
                                      locale: LocaleType.th);
                                },
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      'เลือกเวลาเกิด (ชม./นาที)',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Icon(Icons.arrow_drop_down_sharp),
                                  ],
                                )),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Container(
                                    height: MediaQuery.of(context).size.height *
                                        0.05,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 0,
                                          color: Color.fromARGB(
                                              255, 212, 212, 212)),
                                      color: Colors.white,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10.0)),
                                    ),
                                    child: Center(
                                        child: Text(
                                      hourBirth.toString(),
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    )),
                                  ),
                                ),
                                VerticalDivider(width: 5),
                                Text(
                                  ' : ',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 30),
                                ),
                                VerticalDivider(width: 5),
                                Expanded(
                                  child: Container(
                                    height: MediaQuery.of(context).size.height *
                                        0.05,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 0,
                                          color: Color.fromARGB(
                                              255, 212, 212, 212)),
                                      color: Colors.white,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10.0)),
                                    ),
                                    child: Center(
                                        child: Text(
                                      minuteBirth.toString(),
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    )),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 40,
                            ),
                            Container(
                              alignment: Alignment.center,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    elevation: 0,
                                    primary: theRed,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5),
                                    )),
                                onPressed: () {
                                  FocusManager.instance.primaryFocus?.unfocus();
                                  if (formKey_register_form.currentState!
                                      .validate()) {
                                    formKey_register_form.currentState?.save();
                                    setState(() {
                                      _provider_registerForm.email =
                                          widget.email.toString();

                                      _provider_registerForm.name =
                                          form_name.toString() +
                                              " " +
                                              form_surename.toString();

                                      _provider_registerForm.gender = gender;

                                      _provider_registerForm.birthDate =
                                          dayBirth.toString() +
                                              monthBirth.toString() +
                                              yearBirth.toString();

                                      _provider_registerForm.birthTime =
                                          hourBirth.toString() +
                                              minuteBirth.toString();
                                    });
                                    // put_register_form(_provider_registerForm,
                                    //     widget.id.toString());
                                  }
                                  print(jsonEncode(_provider_registerForm));
                                },
                                child: const Padding(
                                  padding: EdgeInsets.all(10.0),
                                  child: Text(
                                    "สมัครสมาชิก",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color:
                                            Color.fromARGB(255, 255, 255, 255),
                                        fontSize: 18),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
