import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:http/http.dart';
import 'package:huangjui/Etc/color_for_app.dart';
import 'package:huangjui/api/put_register_form.dart';
import '../api/google_auth.dart';

String? k;
String? a;
String? b;
String form_name = '';
String form_surename = '';
final formKey_register_form = GlobalKey<FormState>();
late Provider_registerForm _provider_registerForm;
var _nameController = TextEditingController();
var _surenameController = TextEditingController();

class Register_Form extends StatefulWidget {
  String? id;
  String? email;
  Register_Form({Key? key, required this.id, required this.email})
      : super(key: key);

  @override
  State<Register_Form> createState() => _Register_FormState();
}

class _Register_FormState extends State<Register_Form> {
  @override
  void initState() {
    _provider_registerForm = Provider_registerForm();

    super.initState();
  }

  String radioButtonItem = 'ONE';
  int id = 1;
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
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Color.fromARGB(255, 255, 239, 224),
                    ),
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(30, 25.0, 30, 30),
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
                                        decoration: const InputDecoration(
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
                                const VerticalDivider(width: 5),
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
                            const SizedBox(
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
                                      groupValue: id,
                                      onChanged: (val) {
                                        setState(() {
                                          radioButtonItem = 'ONE';
                                          id = 1;
                                        });
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
                                      groupValue: id,
                                      onChanged: (val) {
                                        setState(() {
                                          radioButtonItem = 'TWO';
                                          id = 2;
                                        });
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
                                      groupValue: id,
                                      onChanged: (val) {
                                        setState(() {
                                          radioButtonItem = 'THREE';
                                          id = 3;
                                        });
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
                            Text(
                              'วัน เดือน ปีเกิด',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.05,
                                    width: 60,
                                    child: TextFormField(
                                      maxLength: 2,
                                      validator: (value) {
                                        if (value!.isEmpty) {}
                                        return null;
                                      },
                                      keyboardType: TextInputType.number,
                                      onSaved: (input) {},
                                      textInputAction: TextInputAction.done,
                                      decoration: const InputDecoration(
                                        counterText: "",
                                        contentPadding: EdgeInsets.all(10.0),
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
                                              color: Palette.thisRed, width: 1),
                                        ),
                                      ),
                                    )),
                                VerticalDivider(width: 5),
                                Expanded(
                                  child: SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.05,
                                      width: double.infinity,
                                      child: TextFormField(
                                        validator: (value) {
                                          if (value!.isEmpty) {}
                                          return null;
                                        },
                                        keyboardType: TextInputType.name,
                                        onSaved: (input) {},
                                        textInputAction: TextInputAction.done,
                                        decoration: const InputDecoration(
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
                                SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.05,
                                    width: 100,
                                    child: TextFormField(
                                      maxLength: 4,
                                      validator: (value) {
                                        if (value!.isEmpty) {}
                                        return null;
                                      },
                                      keyboardType: TextInputType.number,
                                      onSaved: (input) {},
                                      textInputAction: TextInputAction.done,
                                      decoration: const InputDecoration(
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
                                              color: Palette.thisRed, width: 1),
                                        ),
                                      ),
                                    )),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'เวลาเกิด',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.05,
                                      width: double.infinity,
                                      child: TextFormField(
                                        validator: (value) {
                                          if (value!.isEmpty) {}
                                          return null;
                                        },
                                        keyboardType: TextInputType.name,
                                        onSaved: (input) {},
                                        textAlignVertical:
                                            TextAlignVertical.center,
                                        textInputAction: TextInputAction.done,
                                        decoration: const InputDecoration(
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
                                Text(
                                  ' : ',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 30),
                                ),
                                VerticalDivider(width: 5),
                                Expanded(
                                  child: SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.05,
                                      width: double.infinity,
                                      child: TextFormField(
                                        validator: (value) {
                                          if (value!.isEmpty) {}
                                          return null;
                                        },
                                        keyboardType: TextInputType.name,
                                        onSaved: (input) {},
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
                                    });
                                    put_register_form(_provider_registerForm,
                                        widget.id.toString());
                                  }
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
