//
//  oInterfaceController.m
//  withWatch
//
//  Created by tuniu on 23/4/2016.
//  Copyright © 2016 mengcheng. All rights reserved.
//

#import "oInterfaceController.h"

@interface oInterfaceController ()

@end

@implementation oInterfaceController

- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];
    
    // Configure interface objects here.
}

- (void)willActivate {
    // This method is called when watch view controller is about to be visible to user
    [super willActivate];
}

- (void)didDeactivate {
    // This method is called when watch view controller is no longer visible
    [super didDeactivate];
}

@end



