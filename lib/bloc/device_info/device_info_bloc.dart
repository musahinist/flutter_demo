import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../data/model/device_info.dart';
import '../../data/repository/device_info_repo.dart';

part 'device_info_event.dart';
part 'device_info_state.dart';

class DeviceInfoBloc extends Bloc<DeviceInfoEvent, DeviceInfoState> {
  DeviceInfoBloc() : super(DeviceInfoInitial());
  DeviceInfoRepo deviceInfoRepo = DeviceInfoRepo();
  @override
  Stream<DeviceInfoState> mapEventToState(
    DeviceInfoEvent event,
  ) async* {
    if (event is DeviceInfoRequestEvent) {
      yield const DeviceInfoLoadingState();
      try {
        final deviceInfo = await deviceInfoRepo.getDeviceInfo();
        yield DeviceInfoLoadedState(deviceInfo: deviceInfo);
      } catch (e) {
        yield DeviceInfoErrorState(error: e);
      }
    }
  }
}
