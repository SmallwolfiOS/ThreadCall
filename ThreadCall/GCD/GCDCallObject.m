//
//  GCDCallObject.m
//  ThreadCall
//
//  Created by 马海平 on 2020/6/15.
//  Copyright © 2020 马海平. All rights reserved.
//

#import "GCDCallObject.h"

@implementation GCDCallObject
 
#define LOGThread(x) NSLog(@"%ld, 当前线程---%@",(long)x,[NSThread currentThread]);

- (void)call{
    dispatch_queue_t serialQueue = dispatch_queue_create("sessin Queue", DISPATCH_QUEUE_CONCURRENT);
    LOGThread(1)
    dispatch_async(serialQueue, ^{
        sleep(3);
        LOGThread(2)
    });
    LOGThread(100)
    dispatch_sync(serialQueue, ^{
        LOGThread(3)
    });
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        dispatch_async(serialQueue, ^{
            LOGThread(4)
        });
        sleep(3);
        LOGThread(5)
    });
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), serialQueue, ^{
        dispatch_async(serialQueue, ^{
             LOGThread(6)
        });
        
        LOGThread(7)
    });
    LOGThread(8)
    dispatch_sync(serialQueue, ^{
        sleep(3);
        LOGThread(9)
    });
}








@end
