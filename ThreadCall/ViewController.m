//
//  ViewController.m
//  ThreadCall
//
//  Created by 马海平 on 2020/6/15.
//  Copyright © 2020 马海平. All rights reserved.
//

#import "ViewController.h"
#import "GCDCallObject.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    GCDCallObject * obj = [[GCDCallObject alloc]init];
    [obj call];
}


@end
