//
//  DetailViewController.h
//  sadfsdafadsf
//
//  Created by Alex Pelletier on 7/17/14.
//  Copyright (c) 2014 Alex Pelletier. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;
@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

@end

