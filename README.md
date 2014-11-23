CRColorPicker
=============

A simple horizontal ColorPicker for iOS apps

Example
============
![PreviewImage](https://raw.github.com/Cclleemm/ProductTour/master/screenshots/CRColorPicker.gif?raw=true) 

Integration
============
Add an UIView in your app interface.
Next, add CRProductTour class on this view (with the interface builder for example like in the example)
And connect your interface view controller to the CRColorPicker with its delegate :
```
[colorPickerView setDelegate:self];
```
Create the optionals delegate methods
```
//Action when user is choosing color
-(void)colorIsChanging:(UIColor *)color{
     //Do what ever you want with the color
}

//Action when user finished to select a color
-(void)colorSelected:(UIColor *)color{
    //Do what ever you want with the color
}
```
