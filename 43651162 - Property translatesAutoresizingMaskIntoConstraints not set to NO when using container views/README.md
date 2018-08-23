# Property `translatesAutoresizingMaskIntoConstraints` not set to `NO` when using container views

## Description: Using Interface Builder: When a UIScrollView's content view is a UIStackView which again contains container views with an embed segue to child view controllers, the property `translatesAutoresizingMaskIntoConstraints` is not set to `NO`.

As [described in the documentation](https://developer.apple.com/documentation/uikit/uiview/1622572-translatesautoresizingmaskintoco), the property should be set to `NO` automatically:

> If you add views in Interface Builder, the system automatically sets this property to false.

This behavior is not seen if:
* an UIView instance is placed directly inside the UIScrollView instead of using an container view with an embed segue to child view controllers
* the view hierarchy is defined programmatically, and `translatesAutoresizingMaskIntoConstraints` is set to `NO`

Steps: Please see the attached demo project. The project contains three view controllers.

### Works:

Contains a view hierarchy defined programmatically. Please see `WorksViewController.m` for details, the storyboard just contains an empty view controller with a reference to this class.

### Defect:

Contains a view hierarchy defined entirely using Interface Builder and storyboard. The view controller is not able to display the contents in the UIStackView accordingly, the views in the UIStackView are collapsed.

### Workaround:

Contains the same setup as "Defect", but `translatesAutoresizingMaskIntoConstraints` is set programmatically to `NO` in `-[WorkaroundViewController prepareForSegue:sender:]` for every embedded view controller.

Expected: As described in the official documentation, the property `translatesAutoresizingMaskIntoConstraints` should be set automatically to `NO`, even in view controllers placed in a container view controller using embed segues.

## Actual:

`translatesAutoresizingMaskIntoConstraints` is set to the default for view added programmatically, which is `YES`. The console will log the following warning:

```
2018-08-23 20:26:41.515016+0200 ContainerViewDemo[29499:1632552] [LayoutConstraints] Unable to simultaneously satisfy constraints.
	Probably at least one of the constraints in the following list is one you don't want. 
	Try this: 
		(1) look at each constraint and try to figure out which you don't expect; 
		(2) find the code that added the unwanted constraint or constraints and fix it. 
(
    "<NSLayoutConstraint:0x600000c13c50 UIView:0x7fb00b427210.height == 400   (active)>",
    "<NSLayoutConstraint:0x600000c13d40 V:|-(0)-[UIView:0x7fb00b427210]   (active, names: '|':UIView:0x7fb00b427030 )>",
    "<NSLayoutConstraint:0x600000c13d90 V:[UIView:0x7fb00b427210]-(0)-|   (active, names: '|':UIView:0x7fb00b427030 )>",
    "<NSLayoutConstraint:0x600000c1fca0 'UIView-Encapsulated-Layout-Height' UIView:0x7fb00b427030.height == 0   (active)>"
)

Will attempt to recover by breaking constraint 
<NSLayoutConstraint:0x600000c13c50 UIView:0x7fb00b427210.height == 400   (active)>

Make a symbolic breakpoint at UIViewAlertForUnsatisfiableConstraints to catch this in the debugger.
The methods in the UIConstraintBasedLayoutDebugging category on UIView listed in <UIKitCore/UIView.h> may also be helpful.
2018-08-23 20:26:41.515918+0200 ContainerViewDemo[29499:1632552] [LayoutConstraints] Unable to simultaneously satisfy constraints.
	Probably at least one of the constraints in the following list is one you don't want. 
	Try this: 
		(1) look at each constraint and try to figure out which you don't expect; 
		(2) find the code that added the unwanted constraint or constraints and fix it. 
(
    "<NSLayoutConstraint:0x600000c13660 UIView:0x7fb00b424d20.height == 200   (active)>",
    "<NSLayoutConstraint:0x600000c137a0 V:|-(0)-[UIView:0x7fb00b424d20]   (active, names: '|':UIView:0x7fb00b424b40 )>",
    "<NSLayoutConstraint:0x600000c137f0 V:[UIView:0x7fb00b424d20]-(0)-|   (active, names: '|':UIView:0x7fb00b424b40 )>",
    "<NSLayoutConstraint:0x600000c1c9b0 'UIView-Encapsulated-Layout-Height' UIView:0x7fb00b424b40.height == 0   (active)>"
)

Will attempt to recover by breaking constraint 
<NSLayoutConstraint:0x600000c13660 UIView:0x7fb00b424d20.height == 200   (active)>

Make a symbolic breakpoint at UIViewAlertForUnsatisfiableConstraints to catch this in the debugger.
The methods in the UIConstraintBasedLayoutDebugging category on UIView listed in <UIKitCore/UIView.h> may also be helpful.
```

