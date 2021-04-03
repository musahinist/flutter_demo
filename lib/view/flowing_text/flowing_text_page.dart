import 'package:flutter/material.dart';

class FlowingTextPage extends StatefulWidget {
  const FlowingTextPage({Key? key}) : super(key: key);
  static const String $PATH = '/flowingText';

  @override
  _FlowingTextPageState createState() => _FlowingTextPageState();
}

class _FlowingTextPageState extends State<FlowingTextPage>
    with SingleTickerProviderStateMixin {
  final ScrollController _scrollController = ScrollController();
  bool scroll = false;
  int speedFactor = 500;
  bool isScrollEnd = false;

  void _scroll() {
    final double minExtent = _scrollController.position.minScrollExtent;
    final double maxExtent = _scrollController.position.maxScrollExtent;
    final double distanceDifferenceBottom =
        (maxExtent - _scrollController.offset).abs();
    final double distanceDifferenceTop =
        (_scrollController.offset - minExtent).abs();
    final double durationDown = distanceDifferenceBottom / speedFactor;
    final double durationUp = distanceDifferenceTop / speedFactor;

    _scrollController.animateTo(isScrollEnd ? minExtent : maxExtent,
        duration: Duration(
            seconds: isScrollEnd
                ? durationUp.ceil().toInt()
                : durationDown.ceil().toInt()),
        curve: Curves.linear);
  }

  void _toggleScrolling() {
    setState(() {
      scroll = !scroll;
    });

    if (scroll) {
      _scroll();
    } else {
      _scrollController.animateTo(_scrollController.offset,
          duration: const Duration(seconds: 1), curve: Curves.linear);
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flowing Text'),
      ),
      body: NotificationListener(
        onNotification: (notif) {
          if (notif is ScrollEndNotification && scroll) {
            isScrollEnd = !isScrollEnd;
            scroll = !scroll;
            setState(() {});
          }

          return true;
        },
        child: SingleChildScrollView(
            controller: _scrollController,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(text),
            )),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _toggleScrolling,
        child:
            Icon(isScrollEnd ? Icons.arrow_circle_up : Icons.arrow_circle_down),
      ),
    );
  }

  String text = """
Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.""";
}
