import 'package:calendar_app/core/shared/themes/app_text_style.dart';
import 'package:calendar_app/domain/entities/event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EventDetailsView extends StatelessWidget {
  final Event event;
  const EventDetailsView({super.key, required this.event});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(event.eventName), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              event.date,
              style: AppTextStyles.getCustomFont.copyWith(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
            12.h.verticalSpace,
            Text(event.description),
          ],
        ),
      ),
    );
  }
}
