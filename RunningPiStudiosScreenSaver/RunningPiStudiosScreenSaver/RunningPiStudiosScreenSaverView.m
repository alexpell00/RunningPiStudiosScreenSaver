//
//  RunningPiStudiosScreenSaverView.m
//  RunningPiStudiosScreenSaver
//
//  Created by Alex Pelletier on 7/3/14.
//  Copyright (c) 2014 Alex Pelletier. All rights reserved.
//

#import "RunningPiStudiosScreenSaverView.h"

@implementation RunningPiStudiosScreenSaverView

- (instancetype)initWithFrame:(NSRect)frame isPreview:(BOOL)isPreview
{
    self = [super initWithFrame:frame isPreview:isPreview];
    if (self) {
        [self setAnimationTimeInterval:1/30.0];
    }
    return self;
}

- (void)startAnimation
{
    
    [[NSColor colorWithDeviceRed: 0.0 green: 0.0 blue: 0.0 alpha: 1.0] set];
    [NSBezierPath fillRect: [self bounds]];

    
    //setup 
    NSBundle* saverBundle = [NSBundle bundleForClass:[self class]];
    NSString* imagePath = [saverBundle pathForResource:@"logo-margin" ofType: @"png"];
    NSImage* image = [[NSImage alloc] initWithContentsOfFile: imagePath];
    
    x = (arc4random() % (int)self.frame.size.width-width) + 0;
    y = (arc4random() % (int)self.frame.size.height-height) + 0;
    height = 150;
    width = 150;
    xVolosity = 3;
    yVolosity = 3;
    
    logo = [[NSImageView alloc] initWithFrame:NSMakeRect(x, y, width, height)];
    [logo setImage:image];
    [self addSubview:logo];
    
    
    
}


- (void)stopAnimation
{
    [super stopAnimation];
}

- (void)drawRect:(NSRect)rect
{
    [[NSColor colorWithDeviceRed: 0.0 green: 0.0 blue: 0.0 alpha: 1.0] set];
    [NSBezierPath fillRect: [self bounds]];
    
    //detect hits
    if (logo.frame.origin.x <= 0){
        xVolosity = abs(xVolosity);
    }else if (logo.frame.origin.x+width >= self.frame.size.width){
        xVolosity = abs(xVolosity) * -1;
    }
    if (logo.frame.origin.y <= 0){
        yVolosity = abs(yVolosity);
    }else if (logo.frame.origin.y+height >= self.frame.size.height){
        yVolosity = abs(yVolosity) * -1;
    }
    
    
    //move logo
    NSRect logoRect = logo.frame;
    logoRect.origin.x += xVolosity;
    logoRect.origin.y += yVolosity;
    
    [logo setFrame:logoRect];
    
    
//    NSTextField *log = [[NSTextField alloc] initWithFrame:NSMakeRect(400, 400, 200, 200)];
//    [log setBezeled:NO];
//    [log setDrawsBackground:NO];
//    [log setEditable:NO];
//    [log setSelectable:NO];
//    [log setTextColor:[NSColor whiteColor]];
//    [log setStringValue:[NSString stringWithFormat:@"W:%f H:%f" , self.frame.size.width , self.frame.size.height]];
//    [self addSubview:log];
}

- (void)animateOneFrame
{
    //   request that our view be redrawn (causes Cocoa to call drawRect:)
    [self setNeedsDisplay: YES];
}

- (BOOL)hasConfigureSheet
{
    return NO;
}

- (NSWindow*)configureSheet
{
    return nil;
}

//user defined
- (BOOL)isOpaque {
    // this keeps Cocoa from unneccessarily redrawing our superview
    return YES;
}
@end
