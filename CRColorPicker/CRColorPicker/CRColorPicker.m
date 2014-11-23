//
//  CRColorPicker.m
//  CRColorPicker
//
//  Created by Clément Raussin on 23/11/2014.
//  Copyright (c) 2014 Clément Raussin. All rights reserved.
//

#import "CRColorPicker.h"
#define CENTRAL_TOLERANCE  20 //(percents)

@interface CRColorPicker ()

@end

@implementation CRColorPicker

-(id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {

    [self setBackgroundColor:[UIColor darkGrayColor]];
    //Set background gradient image
    backgroundGradientImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"colorpicker-gradient"]];
        [backgroundGradientImageView setFrame:self.bounds];
    [self addSubview:backgroundGradientImageView];
    }
    return self;
}

-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self setBackgroundColor:[UIColor darkGrayColor]];
        //Set background gradient image
        backgroundGradientImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"colorpicker-gradient"]];
        [backgroundGradientImageView setFrame:self.bounds];
        [self addSubview:backgroundGradientImageView];
    }
    return self;
}



-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    
    // gets the coordinats of the touch with respect to the specified view.
    CGPoint touchPoint = [touch locationInView:self];
    if(self.delegate!=nil){
        if([self.delegate respondsToSelector:@selector(colorIsChanging:)]){
            [self.delegate colorIsChanging:[self colorWithTouchPoint:touchPoint]];
        }
    }
    
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
     UITouch *touch = [touches anyObject];
    CGPoint touchPoint = [touch locationInView:self];
    [self colorWithTouchPoint:touchPoint];
    if(self.delegate!=nil){
        if([self.delegate respondsToSelector:@selector(colorIsChanging:)]){
            [self.delegate colorIsChanging:[self colorWithTouchPoint:touchPoint]];
        }
    }
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint touchPoint = [touch locationInView:self];
    if(self.delegate!=nil){
        if([self.delegate respondsToSelector:@selector(colorSelected:)]){
            [self.delegate colorSelected:[self colorWithTouchPoint:touchPoint]];
        }
    }
}

-(UIColor*)colorWithTouchPoint:(CGPoint)touchPoint{
    
    float x = touchPoint.x;
    float y = touchPoint.y;
    float height = self.frame.size.height;
    float width = self.frame.size.width;
    float xPercent = ((x/width)>=0)? ((x/width<=1)? x/width : 1) : 0;
    float yPercent = ((y/height)>=0)? ((y/height<=1)? (y/height) : 1) : 0;
    
    float red=0;
    float green=0;
    float blue=0;
    
    
    //Creation of colors
    if(xPercent>0 && xPercent<2.0/3.0)
    {
        float period  = (xPercent/(2.0/3.0));
        blue = 255*(sin(period*M_PI));
    }
    
    if(xPercent>1.0/3.0)
    {
        float period  = ((xPercent-1.0/3.0)/(2.0/3.0));
        green = 255*(sin(period*M_PI));
    }
    
    if(!((xPercent>1.0/3.0)&&(xPercent<2.0/3.0)))
    {
        float period  = ((xPercent>=2.0/3.0)? (xPercent-2.0/3.0) : (xPercent+1.0/3.0))/(2.0/3.0);
        red = 255*(sin(period*M_PI));
    }
    
    //Creation of intensity
    float areaPercentSize = (1.0-CENTRAL_TOLERANCE/100.0)/2.0;
    //Lighter
    if(yPercent<areaPercentSize){
        float lightPercent = (1.0 - yPercent/areaPercentSize);
        red += lightPercent*(255-red);
        green += lightPercent*(255-green);
        blue += lightPercent*(255-blue);
    }
    
    //Darker
    if(yPercent>areaPercentSize+CENTRAL_TOLERANCE/100.0){
        float darkPercent = (yPercent-(areaPercentSize+CENTRAL_TOLERANCE/100.0))/areaPercentSize;
        red -= darkPercent*red;
        green -= darkPercent*green;
        blue -= darkPercent*blue;
    }
    
    UIColor *color = [[UIColor alloc] initWithRed:red/255 green:green/255 blue:blue/255 alpha:1];
    
    return color;
}





@end
