import 'package:flutter/material.dart';
import 'package:hijri_picker/hijri_picker.dart';
import 'package:salamapp/theme/colors.dart';
import 'package:table_calendar/table_calendar.dart';

class HijriCalendar extends StatefulWidget {
  const HijriCalendar({Key? key}) : super(key: key);

  @override
  State<HijriCalendar> createState() => _HijriCalendarState();
}

class _HijriCalendarState extends State<HijriCalendar> {
  DateTime today = DateTime.now();
  void _onDaySelected(DateTime day, DateTime focusedDay) {
    setState(() {
      today = day;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Zwhite,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Zwhite,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back_rounded,
            color: Zred,
          ),
        ),
        title: Text(
          "Calendar",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: Zblack.withOpacity(0.5),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Zgrey,
                borderRadius: BorderRadius.circular(10),
              ),
              child: TableCalendar(
                calendarStyle: CalendarStyle(
                  outsideTextStyle: TextStyle(
                    color: Zred.withOpacity(0.5),
                  ),
                  defaultTextStyle: const TextStyle(color: Zblack),
                ),
                daysOfWeekStyle: DaysOfWeekStyle(
                  weekdayStyle: const TextStyle(color: Zblack),
                  weekendStyle: TextStyle(
                    color: Zblack.withOpacity(0.3),
                  ),
                ),
                headerStyle: HeaderStyle(
                  leftChevronIcon: const Icon(
                    Icons.chevron_left_outlined,
                    color: Zred,
                  ),
                  rightChevronIcon: const Icon(
                    Icons.chevron_right_outlined,
                    color: Zred,
                  ),
                  titleTextStyle:
                      const TextStyle(color: Zred, fontWeight: FontWeight.w600),
                  formatButtonTextStyle: const TextStyle(color: Zblack),
                  formatButtonDecoration: BoxDecoration(
                    color: Zgrey,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                focusedDay: today,
                firstDay: DateTime.utc(2010, 10, 16),
                lastDay: DateTime.utc(2030, 3, 14),
                onDaySelected: _onDaySelected,
                selectedDayPredicate: (day) => isSameDay(day, today),
              ),
            ),
            const SizedBox(height: 10),
            Container(
              height: 50,
              width: 250,
              decoration: BoxDecoration(
                color: Zgrey,
                borderRadius: BorderRadius.circular(10),
              ),
              alignment: Alignment.center,
              child: Text(
                // ignore: prefer_interpolation_to_compose_strings
                "Selected Day " + today.toString().split(" ")[0],
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Zblack,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
