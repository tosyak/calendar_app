import 'package:calendar_app/core/localization/app_localizations_extension.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class DateRangePickerWidget extends StatefulWidget {
  const DateRangePickerWidget({super.key});

  @override
  State<DateRangePickerWidget> createState() => _DateRangePickerWidgetState();
}

class _DateRangePickerWidgetState extends State<DateRangePickerWidget> {
  final DateRangePickerController controller = DateRangePickerController();
  DateTime? _startDate;
  DateTime? _endDate;
  String? _errorMessage; 

  void _onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
    if (args.value is PickerDateRange) {
      final range = args.value as PickerDateRange;
      setState(() {
        _startDate = range.startDate;
        _endDate = range.endDate;
        _errorMessage = null; 
      });
    }
  }

  void _validateAndSubmit() {
    if (_startDate != null && _endDate != null) {
      final difference = _endDate!.difference(_startDate!).inDays;

      if (difference < 7) {
        setState(() {
          _errorMessage = "The date range should not be less 7 days.";
        });
        return;
      }
    }

    Navigator.pop(context, {'startDate': _startDate, 'endDate': _endDate});
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(context.translate('select-date')),
      content: SizedBox(
        width: double.maxFinite,
        child: Column(
          mainAxisSize: MainAxisSize.min, 
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.4,
              child: SfDateRangePicker(
                controller: controller,
                selectionMode: DateRangePickerSelectionMode.range,
                onSelectionChanged: _onSelectionChanged,
              ),
            ),
            if (_errorMessage != null)
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  _errorMessage!,
                  style: const TextStyle(color: Colors.red, fontSize: 14),
                ),
              ),
          ],
        ),
      ),
      actions: [
        TextButton(onPressed: _validateAndSubmit, child: const Text('OK')),
      ],
    );
  }
}
