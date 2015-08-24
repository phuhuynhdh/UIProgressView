//
//  ViewController.m
//  UIProgressBar
//
//  Created by Phu Huynh on 8/24/15.
//  Copyright (c) 2015 Plato. All rights reserved.
//

#import "ViewController.h"

@interface ViewController (){
    NSTimer * autoTask;
    
    float totalData;
    float receivedData;
}

@end

@implementation ViewController

@synthesize progressView;
@synthesize labelInfo;
@synthesize labelPercent;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    totalData = 4096.015f;
    receivedData = 0.0f;
    
    // Set progress value to 0.0f
    [progressView setProgress:0.0f];
    
    // Set initial value for label info
    labelInfo.text = [NSString stringWithFormat:@"%.02f MB/%.02f MB",receivedData/ (1024* 2), totalData/ (1024 * 2)];
    
    // Set initial value for label percent to 0%
    labelPercent.text = [NSString stringWithFormat:@"%i%%", 0];
    
    // Run download function
    [self performSelectorInBackground:@selector(simulateDownloadAnItem) withObject:nil];
    
    autoTask = [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(moveProgressView) userInfo:nil repeats:YES];
}


- (void) moveProgressView{
    // float currentValue = progressView.progress;
    float plusValue = receivedData * 1.0f / totalData;
    NSLog(@"Plus value: %f", plusValue);
    
    [progressView setProgress:plusValue];
    
    // Update label info
    labelInfo.text = [NSString stringWithFormat:@"%.02f MB/%.02f MB",receivedData / (1024 * 2), totalData / (1024 * 2)];
    
    // Update percent label
    labelPercent.text = [NSString stringWithFormat:@"%i%%", (int)(receivedData * 100 / totalData)];
    
    // Change the color of progress to red if the data has been recevied over 50 precent
    if (receivedData * 100 / totalData >= 50.0f){
        progressView.progressTintColor = [UIColor colorWithRed:255 green:0 blue:0 alpha:1.0f];
    }
    
    // Stop task
    if (plusValue >= 1.0f){
       [autoTask invalidate];
       autoTask = nil;
    }
}

- (void) simulateDownloadAnItem{
    
    for( float i = 0.0 ; receivedData < totalData; i = i + 0.001f){
        receivedData += i;
        NSLog(@"receiving data: %f", receivedData);
    }
    
    // Show a message when downloading has been completed
    UIAlertView * alertView = [[UIAlertView alloc] initWithTitle:@"Download" message:@"The downloading has been completed." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alertView show];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
