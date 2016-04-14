//
//  InterfaceController.m
//  withWatch WatchKit Extension
//
//  Created by tuniu on 14/4/2016.
//  Copyright © 2016 mengcheng. All rights reserved.
//

#import "InterfaceController.h"
@import WatchConnectivity;

@interface InterfaceController()<WCSessionDelegate>

@end


@implementation InterfaceController

- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];

    // Configure interface objects here.
}

- (void)willActivate {
    // This method is called when watch view controller is about to be visible to user
    [super willActivate];
}
- (IBAction)toIphoneAction {
    
     NSDictionary *dict = @{@"yang":@"1"};
    
    if ([WCSession isSupported]) {
        
        WCSession* session = [WCSession defaultSession];
        session.delegate = self;
        [session activateSession];
        [session updateApplicationContext:dict error:nil];
        
        dict = [session receivedApplicationContext];
        
        if ([[dict valueForKey:@"yang"] isEqual:@"0"]){
            [self.toIphone setHidden:NO];
        }
        else{
           [self.toIphone setHidden:YES];
        }
    }
    
    
}

- (void)didDeactivate {
    // This method is called when watch view controller is no longer visible
    [super didDeactivate];
}

@end



