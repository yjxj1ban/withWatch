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
@property (strong, nonatomic) WCSession *session;
@end


@implementation InterfaceController

//问题1，为什么要这样init，为何要返回self？？？
-(instancetype)init {
    self = [super init];
    if(self){
        if ([WCSession isSupported]) {
            self.session = [WCSession defaultSession];
            self.session.delegate = self;
            [self.session activateSession];}
    }
    return self;
}

- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];
//    self.dict = @{@"yang":@"0"};//默认是0 所以显示出来；点击后应该隐藏且设置为1上传

    // Configure interface objects here.
}

- (void)willActivate {
    // This method is called when watch view controller is about to be visible to user
    [super willActivate];
}
- (IBAction)toIphoneAction {

//    if ([WCSession isSupported]) {
    
//        WCSession* session = [WCSession defaultSession];
//        session.delegate = self;
//        [session activateSession];
        
//        NSDictionary *receiveFromIphone = [session receivedApplicationContext];
        
        //如果yang=0 就是watch显示出来。yang=1，就是watch不显示出来
//        
//        if ([[self.dict valueForKey:@"yang"] isEqualToString:@"0"]){
//            
//            [self.toIphone setHidden:YES];
//            NSMutableDictionary *changeToMutable = [NSMutableDictionary dictionaryWithDictionary:self.dict];
//            [changeToMutable setObject:@"1" forKey:@"yang"];
//            
//            NSLog(@"%@",changeToMutable);
//            
//            NSDictionary *backToDiction = (NSDictionary *)changeToMutable;
//            [session updateApplicationContext:backToDiction error:nil];
//            
//        }else{
////            [self.toIphone setHidden:NO];
//        }
        
//    }
    for (int i = 0;i<5;++i){
        NSString *string = [NSString stringWithFormat:@"yang,%d",i];

    [self sendthings:string];
    NSLog(@"click button");
    }
    
}
-(void)sendthings:(NSString *)strings{
    NSDictionary *dict = @{@"yang":strings};
    [self.session updateApplicationContext:dict error:nil];
    
    
}

- (void)didDeactivate {
    // This method is called when watch view controller is no longer visible
    [super didDeactivate];
}

@end



