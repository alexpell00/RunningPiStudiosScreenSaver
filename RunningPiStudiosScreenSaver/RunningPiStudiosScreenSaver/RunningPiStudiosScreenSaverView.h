//
//  RunningPiStudiosScreenSaverView.h
//  RunningPiStudiosScreenSaver
//
//  Created by Alex Pelletier on 7/3/14.
//  Copyright (c) 2014 Alex Pelletier. All rights reserved.
//

#import <ScreenSaver/ScreenSaver.h>

@interface RunningPiStudiosScreenSaverView : ScreenSaverView{
    BOOL mDrawBackground;
    
    int x;
    int y;
    int xVolosity;
    int yVolosity;
    int height;
    int width;
    NSImageView *logo;
}

@end
