import 'dart:async';

import 'package:calendar_app/core/service_locator/service_locator.dart';
import 'package:calendar_app/presentation/no_internet/no_internet_connection_page.dart';
import 'package:calendar_app/presentation/splash/splash_screen.dart';
import 'package:calendar_app/presentation/widgets/error_dialog.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

class ConnectionChecker extends StatefulWidget {
  const ConnectionChecker({required this.child, super.key});

  final Widget child;

  @override
  State<ConnectionChecker> createState() => _ConnectionCheckerState();
}

class _ConnectionCheckerState extends State<ConnectionChecker> {
  final _connectivity = getIt<Connectivity>();
  late final StreamSubscription _sub;
  bool? _isOffline;

  Future<void> _init() async {
    _sub = _connectivity.onConnectivityChanged.listen((result) {
      if (result.contains(ConnectivityResult.none)) {
        Future.delayed(const Duration(seconds: 3), () async {
          final onlineResult = await _connectivity.checkConnectivity();
          if (onlineResult.contains(ConnectivityResult.none)) {
            if (_isOffline == null || !_isOffline!) {
              setState(() {
                _isOffline = true;
              });
            }
          } else {
            if (_isOffline ?? true) {
              setState(() {
                _isOffline = false;
              });
            }
          }
        });
      } else {
        if (_isOffline ?? true) {
          setState(() => _isOffline = false);
        }
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _init();
  }

  @override
  void dispose() {
    _sub.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: () async {
        if (_isOffline == null) {
          final result = await _connectivity.checkConnectivity();
          if (result.contains(ConnectivityResult.none)) {
            _isOffline = true;
          } else {
            _isOffline = false;
          }
        }

        return _isOffline;
      }(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return const SplashView();

        return _isOffline!
            ? NoInternetConnectionPage(
              onRecheckTapped: () async {
                final List<ConnectivityResult> result =
                    await _connectivity.checkConnectivity();
                if (!result.contains(ConnectivityResult.none)) {
                  if (_isOffline ?? true) {
                    setState(() {
                      _isOffline = false;
                    });
                  }
                } else {
                  if (!context.mounted) return;
                  showGeneralDialog(
                    context: context,
                    pageBuilder: (context, anim1, anim2) {
                      return const ErrorDialog(
                        errorDescription: 'nooo conection',
                      );
                    },
                  );
                }
              },
            )
            : widget.child;
      },
    );
  }
}
