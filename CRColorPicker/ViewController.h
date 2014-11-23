//
//  ViewController.h
//  CRColorPicker
//
//  Created by Clément Raussin on 23/11/2014.
//  Copyright (c) 2014 Clément Raussin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CRColorPicker.h"

@interface ViewController : UIViewController<CRColorPickerDelegate>{
    __weak IBOutlet CRColorPicker *colorPickerView;
    __weak IBOutlet UIView *colorPreviewView;
}


@end

