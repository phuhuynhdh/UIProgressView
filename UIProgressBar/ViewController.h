//
//  ViewController.h
//  UIProgressBar
//
//  Created by Phu Huynh on 8/24/15.
//  Copyright (c) 2015 Plato. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIProgressView * progressView;
@property (weak, nonatomic) IBOutlet UILabel * labelInfo;
@property (weak, nonatomic) IBOutlet UILabel * labelPercent;

@end

