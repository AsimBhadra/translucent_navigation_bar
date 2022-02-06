
Translucent navigation bar with Glassmorphism effect
## Getting Started

To install, add it to your `pubspec.yaml` file:

```
dependencies:
    translucent_navigation_bar:

```

```dart
import 'package:translucent_navigation_bar/src/translucent_navigation_bar_item.dart';
```

# Make sure extentBody in your Scaffold is set to true
          extendBody: true,

## If you want to have a main icon make sure the number of items is even so that main icon is in the center

## Basic Implementation

```dart
return Scaffold(
      extendBody: true,
      bottomNavigationBar: TranslucentNavigationBar(
        mainTranslucentNavigationBarItem: TranslucentNavigationBarItem(
          iconData: PhosphorIcons.plus,
        ),
        onTap: (value) {
          setState(() {
            selectedIndex = value;
          });
          _pageController.animateToPage(
            selectedIndex,
            duration: const Duration(milliseconds:750),
            curve: Curves.bounceIn,
          );
        },
        onMainIconTap: () {
          showDialog(
            context: context,
            builder: (context) => const AlertDialog(
              title: Text('Main Icon pressed'),
            ),
          );
        },
        selectedIndex: selectedIndex,
        mainIconBackgroundColor: const Color(0xff0066ff),
        mainIconColor: Colors.white,
        items: [
          TranslucentNavigationBarItem(
            iconData: PhosphorIcons.houseSimple,
          ),
          TranslucentNavigationBarItem(
            iconData: PhosphorIcons.chat,
          ),
          ),
        ],
      ),
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: _pageController,
        children: [

        ],
      ),
    );
```

## The constructor has these attributes related to the Widget:

- `items`: A list of tabs to display which must be list of `TranslucentNavigationBarItem`
- `height`: Height of the AppBar `(default: 75.0)`
- `width`: Width of the AppBar `(default: double.infinity)`
- `borderRadius`: Border radius of the AppBar `(default: 40.0)`
- `blur`: Blur extent of AppBar `(default: 20.0)`
- `verticalPadding`: Padding on the top and bottom of AppBar `(default: 25.0)`
- `horizontalPadding`: Padding on the left and right sides of AppBar `(default: 20.0)`
- `onTap`: Returns the index of the tab that was tapped
- `selectedIndex`: The tab to display.
- `selectedColor`: The color of the icon when the item is   selected.
- `unselectedColor`: The color of the icon when the item is   unselected.
- `mainTranslucentNavigationBarItem`: Main icon of TranslucentNavigationBar must be `TranslucentNavigationBarItem`
- `mainIconBackgroundColor`: Main icon background color in middle of AppBar
- `mainIconColor`: Main icon  color in middle of AppBar

- `onMainIconTap`: Main icon function on tap
