//
//  WDWThread.m
//  JavaAndObjective-C
//
//  Created by 王登武 on 14-1-21.
//  Copyright (c) 2014年 wangdengwu. All rights reserved.
//

#import "WDWThread.h"

@implementation WDWThread

-(void)addFrom:(int)_from to:(int)_to{
    //Array里只能存对象
    NSArray *array=[NSArray arrayWithObjects:[NSNumber numberWithInt:_from],[NSNumber numberWithInt:_to],nil];
//    [self performSelector:@selector(doAdd1:) withObject:array];//使用NSObject的自有方法，只能执行木有返回值的
//    [self doAdd2:array];
//    [self testDefaultConQueue];
//    [self testCreateSerialQueue];
//    [self testSynchronous];
    NSLog(@"addFrom:to done");
    [NSThread sleepForTimeInterval:5];//等待5秒
}
-(void)doAdd1:(NSArray*)params{
    int from=[(NSNumber*)[params objectAtIndex:0] intValue];
    int to=[(NSNumber*)[params objectAtIndex:1] intValue];
    int sum=0;
    for (int i=from; i<to; i++) {
        sum+=i;
    }
    [NSThread sleepForTimeInterval:5];//等待5秒
    NSLog(@"sum=%d",sum);
}
-(void)doAdd2:(NSArray*)params{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT , 0), ^{
        int from=[(NSNumber*)[params objectAtIndex:0] intValue];
        int to=[(NSNumber*)[params objectAtIndex:1] intValue];
        int sum=0;
        for (int i=from; i<to; i++) {
            sum+=i;
        }
        NSLog(@"sum=%d",sum);
    });
}
-(void)testDefaultConQueue{
    for (int i=0; i<100; i++) {
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT , 0), ^{//concurrent queue
            NSLog(@"index %d",i);
        });
    }
}
-(void)testCreateSerialQueue{
   dispatch_queue_t mySerialQueue= dispatch_queue_create("mySerialQueue", NULL);
    for (int i=0; i<100; i++) {
    dispatch_async(mySerialQueue, ^{//concurrent queue
            NSLog(@"index %d",i);
        });
    }
}
-(void)testSynchronous{
        //1.使用group实现同步
//    dispatch_group_t group=dispatch_group_create();
//    for (int i=0; i<100; i++) {
//       dispatch_group_async(group,dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
//            NSLog(@"index %d",i);
//        });
//    }
//    dispatch_group_notify(group, dispatch_queue_create("mySerialQueue", NULL),^{
//        NSLog(@"after index count");
//    });
    //2.使用dispatch_apply
    dispatch_apply(100, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^(size_t index){
        NSLog(@"index %zu",index);
    });
    NSLog(@"after index count");
}

@end
