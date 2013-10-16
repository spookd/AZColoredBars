AZColoredNavigationBar
======================
A drop–in `UINavigationBar` and `UIToolbar` subclass which allows for strong coloured navigation bars on iOS 7. 

Usage
-----
Use with UINavigationController's initWithNavigationBarClass:toolbarClass: method:
```objective-c
UINavigationController *navigationController = [[UINavigationController alloc] initWithNavigationBarClass:[AZColoredNavigationBar class] toolbarClass:[AZColoredToolbar class]];
```

You can then set their respective tint colors directly, or by using their `UIAppearance` class - e.g.:
```objective-c
[[UIToolbar appearance] setBarTintColor:UIColor.blueColor];
[[UINavigationBar appearance] setBarTintColor:UIColor.blueColor];
```

To change the colors intensity, use the static `intensity` property of the `AZColoredBars` object:
```objective-c
#import "AZColoredBars.h"

// ...

AZColoredBars.intensity = .65f;
```

Storyboards
-----------
Simply set the control class to `AZColoredNavigationBar` or `AZColoredToolbar`.

Acknowledgements
----------------
Thanks to @steventroughtonsmith for the original help as seen in this [gist](https://gist.github.com/alanzeino/6619253). Forked from @aprato's modification [here](https://gist.github.com/aprato/6631390). 
