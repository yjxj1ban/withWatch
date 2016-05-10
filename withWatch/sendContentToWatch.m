//
//  sendContentToWatch.m
//  withWatch
//
//  Created by tuniu on 10/5/2016.
//  Copyright © 2016 mengcheng. All rights reserved.
//

#import "sendContentToWatch.h"
@import WatchConnectivity;
@interface sendContentToWatch ()<WCSessionDelegate>
@property (weak,nonatomic) WCSession *toWatchSession;

@end

@implementation sendContentToWatch

//-(instancetype)init {
//    self = [super init];
//    if(self){
//        if ([WCSession isSupported]) {
//            self.toWatchSession = [WCSession defaultSession];
//            self.toWatchSession.delegate = self;
//            [self.toWatchSession activateSession];}
//    }
//    return self;
//}

- (void)viewDidLoad {
    [super viewDidLoad];
   
    if ([WCSession isSupported]) {
        self.toWatchSession = [WCSession defaultSession];
        self.toWatchSession.delegate = self;
        [self.toWatchSession activateSession];}
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)clickButtonToWatch:(id)sender {
    //是在button的里面写内容，还是说在外面写
    NSDictionary *sendItem = @{@"logStatus":@"good"};
    [self.toWatchSession updateApplicationContext: sendItem error:nil ];
    NSLog(@"send over");
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
