import 'package:flutter/material.dart';

class BaseAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Text? title;
  final AppBar appBar;
  final List<Widget> widgets;

  BaseAppBar(
      {Key? key, this.title, required this.appBar, required this.widgets})
      : super(key: key);

  var defaultTitle =
      Image.asset('assets/images/logocc.png', height: 50, width: 50);

  @override
  Widget build(BuildContext context) {
    return AppBar(
        centerTitle: true,
        title: title ?? defaultTitle,
        elevation: 0,
        shape: Border(
            bottom: BorderSide(
                color: Theme.of(context).colorScheme.onBackground, width: 1)),
        backgroundColor: Theme.of(context).colorScheme.background,
        actions: widgets,
        actionsIconTheme:
            IconThemeData(color: Theme.of(context).colorScheme.primary),
        iconTheme: IconThemeData(color: Theme.of(context).colorScheme.primary));
  }

  @override
  Size get preferredSize => new Size.fromHeight(appBar.preferredSize.height);
}
