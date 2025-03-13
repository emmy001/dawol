import 'package:flutter/material.dart';

class Calendar extends StatelessWidget {
  final int selectedDate;

  const Calendar({super.key, required this.selectedDate}); // Mark as required

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 375,
          padding: const EdgeInsets.all(24),
          decoration: const BoxDecoration(color: Colors.white),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildWeekDays(),
              const SizedBox(height: 24),
              _buildCalendarGrid(),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildWeekDays() {
    const List<String> days = ['SUN', 'MON', 'TUE', 'WED', 'THU', 'FRI', 'SAT'];
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: days.map((day) => _buildDayLabel(day)).toList(),
    );
  }

  Widget _buildDayLabel(String day) {
    return Text(
      day,
      style: const TextStyle(
        color: Color(0xFF9F9D9D),
        fontSize: 14,
        fontFamily: 'Inter',
        fontWeight: FontWeight.w400,
        height: 1.50,
      ),
    );
  }

  Widget _buildCalendarGrid() {
    const List<List<int>> gridData = [
      [0, 0, 1, 2, 3, 4, 5],
      [6, 7, 8, 9, 10, 11, 12],
      [13, 14, 15, 16, 17, 18, 19],
      [20, 21, 22, 23, 24, 25, 26],
      [27, 28, 29, 30, 31, 0, 0],
    ];

    return Column(
      children:
          gridData
              .map(
                (week) => Padding(
                  padding: const EdgeInsets.only(bottom: 12.5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: week.map((day) => _buildDayCell(day)).toList(),
                  ),
                ),
              )
              .toList(),
    );
  }

  Widget _buildDayCell(int day) {
    const Color defaultColor = Color(0xFFEEEEEE);
    const Color highlightedColor = Color(0xFF2FE7DC);

    bool isFaded = day == 0;
    bool isHighlighted = day == selectedDate;

    return Opacity(
      opacity: isFaded ? 0.44 : 1.0,
      child: Container(
        width: 36,
        height: 36,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: isHighlighted ? highlightedColor : defaultColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child:
            day != 0
                ? Text(
                  '$day',
                  style: TextStyle(
                    color:
                        isHighlighted
                            ? Colors.white
                            : const Color.fromARGB(255, 52, 52, 52),
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                )
                : const SizedBox.shrink(),
      ),
    );
  }
}
