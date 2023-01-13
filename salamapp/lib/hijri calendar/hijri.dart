import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
      backgroundColor: Kblack,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Kblack,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: SvgPicture.asset(
              'assets/icons/back.svg',
              color: Kred,
              height: 18,
              width: 18,
              fit: BoxFit.scaleDown,
            ),
          ),
        ),
        title: Text(
          "Calendar",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: Kwhite.withOpacity(0.3),
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
                color: Kwhite.withOpacity(0.03),
                borderRadius: BorderRadius.circular(10),
              ),
              child: TableCalendar(
                calendarStyle: CalendarStyle(
                  outsideTextStyle: TextStyle(
                    color: Kred.withOpacity(0.5),
                  ),
                  defaultTextStyle: TextStyle(color: Kwhite),
                ),
                daysOfWeekStyle: DaysOfWeekStyle(
                  weekdayStyle: TextStyle(color: Kwhite),
                  weekendStyle: TextStyle(
                    color: Kwhite.withOpacity(0.3),
                  ),
                ),
                headerStyle: HeaderStyle(
                  leftChevronIcon: Icon(
                    Icons.chevron_left_outlined,
                    color: Kred,
                  ),
                  rightChevronIcon: Icon(
                    Icons.chevron_right_outlined,
                    color: Kred,
                  ),
                  titleTextStyle:
                      TextStyle(color: Kred, fontWeight: FontWeight.w600),
                  formatButtonTextStyle: TextStyle(color: Kwhite),
                  formatButtonDecoration: BoxDecoration(
                    color: Kred,
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
            SizedBox(height: 10),
            Container(
              height: 50,
              width: 250,
              decoration: BoxDecoration(
                color: Kwhite.withOpacity(0.03),
                borderRadius: BorderRadius.circular(10),
              ),
              alignment: Alignment.center,
              child: Text(
                "Selected Day " + today.toString().split(" ")[0],
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Kwhite,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
