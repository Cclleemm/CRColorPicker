//
//  ViewController.m
//  CRColorPicker
//
//  Created by Clément Raussin on 23/11/2014.
//  Copyright (c) 2014 Clément Raussin. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //Add the CRColorPicker delegate
    [colorPickerView setDelegate:self];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - CRColorPicker delegate

//Action when user is choosing color
-(void)colorIsChanging:(UIColor *)color{
    [colorPreviewView setBackgroundColor:color];
}

//Action when user finished to select a color
-(void)colorSelected:(UIColor *)color{
    [colorPreviewView setBackgroundColor:color];
    [self.view setBackgroundColor:color];
}
@end
