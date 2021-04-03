part of 'device_info_bloc.dart';

abstract class DeviceInfoState extends Equatable {
  const DeviceInfoState();

  @override
  List<Object> get props => [];
}

class DeviceInfoInitial extends DeviceInfoState {}

class DeviceInfoLoadingState extends DeviceInfoState {
  const DeviceInfoLoadingState();

  @override
  List<Object> get props => [];
}

class DeviceInfoLoadedState extends DeviceInfoState {
  const DeviceInfoLoadedState({required this.deviceInfo});
  final DeviceInfo deviceInfo;

  @override
  List<Object> get props => [deviceInfo];
}

class DeviceInfoErrorState extends DeviceInfoState {
  const DeviceInfoErrorState({required this.error});
  final Object error;
  @override
  List<Object> get props => [error];
}
