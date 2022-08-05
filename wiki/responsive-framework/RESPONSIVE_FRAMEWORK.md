# Flutter Responsive Framework

The biggest appeal of Flutter is being able to create apps that can run on multiple devices with just a single codebase. With the stable release of Flutter for the web, the apps you create become even more accessible.

Even though the apps you create will run on all compatible devices, we are faced with the challenge of displaying the optimal UI on a huge variety of screen sizes. That is why it is more important than ever to make your apps responsive.

In this tutorial you will learn how to use the [Responsive Framework package](https://pub.dev/packages/responsive_framework) to easily make your app UI adjust to different screen sizes.

## Getting Started

**pubspec.yaml**

```yaml
dependencies:
  flutter:
    sdk: flutter
  responsive_framework: ^0.2.0
```

## Understanding Scaling vs. Resizing



#### Flutter Default Behavior (Resizing)

Flutter does try to a certain degree to adjust the UI to changes in screen size by resizing the widgets. Once the widgets reach their maximum possible size, they stay at that size no matter how large the screen gets.

You might think that the layout we have now doesn’t look too bad and can be shipped as is with the default resizing behavior. You might be right, as the UI is still usable, but just because something works doesn’t mean we can’t make it better.

#### Responsive Framework Difference (Scaling)

As discussed above, by default Flutter resizes the widgets on the screen. While this is nice, for certain devices and screen sizes, it would be beneficial if the UI could scale proportionally as well. This is the core offering of the Responsive Framework package.

Let’s think back to the `AppBar` and how it behaves when resized. The width of the `AppBar` increases to fill the maximum available space, but the height stays the same no matter how large the screen gets. The text and icons inside the `AppBar` don’t change either. When the screen size gets really big, this could become a problem in terms of readability and general appearance.

The Responsive Framework package can help us proportionally scale the height of the `AppBar` as the width increases. This doesn’t only apply to the `AppBar` either. When we activate scaling, all of the widgets on the screen will scale. Making them more suitable for a specific screen size as well as making the text more readable.

## Setting Up Responsive Breakpoints

#### When to Scale and When to Resize?

Now that we understand the difference between scaling and resizing, let’s add scaling behavior to our app. First, though, we need to plan out at which screen sizes our app UI should scale. To do that we need to **define breakpoints** for the app and specify **whether we want our app to scale or resize at those specific breakpoints.** If you’re wondering why we wouldn't just have our UI scale continuously, let’s see what happens if we do that.

If the app scales continuously, it will quickly get far too big. So, instead, we only want scaling to happen between certain breakpoints where it makes the most sense. For example, our standard UI looks perfect on small screens like cell phones. So, for smaller screens it is better to leave the default, resizing behavior and not add scaling. However, on tablets and very large screens, it may make sense to add scaling behavior.

### Adding Breakpoints to the App

Knowing what we know now, let’s configure the breakpoints for the app. Head over to the **main.dart** file, import the Responsive Framework package, and add the following code to the `builder` argument of the `MaterialApp`.

**main.dart**

```dart
return MaterialApp(
  builder: (context, widget) => ResponsiveWrapper.builder(
    ClampingScrollWrapper.builder(context, widget!),
    breakpoints: const [
      ResponsiveBreakpoint.resize(350, name: MOBILE),
      ResponsiveBreakpoint.autoScale(600, name: TABLET),
      ResponsiveBreakpoint.resize(800, name: DESKTOP),
      ResponsiveBreakpoint.autoScale(1700, name: 'XL'),
    ],
  ),
...
```

Let’s discuss what’s happening here.

- To configure the breakpoints and scaling behavior globally, we are returning a `ResponsiveWrapper.builder` from the callback function in the `builder` argument of the `MaterialApp`.
- For the positional argument of the `ResponsiveWrapper.builder` we need to provide the `widget` that we get from the callback parameter. We are providing that `widget` here wrapped in a `CalmpingScrollWrapper.builder`. The primary reason for that is to *disable the overscroll glow*, which is a default effect on Android. You can also use the `BouncingScrollWrapper.builder` here if you prefer bouncing over clamping behavior.
- Here we also provided a `List` of `ResponsiveBreakpoint` objects to the `breakpoints` argument. We used `resize` and `autoScale` named constructors depending on which behavior we want for the specific breakpoint. Our app will **resize** when the screen width is between **350px** and **600px**, and between **800px** and **1700px**. The app will **scale** when the screen width is between **600px** and **800px** as well as when the screen is larger than **1700px**. It is completely up to you which breakpoints you set and the behavior you specify. As a general rule of thumb, though, you will likely want to have some scaling for tablets and very large screens to make sure the UI doesn’t appear too small. You can play around with the different behaviors and breakpoint values to achieve the most suitable effect.

We also specified a `name` for every breakpoint. These names can be used throughout the app to reference these breakpoints when configuring other features of the Responsive Framework package.

You’ll also notice that some breakpoints use constants for the names, while the last one uses a `String`. These constants are provided to us by the package for easy referencing, but you can also use your own `String` values.

Lastly, you can also set up the `scaleFactor` argument for the breakpoints if you want your app to be scaled by a custom amount.

*When creating breakpoints, you can also use the `.autoScaleDown` and `.tag` named constructors. The `.autoScaleDown` constructor will have the same behavior as `.autoScale`, but it will also be able to scale down. The `.tag` constructor can be used when you don’t want to set a specific behavior and just want to create a breakpoint you can reference by name elsewhere in the app.*

This is everything we are going to do inside of the **main.dart** file for our app. There are lots of other arguments we haven’t used here that you can customize for the `ResponsiveWrapper`. Here are some of the most prominent ones.

- **breakpointsLandscape** - You can use this argument to specify breakpoints for when a device is in a landscape orientation.
- **landscapePlatforms** - By default landscape breakpoints will only be active when the app is running on *Android, iOS, or Fuchsia*. To change this, you can pass in additional platforms in a `List` to the `landscapePlatforms` argument.
- **minWidth & maxWidth** - You can use these arguments to set the maximum and minimum width for the entire app.
- **defaultName, defaultScale & defaultScaleFactor** - You may have noticed that these arguments are similar to the `ResponsiveBreakpoint` arguments. That’s because they will be used by default for screen sizes which *don’t have a set breakpoint*. In our app we don’t have a `defaultName` set, but you can set one. Since we didn’t specify any custom values for the other two arguments, the `defaultScale` is set to `false` and the `defaultScaleFactor` is set to **1**. We don’t have a breakpoint set before **350px**, so before that breakpoint is reached the app’s behavior is determined by these default arguments. So, in our case the app will resize on screens smaller than **350px** and not scale.
- **background & backgroundColor** - You can use these arguments to set things like a background image and background color for the app. In our app we aren’t using these and even if we did it wouldn’t be visible. That’s because our `Scaffold` has a white background and it stretches to fill the entire screen.

## Responsive Row/Column

Our app is already more responsive than it was before, but wouldn’t it be nice if the course tile `Column` could change to a `Row` on larger screens? The Responsive Framework package has a handy widget that can do just that.

## Responsive Visibility

There's another neat widget the Responsive Framework package provides us with that can help us conditionally display widgets in our app based on the breakpoint conditions we specify.

## Responsive Values

Our app transformation is almost complete. There is just one more Responsive Framework package feature I would like to share. The package provides us with a class we can use to create an object that contains different values depending on the breakpoint conditions we set.

## Other Package Features

We are now all done configuring our app. But before we wrap up this tutorial I would like to mention some of the Responsive Framework package features that we haven’t covered, but you may find worth exploring.

### Responsive Constraints

You can use a `ResponsiveConstraints` widget to wrap your widgets. It will return a `Container` with `BoxConstraints` based on the conditions you specify. This `Container` will wrap around the widget you provide as the `child` for `ResponsiveConstraints`.

### Responsive GridView

You can use the `ResponsiveGridView` provided by the package to create a `GridView` with additional grid layout controls. You can check out the package source code for more details.

To can learn more about responsive framework visit,

- [create-responsive-flutter-apps-with-minimal-effort](https://resocoder.com/2021/10/03/create-responsive-flutter-apps-with-minimal-effort/)
- [Responsive Framework Home Page](https://pub.dev/packages/responsive_framework)