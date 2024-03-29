//
//  WDWObjectPrivate.m
//  JavaAndObjective-C
//
//  Created by 王登武 on 14-1-16.
//  Copyright (c) 2014年 wangdengwu. All rights reserved.
//

#import "WDWObjectPrivate.h"

@implementation WDWObjectPrivate{
@private NSString *implPrivate;
@package NSString *implPackage;
@protected NSString *implProtected;
@public NSString *implPublic;
}

-(void)test{
    NSLog(@"test parent");
    private=@"test";
}

-(NSString *)getString{
    NSLog(@"print from parent");
    NSLog(@"%@",private);
    return @"parent";
}

-(NSString *)getName{
    return @"parent";
}

-(NSString *)description{
    NSLog(@"%@",package);
    return private;
}
@end

@implementation WDWObjectPrivateInner

-(void)test{
    WDWObjectPrivate *p=[WDWObjectPrivate new];
    [p test];
//    p->private=@"private";//不可以访问
    p->package=@"package";
    p->public=@"public";
//    p->protected=@"protected";//不可以访问
//    p->implPrivate=@"implPrivate";也不可以
//    p->implProtected=@"implProtected";
    p->implPackage=@"implPackage";
    p->implPublic=@"implPublic";
}

@end

@implementation WDWObjectPrivateChild:WDWObjectPrivate

-(void)testProperty{
    [super test];
    protected=@"protected";
//    private=@"private";//不可以访问
    public=@"public";
    package=@"package";
//    implPrivate=@"implPrivate";//不可以访问
}

-(NSNumber *)getString{
    NSLog(@"child getString");
    return [NSNumber numberWithInt:110];
}

//-(NSString*)getString{
//    
//}

-(NSString*)getName{
    return @"child";
}



@end