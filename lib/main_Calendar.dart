import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:huangjui/Etc/color_for_app.dart';
import 'package:huangjui/daily_info_page.dart';
import 'package:huangjui/profile.dart';
import 'package:intl/intl.dart';
import 'package:page_transition/page_transition.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class Main_Calendar extends StatefulWidget {
  String? name;
  String? ipic;
  Main_Calendar({Key? key, this.name, this.ipic}) : super(key: key);

  @override
  State<Main_Calendar> createState() => _Main_CalendarState();
}

class _Main_CalendarState extends State<Main_Calendar> {
  String _selectedDate = '';
  String _dateCount = '';
  String _range = '';
  String _rangeCount = '';

  void _onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Info_Page(),
      ),
    );
    print(args.value.toString());
    setState(() {
      if (args.value is PickerDateRange) {
        _range = '${DateFormat('dd/MM/yyyy').format(args.value.startDate)} -'
            ' ${DateFormat('dd/MM/yyyy').format(args.value.endDate ?? args.value.startDate)}';
      } else if (args.value is DateTime) {
        _selectedDate = args.value.toString();
      } else if (args.value is List<DateTime>) {
        _dateCount = args.value.length.toString();
      } else {
        _rangeCount = args.value.length.toString();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(' '),
            const Text(
              'ปฏิทินฮวงจุ้ย',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                  color: Color.fromARGB(255, 215, 190, 138)),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  PageTransition(
                    duration: Duration(milliseconds: 500),
                    type: PageTransitionType.rightToLeft,
                    child: Profile(
                      name: widget.name,
                      ipic: widget.ipic,
                    ),
                  ),
                );
              },
              child: CircleAvatar(
                radius: 15,
                child: Icon(
                  Icons.person,
                  color: theRed,
                ),
                backgroundColor: const Color.fromARGB(255, 255, 253, 237),
              ),
            ),
          ],
        ),
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarIconBrightness: Brightness.light,
            statusBarBrightness: Brightness.light,
            statusBarColor: theRed),
        backgroundColor: theRed,
      ),
      body: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const Info_Page(),
            ),
          );
        },
        child: Stack(
          children: <Widget>[
            Image.asset('assets/images/background_half.jpg',
                width: MediaQuery.of(context).size.width * 1,
                height: MediaQuery.of(context).size.height * 1,
                fit: BoxFit.fill),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 25,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: const Color.fromARGB(255, 232, 229, 229)),
                          color: const Color.fromARGB(255, 232, 229, 229),
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(15),
                              topRight: Radius.circular(15))),
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Container(
                                  height: 70,
                                  width: 70,
                                  decoration: BoxDecoration(
                                    border: Border.all(color: theRed, width: 2),
                                    color: Colors.white,
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                        image: NetworkImage(
                                            widget.ipic.toString()),
                                        // AssetImage(
                                        //   'assets/images/for Mock Up Only/kurt.jpeg',
                                        // ),
                                        fit: BoxFit.cover),
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      widget.name.toString(),
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Container(
                                        child: Padding(
                                          padding: const EdgeInsets.all(5.0),
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              SvgPicture.asset(
                                                'assets/images/crown.svg',
                                                height: 8,
                                              ),
                                              const SizedBox(
                                                width: 3,
                                              ),
                                              const Text(
                                                'Premium Member',
                                                style: TextStyle(
                                                    color: Color.fromARGB(
                                                        255, 143, 97, 1)),
                                              ),
                                            ],
                                          ),
                                        ),
                                        decoration: const BoxDecoration(
                                            color: Color.fromARGB(
                                                255, 255, 221, 99),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(5)))),
                                  ],
                                ),
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SvgPicture.asset(
                                  'assets/images/zodiac & elements/fire.svg',
                                  height: 40,
                                ),
                                const SizedBox(
                                  height: 3,
                                ),
                                const Text(
                                  'ธาตุไฟ +',
                                  style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold,
                                      color: Color.fromARGB(255, 235, 87, 87)),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 243, 243, 243),
                          borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(15),
                              bottomLeft: Radius.circular(15))),
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: Column(
                          children: [
                            SfDateRangePicker(
                              headerStyle: const DateRangePickerHeaderStyle(
                                  textAlign: TextAlign.center,
                                  textStyle: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold,
                                      color: Color.fromARGB(255, 34, 43, 69))),
                              selectionShape:
                                  DateRangePickerSelectionShape.rectangle,
                              allowViewNavigation: true,
                              selectionTextStyle: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                              monthViewSettings:
                                  const DateRangePickerMonthViewSettings(
                                      viewHeaderStyle:
                                          DateRangePickerViewHeaderStyle(
                                              textStyle: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 143, 155, 179),
                                fontFamily: 'Kanit',
                              ))),
                              monthCellStyle:
                                  const DateRangePickerMonthCellStyle(
                                      textStyle: TextStyle(
                                          fontFamily: 'Kanit',
                                          color:
                                              Color.fromARGB(255, 34, 43, 69),
                                          fontWeight: FontWeight.bold)),
                              backgroundColor:
                                  const Color.fromARGB(255, 243, 243, 243),
                              todayHighlightColor: Palette.thisRed,
                              selectionColor: Palette.thisRed,
                              selectionMode:
                                  DateRangePickerSelectionMode.single,
                              view: DateRangePickerView.month,
                              
                              onSelectionChanged: _onSelectionChanged,
                              initialSelectedRange: PickerDateRange(
                                  DateTime.now()
                                      .subtract(const Duration(days: 4)),
                                  DateTime.now().add(const Duration(days: 3))),
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  elevation: 0,
                                  primary: Palette.thisRed,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  )),
                              onPressed: () {
                                // Navigator.push(
                                //   context,
                                //   MaterialPageRoute(
                                //     builder: (context) => Compass_Page(),
                                //   ),
                                // );
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Container(
                                    width: double.infinity,
                                    alignment: Alignment.center,
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        SvgPicture.asset(
                                            'assets/images/compass.svg'),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        const Text(
                                          "ดูเข็มทิศ",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 15),
                                        ),
                                      ],
                                    )),
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
