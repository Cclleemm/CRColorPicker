//
//  CRColorPicker.h
//  CRColorPicker
//
//  Created by Clément Raussin on 23/11/2014.
//  Copyright (c) 2014 Clément Raussin. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CRColorPickerDelegate;

@interface CRColorPicker : UIView
{
    UIImageView *backgroundGradientImageView;
}
@property (nonatomic, strong) id<CRColorPickerDelegate> delegate;
@end

@protocol CRColorPickerDelegate <NSObject>

-(void)colorIsChanging:(UIColor*)color;
-(void)colorSelected:(UIColor*)color;

@end