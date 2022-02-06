library dot_navigation_bar;

export 'package:translucent_navigation_bar/src/translucent_navigation_bar_item.dart';
import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:translucent_navigation_bar/src/translucent_navigation_bar_item.dart';

class TranslucentNavigationBar extends StatelessWidget {
  const TranslucentNavigationBar({
    Key? key,
    required this.items,
    this.selectedColor = Colors.black,
    this.unselectedColor = Colors.black38,
    required this.selectedIndex,
    this.mainIconBackgroundColor = Colors.blue,
    this.mainIconColor = Colors.white,
    required this.onTap,
    this.onMainIconTap,
    this.height = 75.0,
    this.borderRadius = 40.0,
    this.blur = 20.0,
    this.mainTranslucentNavigationBarItem,
  }) : super(key: key);

  /// Height of the appbar
  final double height;

  /// Border radius of the appbar
  final double borderRadius;

  /// Blur extent of the appbar
  final double blur;

  /// List of TranslucentNavigationBarItems
  final List<TranslucentNavigationBarItem> items;

  /// Returns the index of the tab that was tapped.
  final Function(int)? onTap;

  /// The tab to display.
  final int selectedIndex;

  /// The color of the icon when the item is selected.
  final Color selectedColor;

  /// The color of the icon when the item is unselected.
  final Color unselectedColor;

  /// Main icon of TranslucentNavigationBar
  final TranslucentNavigationBarItem? mainTranslucentNavigationBarItem;

  /// Main icon background color in middle of appbar
  final Color mainIconBackgroundColor;

  /// Main icon icon color in middle of appbar
  final Color mainIconColor;

  /// Main icon function on tap
  final Function()? onMainIconTap;

  @override
  Widget build(BuildContext context) {
    double middleIndex = (items.length / 2).floorToDouble();
    List<TranslucentNavigationBarItem> updatedItems = [];
    updatedItems.addAll(items);
    if (mainTranslucentNavigationBarItem != null) {
      updatedItems.insert(
          middleIndex.toInt(), mainTranslucentNavigationBarItem!);
    }
    return BottomAppBar(
      elevation: 0,
      color: Colors.transparent,
      child: GlassmorphicContainer(
        borderRadius: borderRadius,
        blur: blur,
        alignment: Alignment.bottomCenter,
        border: 2,
        linearGradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.white.withOpacity(0.5),
              Colors.white.withOpacity(0.6),
            ],
            stops: const [
              0.1,
              1,
            ]),
        borderGradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Colors.transparent.withOpacity(0.0),
            Colors.transparent.withOpacity(0.0),
          ],
        ),
        margin: const EdgeInsets.symmetric(vertical: 25, horizontal: 20),
        height: height,
        width: double.infinity,
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              for (final item in updatedItems)
                updatedItems.indexOf(item) == middleIndex
                    ? GestureDetector(
                        onTap: onMainIconTap,
                        child: Container(
                          decoration: BoxDecoration(
                            color: mainIconBackgroundColor,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: mainIconBackgroundColor.withOpacity(0.3),
                                blurRadius: 5,
                                spreadRadius: 5,
                                offset: const Offset(0,3)
                              ),
                            ],
                          ),
                          padding: const EdgeInsets.all(12),
                          child: Icon(
                            item.iconData,
                            color: mainIconColor,
                          ),
                        ),
                      )
                    : InkWell(
                        onTap: () {
                          onTap!.call(items.indexOf(item));
                        },
                        child: Icon(
                          item.iconData,
                          color: items.indexOf(item) == selectedIndex
                              ? selectedColor
                              : unselectedColor,
                        ),
                      ),
            ],
          ),
        ),
      ),
    );
  }
}
