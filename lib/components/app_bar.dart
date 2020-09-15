import 'package:flutter/material.dart';

class PokedexAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget title;
  final List<Widget> actions;
  final bool showBottomDivider;
  final bool isTransparent;

  @override
  final Size preferredSize;

  PokedexAppBar({
    Key key,
    this.title,
    this.showBottomDivider = true,
    this.actions,
    this.isTransparent = false,
  })  : preferredSize =
            Size.fromHeight(kToolbarHeight + (showBottomDivider ? 1 : 0.0)),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    Color backgroundColor;
    if (isTransparent) {
      backgroundColor = Colors.transparent;
    } else if (Theme.of(context).brightness == Brightness.light) {
      backgroundColor = Theme.of(context).cardColor;
    }

    return AppBar(
      title: title,
      centerTitle: false,
      actions: actions,
      bottom: showBottomDivider ? _AppBarBottomDivider() : null,
      elevation: 0,
      textTheme: Theme.of(context).textTheme,
      iconTheme: Theme.of(context).iconTheme,
      actionsIconTheme: Theme.of(context).iconTheme,
      brightness: Theme.of(context).brightness,
      backgroundColor: backgroundColor,
    );
  }
}

class _AppBarBottomDivider extends StatelessWidget
    implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 1,
      child: Divider(thickness: 1, height: 1),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(1);
}
