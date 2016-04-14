//
//  ViewController.m
//  withWatch
//
//  Created by tuniu on 14/4/2016.
//  Copyright © 2016 mengcheng. All rights reserved.
//

#import "ViewController.h"
@import WatchConnectivity;

@interface ViewController ()<WCSessionDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)toWatchAction:(id)sender {
    
    if ([WCSession isSupported]) {
        WCSession* sessionToWatch = [WCSession defaultSession];
        sessionToWatch.delegate = self;
        [sessionToWatch activateSession];
        NSDictionary *receiveData = [sessionToWatch receivedApplicationContext];
        NSLog(@"%@",receiveData);
        
        if([[receiveData objectForKey:@"yang"]  isEqual: @"1"]){
            
            [self.toWatch setHidden:YES];
            [receiveData setValue:@"0" forKey:@"yang"];
            [sessionToWatch updateApplicationContext:receiveData error:nil];
//            NSLog(@"%@",receiveData);
        }
        
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
