//
//  ViewController.m
//  withWatch
//
//  Created by tuniu on 14/4/2016.
//  Copyright © 2016 mengcheng. All rights reserved.
//

#import "ViewController.h"
@import WatchConnectivity;
#import "InterfaceController.h"

@interface ViewController ()<WCSessionDelegate>
@property (strong) NSString *test;
@property (weak, nonatomic) IBOutlet UILabel *labelOne;

@end

@implementation ViewController


//-(void)receiveDictionFromWatch{
//    if ([WCSession isSupported]) {
//        WCSession* sessionToWatch = [WCSession defaultSession];
//        sessionToWatch.delegate = self;
//        [sessionToWatch activateSession];
//        NSDictionary *receiveData = [sessionToWatch receivedApplicationContext];
//        
//        if([[receiveData objectForKey:@"yang"]  isEqualToString: @"1"]){
////            [self.toWatch setHidden:NO];
//            NSLog(@"%@",receiveData);
//            NSMutableDictionary *changedDict = [NSMutableDictionary dictionaryWithDictionary:receiveData];
//            //隐藏后就变成0
//            [changedDict setObject:@"0"  forKey:@"yang"];
//            NSDictionary *backToDictionays = (NSDictionary *)changedDict;//字典能给
//            [sessionToWatch updateApplicationContext:backToDictionays error:nil];
//             NSLog(@"%@",backToDictionays);
//            
//        }else{
////            [self.toWatch setHidden:YES];
//        }
//        
//    }
//    
//}




- (void)viewDidLoad {
    [super viewDidLoad];
//    [self.toWatch setHidden:YES];
//
    if ([WCSession isSupported]) {
        WCSession *session = [WCSession defaultSession];
        session.delegate = self;
        [session activateSession];
    }
    
    // Do any additional setup after loading the view, typically from a nib.
}

//-(void)setButtonHidden{
//    [self.toWatch setHidden:YES];
//}
//
//-(void)setButtonShow{
//    [self.toWatch setHidden:NO];
//}
//-(void)pushDictionToWatch{
//    
//}
//session 不能写在点button的里面，否则没地方点击，没


-(void)session:(WCSession *)session didReceiveApplicationContext:(NSDictionary<NSString *,id> *)applicationContext{
    
    NSString *result = [applicationContext objectForKey:@"yang"];
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.labelOne setText:[NSString stringWithFormat:@"you %@", result]];
        });

    
    NSLog(@"%@",result);

}


- (IBAction)toWatchAction:(id)sender {
    [self.labelOne setText:@"clear"];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
