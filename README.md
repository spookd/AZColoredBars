AZColoredNavigationBar
======================

A drop–in `UINavigationBar` subclass which allows for strong coloured navigation bars on iOS 7. 

Usage
-----

Use with UINavigationController's initWithNavigationBarClass:toolbarClass: method:

```
UINavigationController *navigationController = [[UINavigationController alloc] initWithNavigationBarClass:[AZColoredNavigationBar class] toolbarClass:[UIToolbar class]];

// If you need to set a rootViewController too, then set the navigationController's viewControllers.
navigationController.viewControllers = @[ rootViewController ];
```

Then either set the barTintColor using UIAppearance (applied globally):

`[[UINavigationBar appearance] setBarTintColor:[UIColor blueColor]];`

Or if you want to change the colour dynamically:

`navigationBar.barTintColor = [UIColor blueColor];`

Acknowledgements
----------------

Thanks to @steventroughtonsmith for the original help as seen in this [gist](https://gist.github.com/alanzeino/6619253). Forked from @aprato's modification [here](https://gist.github.com/aprato/6631390). 
