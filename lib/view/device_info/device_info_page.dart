import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/device_info/device_info_bloc.dart';
import '../../data/model/device_info.dart';

class DeviceInfoPage extends StatelessWidget {
  const DeviceInfoPage({Key? key}) : super(key: key);
  static const String $PATH = '/deviceInfo';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Device Info'),
        ),
        body: BlocBuilder<DeviceInfoBloc, DeviceInfoState>(
          builder: (context, state) {
            if (state is DeviceInfoLoadedState) {
              final DeviceInfo info = state.deviceInfo;
              return ListView(
                children: [
                  ListTileWidget('id', info.id),
                  ListTileWidget('manufacturer', info.manufacturer),
                  ListTileWidget('model', info.model),
                  ListTileWidget('product', info.product),
                  ListTileWidget('tags', info.tags),
                  ListTileWidget('type', info.type),
                  ListTileWidget('board', info.board),
                  ListTileWidget('bootloader', info.bootloader),
                  ListTileWidget('brand', info.brand),
                  ListTileWidget('device', info.device),
                  ListTileWidget('display', info.display),
                  ListTileWidget('fingerPrint', info.fingerprint),
                  ListTileWidget('hardware', info.hardware),
                  ListTileWidget('host', info.host),
                ],
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ));
  }
}

class ListTileWidget extends StatelessWidget {
  const ListTileWidget(
    this.k,
    this.v, {
    Key? key,
  }) : super(key: key);

  final String k;
  final String v;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$k:',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(v),
          const Divider()
        ],
      ),
    );
  }
}
