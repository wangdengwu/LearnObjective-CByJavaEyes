//
//  WDWKVC.m
//  JavaAndObjective-C
//
//  Created by 王登武 on 14-1-22.
//  Copyright (c) 2014年 wangdengwu. All rights reserved.
//

#import "WDWKVC.h"

@implementation WDWKVC
-(id)init{
    if (self=[super init]) {
        self.obj1=[WDWObject1 new];
        return self;
    }
    return nil;
}
@end

@implementation WDWObject1
-(id)init{
    if (self=[super init]) {
        self.obj2=[WDWObject2 new];
        return self;
    }
    return nil;
}
@end

@implementation WDWObject2
-(id)init{
    if (self=[super init]) {
        self.obj3=[WDWObject3 new];
        return self;
    }
    return nil;
}
@end

@implementation WDWObject3
-(id)init{
    if (self=[super init]) {
        _objs=[[NSMutableArray alloc]initWithCapacity:100];
        for (int i=0; i<100; i++) {
            WDWObject4 *obj=[WDWObject4 new];
            obj.index=i;
            [_objs addObject:obj];
        }
        return self;
    }
    return nil;
}
-(id)valueForUndefinedKey:(NSString *)key
{
    NSRange start=[key rangeOfString:@"["];
    NSRange end=[key rangeOfString:@"]"];
    NSString *index=[key substringWithRange:NSMakeRange(start.location, end.location-1-start.location)];
    return [self.objs objectAtIndex:[index integerValue]];
}
@end

@implementation WDWObject4
-(id)init{
    if (self=[super init]) {
        self.name=@"wangdengwu";
        return self;
    }
    return nil;
}
@end