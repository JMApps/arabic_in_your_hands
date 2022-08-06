import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FirstVolumeContentFlipModePage extends StatelessWidget {
  const FirstVolumeContentFlipModePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        floatHeaderSlivers: true,
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            SliverAppBar(
              centerTitle: true,
              backgroundColor: const Color(0xFF243743),
              elevation: 0,
              floating: true,
              snap: false,
              forceElevated: innerBoxIsScrolled,
              expandedHeight: 50,
              title: const Text('Режим карточек'),
              actions: [
                IconButton(
                  icon: const Icon(CupertinoIcons.creditcard_fill),
                  onPressed: () {},
                ),
              ],
            ),
            SliverToBoxAdapter(
              child: Card(
                color: const Color(0xFF006D50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Container(
                  height: 150,
                  color: Colors.red[50],
                )
              ),
            ),
          ];
        },
        body: Container(
          color: Colors.green[50],
        ),
      ),
    );
  }
}
