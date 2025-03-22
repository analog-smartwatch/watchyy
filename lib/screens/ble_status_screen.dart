import 'package:flutter/material.dart';
import 'package:flutter_reactive_ble/flutter_reactive_ble.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:watchyy/styles/utils.dart';
import 'package:watchyy/widgets/widgets.dart';

class BleStatusScreen extends StatefulWidget {
  const BleStatusScreen({
    super.key,
    required this.status,
  });

  final BleStatus status;

  @override
  State<BleStatusScreen> createState() => _BleStatusScreenState();
}

class _BleStatusScreenState extends State<BleStatusScreen> {
  @override
  void initState() {
    super.initState();
    _init();
  }

  Future<void> _init() async {
    if (isAndroid()) {
      await Permission.location.request();
      await Permission.bluetooth.request();
      await Permission.bluetoothScan.request();
      await Permission.bluetoothConnect.request();
    }
  }

  String determineText(BleStatus status) {
    switch (status) {
      case BleStatus.unsupported:
        return 'This device does not support Bluetooth';
      case BleStatus.unauthorized:
        return 'Authorize the app to use Bluetooth and location';
      case BleStatus.poweredOff:
        return 'Bluetooth is powered off on your device turn it on';
      case BleStatus.locationServicesDisabled:
        return 'Enable location services';
      case BleStatus.ready:
        return 'Bluetooth is up and running';
      default:
        return 'Waiting to fetch Bluetooth status $status';
    }
  }

  @override
  Widget build(BuildContext context) {
    return WAScaffold(
      bodyBuilder: (_, __) {
        return Center(
          child: Text(
            determineText(widget.status),
          ),
        );
      },
    );
  }
}
