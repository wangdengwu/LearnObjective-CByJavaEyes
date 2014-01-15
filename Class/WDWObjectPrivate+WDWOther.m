//
//  WDWObjectPrivate+WDWObjectPrivate_WDWOther.m
//  JavaAndObjective-C
//
//  Created by 王登武 on 14-1-16.
//  Copyright (c) 2014年 wangdengwu. All rights reserved.
//

#import "WDWObjectPrivate+WDWOther.h"

@implementation WDWObjectPrivate (WDWOther)

-(void)testCategory{
//    [self ]
    self->private=@"categoryPrivate";
    [self getString];
//    WDWObjectPrivate *p=[WDWObjectPrivate new];
//    [p test];私有的方法，类别也不能调用，但是可以搞私有属性
}
@end
