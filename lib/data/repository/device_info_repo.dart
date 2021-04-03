import 'package:flutter/services.dart';

import '../model/device_info.dart';

class DeviceInfoRepo {
  MethodChannel platform = const MethodChannel('deviceInfo');

  Future<DeviceInfo> getDeviceInfo() async {
    try {
      final Map<dynamic, dynamic> result =
          await platform.invokeMethod('getDeviceInfo');
      return DeviceInfo.fromMap(result);
    } on PlatformException catch (e) {
      throw e;
    }
  }
}
