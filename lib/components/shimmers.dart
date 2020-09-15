import 'package:flutter/material.dart';
import 'package:pokedex_mobile/constants.dart';
import 'package:shimmer/shimmer.dart';

const kShimmerBaseColor = Color(0x1FBBBBBB);
const kShimmerHighlightColor = Color(0x3FBBBBBB);
const kShimmerTextBaseColor = Color(0xFFCCCCCC);
const kShimmerTextHighlightColor = Color(0x3FBBBBBB);

class ShimmerContainer extends StatelessWidget {
  final double blockWidth;
  final double blockHeight;
  final double borderRadius;

  ShimmerContainer({
    this.blockWidth,
    this.blockHeight,
    this.borderRadius = 5,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: kShimmerBaseColor,
      highlightColor: kShimmerHighlightColor,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        width: blockWidth,
        height: blockHeight,
      ),
    );
  }
}

class ShimmerListView extends StatelessWidget {
  final int itemCount;

  ShimmerListView({
    this.itemCount = 5,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: kBouncingAlwaysScrollableScrollPhysics,
      itemBuilder: (context, index) {
        return ShimmerListTile();
      },
      separatorBuilder: (context, index) {
        return Divider();
      },
      itemCount: itemCount,
    );
  }
}

class ShimmerListTile extends StatelessWidget {
  final Widget title;
  final int index;

  const ShimmerListTile({
    Key key,
    this.title,
    this.index = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: kShimmerBaseColor,
      highlightColor: kShimmerHighlightColor,
      child: ListTile(
        title: Text(
          'Title for this ListTile',
          maxLines: 1,
          overflow: TextOverflow.fade,
          textWidthBasis: TextWidthBasis.longestLine,
          style: TextStyle(backgroundColor: Colors.white),
        ),
        subtitle: Text(
          'Subtitle for this ListTile',
          maxLines: 1,
          overflow: TextOverflow.fade,
          textWidthBasis: TextWidthBasis.longestLine,
          style: TextStyle(backgroundColor: Colors.white),
        ),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            kIconArrowForward,
          ],
        ),
      ),
    );
  }
}
