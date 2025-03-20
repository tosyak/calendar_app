import 'package:calendar_app/core/app_router/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

enum ErrorType { warning, error, info }

class ErrorDialog extends StatelessWidget {
  const ErrorDialog({
    super.key,
    required this.errorDescription,
    this.subTitle,
    this.onTap,
    this.onCancelTap,
    this.hasButton = true,
    this.hasCancelButton = false,
    this.errorButtonLabel,
    this.cancelButtonLabel,
    this.backgroundColor,
    this.popOnButtonTap = true,
    this.errorType = ErrorType.error,
  });

  final String errorDescription;
  final String? subTitle;
  final VoidCallback? onTap;
  final VoidCallback? onCancelTap;
  final String? errorButtonLabel;
  final String? cancelButtonLabel;
  final Color? backgroundColor;
  final bool popOnButtonTap;
  final bool hasButton;
  final bool hasCancelButton;
  final ErrorType errorType;

  @override
  Widget build(BuildContext context) {
    final Color containerColor =
        errorType == ErrorType.error
            ? Theme.of(context).primaryColorLight
            : Colors.yellow;

    return Material(
      type: MaterialType.transparency,
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40.r),
            color: backgroundColor ?? Theme.of(context).canvasColor,
          ),
          padding: const EdgeInsets.all(20),
          margin: EdgeInsets.only(bottom: 40.h),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              errorType == ErrorType.info
                  ? const Icon(Icons.info)
                  : Icon(
                    size: 42.r,
                    errorType == ErrorType.error
                        ? Icons.cancel
                        : errorType == ErrorType.warning
                        ? Icons.warning_rounded
                        : Icons.info,
                    color: containerColor,
                  ),
              24.verticalSpace,
              Text(errorDescription, textAlign: TextAlign.center),
              if (subTitle != null) ...[
                12.h.verticalSpace,
                Text(subTitle!, textAlign: TextAlign.center),
              ],
              SizedBox(height: 30.h),
              if (hasButton)
                Row(
                  children: [
                    if (hasCancelButton) ...[
                      Expanded(
                        child: ElevatedButton(
                          onPressed: onCancelTap,
                          child: const Text('Back'),
                        ),
                      ),
                      12.w.horizontalSpace,
                    ],
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          if (popOnButtonTap) router.maybePop();
                          onTap?.call();
                        },
                        child: const Text('Back'),
                      ),
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
