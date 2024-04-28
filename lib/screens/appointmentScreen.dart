import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pawfect/utils/constants.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pawfect/database/database.dart';

late User loggedInUser;
late String finaldate;
late String finaltime;

class Appointment extends StatefulWidget {
  const Appointment({super.key});

  @override
  State<Appointment> createState() => _AppointmentState();
}

class _AppointmentState extends State<Appointment> {
  final _auth = FirebaseAuth.instance;

  void getCurrentUser() async {
    try {
      final user = await _auth.currentUser;
      if (user != null) {
        loggedInUser = user;
      }
    } catch (e) {
      print(e);
    }
  }

  void initState() {
    super.initState();

    getCurrentUser();
  }

  TimeOfDay selectedTime = TimeOfDay.now();
  late String title;
  late String petname;
  DateTime today = DateTime.now();
  void ondayselected(DateTime day, DateTime focusedDay) {
    setState(() {
      today = day;
      finaldate = today.toString().split(" ")[0];
      print(finaldate);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: yellow,
        title: Text(
          'Appointment',
          style: kText,
        ),
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Title",
                style: kText.copyWith(color: Colors.black, fontSize: 20),
                textAlign: TextAlign.start,
              ),
              TextField(
                onChanged: (value) {
                  title = value;
                },
                decoration: kTextFieldDecoration,
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                "Pet Name",
                style: kText.copyWith(color: Colors.black, fontSize: 20),
                textAlign: TextAlign.start,
              ),
              TextField(
                onChanged: (value) {
                  petname = value;
                },
                decoration: kTextFieldDecoration,
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                "Appointment Date = " + today.toString().split(" ")[0],
                style: kText.copyWith(color: Colors.black, fontSize: 20),
                textAlign: TextAlign.start,
              ),
              Container(
                child: TableCalendar(
                  headerStyle: HeaderStyle(
                      formatButtonVisible: false, titleCentered: true),
                  availableGestures: AvailableGestures.all,
                  focusedDay: today,
                  firstDay: DateTime.utc(2001, 1, 1),
                  lastDay: DateTime.utc(2060, 2, 6),
                  onDaySelected: ondayselected,
                  selectedDayPredicate: (day) => isSameDay(day, today),
                  calendarStyle: CalendarStyle(
                    selectedDecoration: BoxDecoration(
                      color: Color(0xFFFFCD00), // Selected date color
                      shape: BoxShape.circle,
                    ),
                    todayDecoration: BoxDecoration(
                      color: Color(0xFFFFCD00).withOpacity(
                          0.5), // Today date color with reduced opacity
                      shape: BoxShape.circle,
                    ),
                    selectedTextStyle: TextStyle(
                        color: Colors.black), // Change text color if needed
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                  "Appointment Time = ${selectedTime.hour.toString().padLeft(2, '0')}:${selectedTime.minute.toString().padLeft(2, '0')}",
                  style: kText.copyWith(color: Colors.black, fontSize: 20),
                  textAlign: TextAlign.start),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: yellow,
                    shape: RoundedRectangleBorder(
                        side: BorderSide(
                          strokeAlign: BorderSide.strokeAlignInside,
                          color: yellow,
                        ),
                        borderRadius: BorderRadius.circular(7)),
                    elevation: 8,
                    shadowColor: Colors.grey),
                child: Text(
                  "Choose Time",
                  style: kHeading.copyWith(color: Colors.white, fontSize: 17),
                  textAlign: TextAlign.center,
                ),
                onPressed: () async {
                  final TimeOfDay? timeOfDay = await showTimePicker(
                    context: context,
                    initialTime: selectedTime,
                    initialEntryMode: TimePickerEntryMode.dial,
                  );
                  if (timeOfDay != null) {
                    setState(() {
                      selectedTime = timeOfDay;
                      finaltime = timeOfDay.hour.toString() +
                          ":" +
                          timeOfDay.minute.toString();
                      print(finaltime);
                    });
                  }
                },
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: yellow,
                        shape: RoundedRectangleBorder(
                            side: BorderSide(
                              strokeAlign: BorderSide.strokeAlignInside,
                              color: yellow,
                            ),
                            borderRadius: BorderRadius.circular(7)),
                        elevation: 8,
                        shadowColor: Colors.grey),
                    onPressed: () {
                      AppointmentMethods().addappointmentDetails({
                        "email": loggedInUser.email,
                        "title": title,
                        "pet name": petname,
                        "appointment date": finaldate,
                        "appointment time": finaltime
                      });
                      Navigator.pop(context);
                    },
                    child: Text("Add", style: kText.copyWith(color: Colors.black, fontSize: 20),)
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}