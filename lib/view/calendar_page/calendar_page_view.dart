import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:syncfusion_flutter_calendar/calendar.dart';

import '../../configuration/DataSource.dart';


class CalendarCart extends StatelessWidget {
  DateTime dateDepart;
  String Labelle;

  CalendarCart({
    Key? key,
    required this.dateDepart, required this.Labelle
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
        title: Text("مدة الرحلة"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color.fromARGB(255, 0, 0, 0)),
          onPressed: () => Navigator.pop(context),
        ),
      ),
        body: SfCalendar(
          view: CalendarView.month,
          dataSource: _getCalendarDataSource(),
          monthViewSettings: const MonthViewSettings(
              appointmentDisplayMode: MonthAppointmentDisplayMode.appointment),
        ));
  }

//
  DataSource _getCalendarDataSource() {
    List<Appointment> appointments = <Appointment>[];
    appointments.add(Appointment(
      startTime: DateTime(dateDepart.year, dateDepart.month,
        dateDepart.day, 9, 0, 0),
      endTime: dateDepart.add(Duration(days: 15)),
      isAllDay: true,
      subject: Labelle,
      color: Colors.blue,
      startTimeZone: '',
      endTimeZone: '',
    ));

    return DataSource(appointments);
  }
}
