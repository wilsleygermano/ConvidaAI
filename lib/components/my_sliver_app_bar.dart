import 'package:flutter/material.dart';

class MySliverAppBar extends StatefulWidget {
  const MySliverAppBar({Key? key}) : super(key: key);

  @override
  State<MySliverAppBar> createState() => _MySliverAppBarState();
}

class _MySliverAppBarState extends State<MySliverAppBar> {
  final bool _pinned = true;
  final bool _snap = true;
  final bool _floating = true;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      leading: IconButton(
        iconSize: 32,
        onPressed: () {},
        icon: Icon(Icons.menu),
        color: Theme.of(context).appBarTheme.iconTheme!.color,
      ),
      actions: [
        IconButton(
          iconSize: 32,
          onPressed: () {},
          icon: Icon(Icons.add),
          color: Theme.of(context).appBarTheme.iconTheme!.color,
        ),
      ],
      stretch: true,
      pinned: _pinned,
      floating: _floating,
      snap: _snap,
      expandedHeight: 150,
      iconTheme: Theme.of(context).appBarTheme.iconTheme,
      backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      actionsIconTheme: Theme.of(context).appBarTheme.iconTheme,
      // ignore: prefer_const_constructors
      flexibleSpace: FlexibleSpaceBar(
        titlePadding: const EdgeInsets.only(top: 26),
        title: const Padding(
          padding: EdgeInsets.only(
            top: 8,
            left: 8,
            right: 8,
          ),
          child: Image(
            fit: BoxFit.fill,
            image: AssetImage(
              'lib/assets/convida_logo.png',
            ),
          ),
        ),
        centerTitle: true,
      ),
    );
  }
}
