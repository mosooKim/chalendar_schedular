import 'package:flutter/material.dart';
import 'package:table_chalendar/component/calendar.dart';
import 'package:table_chalendar/component/custom_text_field.dart';
import 'package:table_chalendar/component/schedule_bottom_sheet.dart';
import 'package:table_chalendar/component/schedule_card.dart';
import 'package:table_chalendar/component/today_banner.dart';
import 'package:table_chalendar/const/color.dart';
import 'package:table_chalendar/model/scheduleTable.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DateTime selectedDay = DateTime.utc(
    DateTime.now().year,
    DateTime.now().month,
    DateTime.now().day,
  );

/*  Map<DateTime, List<Schedule>> schedules = {
    DateTime.utc(2024, 7, 24): [
      Schedule(
        id: 1,
        startTime: 11,
        endTime: 12,
        content: '플러터 공부하기',
        date: DateTime.utc(2024, 7, 24),
        color: categoryColors[0],
        createdAt: DateTime.now().toUtc(),
      ),
      Schedule(
        id: 2,
        startTime: 14,
        endTime: 16,
        content: 'dart 공부하기',
        date: DateTime.utc(2024, 7, 24),
        color: categoryColors[3],
        createdAt: DateTime.now().toUtc(),
      ),
    ],
  };*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          /*final schedule = await showModalBottomSheet<Schedule>(
            context: context,
            builder: (_) {
              return ScheduleBottomSheet(
                selectedDay: selectedDay,
              );
            },
          );

          if(schedule == null) {
            return;
          }

          /// 첫번째 방법
          setState(() {
            schedules = {
              ...schedules,
              schedule.date: [
                if(schedules.containsKey(schedule.date)) ...schedules[schedule.date]!,
                schedule,
              ]
            };
          });*/

          /// 두번째 방법
/*          final dateExists = schedules.containsKey(schedule.date);

          final List<Schedule> existingSchedules =
              dateExists ? schedules[schedule.date]! : [];

          existingSchedules!.add(schedule);

          setState(() {
            schedules = {
              ...schedules,
              schedule.date: existingSchedules,
            };
          });*/
        },
        backgroundColor: primaryColor,
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Calendar(
              focusedDay: DateTime.now(),
              onDaySelected: onDaySelected,
              selectedDayPredicate: selectedDayPredicate,
            ),
            TodayBanner(
              selectedDay: selectedDay,
              taskCount: 0,
            ),
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
                child: ListView.separated(
                  itemCount: 0,
                  itemBuilder: (BuildContext context, int index) {
                    /// 선택된 날짜에 해당되는 일정 리스트로 저장
                    /// List<Schedule>
                    /*final selectedSchedules = schedules[selectedDay]!;
                    final scheduleModel = selectedSchedules[index];*/

                    return ScheduleCard(
                      startTime: 12,
                      endTime: 15,
                      content: 'testtttt',
                      color: Color(
                        int.parse(
                          'FF000000',
                          radix: 16,
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(height: 8.0);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    setState(() {
      this.selectedDay = selectedDay;
    });
  }

  bool selectedDayPredicate(DateTime date) {
    if (selectedDay == null) {
      return false;
    }

    return date.isAtSameMomentAs(selectedDay!);
  }
}
