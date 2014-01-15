//
//  WDWObjectPrivate.h
//  JavaAndObjective-C
//
//  Created by 王登武 on 14-1-16.
//  Copyright (c) 2014年 wangdengwu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WDWObjectPrivate : NSObject{
@private NSString *private;
@package NSString *package;
@public NSString *public;
@protected NSString *protected;
}

-(NSString*)getString;

-(NSString*)getName;
//-(void)getString;//不可以定义
@end

@interface WDWObjectPrivateInner :NSObject

-(void)test;

@end

@interface WDWObjectPrivateChild : WDWObjectPrivate

-(void)getString;//可以定义

//-(NSString*)getString;


@end
