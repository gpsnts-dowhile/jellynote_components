import 'package:flutter/material.dart';
import 'package:jellynotescomponents/utils/remove_glow_effect.dart';

class ListSeparatedComponent extends StatefulWidget {
  final List<dynamic> items;
  final double separatorWidth;
  final Function(BuildContext, int) itemBuilder;

  ListSeparatedComponent({
    this.items,
    this.separatorWidth,
    this.itemBuilder,
  }) : assert(items != null),
    assert(separatorWidth != null),
    assert(itemBuilder != null);

  @override
  _ListSeparatedComponentState createState() => _ListSeparatedComponentState();
}

class _ListSeparatedComponentState extends State<ListSeparatedComponent> {
  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: RemoveGlowBehavior(),
      child: ListView.separated(
        separatorBuilder: (BuildContext ctx, int i) {
          return SizedBox(
            width: widget.separatorWidth,
          );
        },
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: widget.items.length,
        itemBuilder: widget.itemBuilder,
      ),
    );
  }
}
