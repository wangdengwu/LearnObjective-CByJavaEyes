//
//  WDWParent.m
//  JavaAndObjective-C
//
//  Created by 王登武 on 14-1-21.
//  Copyright (c) 2014年 wangdengwu. All rights reserved.
//

#import "WDWParent.h"

@implementation WDWParent
-(void)viewDidLoad{
    NSLog(@"%hhd",[self isParent]);
}
-(BOOL)isParent{
    return YES;
}
@end

@implementation WDWChild

-(BOOL)isParent{
    return NO;
}

@end