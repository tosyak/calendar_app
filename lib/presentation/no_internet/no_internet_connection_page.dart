import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class NoInternetConnectionPage extends StatefulWidget {
  const NoInternetConnectionPage({super.key, required this.onRecheckTapped});

  final VoidCallback onRecheckTapped;

  @override
  State<NoInternetConnectionPage> createState() =>
      _NoInternetConnectionPageState();
}

class _NoInternetConnectionPageState extends State<NoInternetConnectionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Spacer(),
            Lottie.asset('assets/wifi.json', fit: BoxFit.cover),
            const Spacer(),
            ElevatedButton(
              onPressed: () {
                widget.onRecheckTapped();
              },
              child: const Text('Recheck'),
            ),
            SizedBox(height: 24.h),
          ],
        ),
      ),
    );
  }
}
