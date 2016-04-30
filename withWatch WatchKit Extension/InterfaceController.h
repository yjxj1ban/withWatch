//
//  InterfaceController.h
//  withWatch WatchKit Extension
//
//  Created by tuniu on 14/4/2016.
//  Copyright © 2016 mengcheng. All rights reserved.
//

#import <WatchKit/WatchKit.h>
#import <Foundation/Foundation.h>

@interface InterfaceController : WKInterfaceController
@property (unsafe_unretained, nonatomic) IBOutlet WKInterfaceButton *toIphone;
//@property (strong) NSDictionary *dict;
@property (unsafe_unretained, nonatomic) IBOutlet WKInterfaceButton *transFile;
@end
