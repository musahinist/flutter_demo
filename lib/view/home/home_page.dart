import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../device_info/device_info_page.dart';
import '../flowing_text/flowing_text_page.dart';
import '../redit_clone/reddit_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  static const String $PATH = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Demo'),
      ),
      body: ListView(
        children: [
          ListTile(
            title: const Text('Device Info'),
            subtitle: const Text('Android implemantation only'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              Get.toNamed(DeviceInfoPage.$PATH);
            },
          ),
          const Divider(),
          ListTile(
            title: const Text('Reddit Clone'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              Get.toNamed(RedditPage.$PATH);
            },
          ),
          const Divider(),
          ListTile(
            title: const Text('Flowing Text'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              Get.toNamed(FlowingTextPage.$PATH);
            },
          )
        ],
      ),
    );
  }
}
