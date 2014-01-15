//
//  WDWObject.h
//  JavaAndObjective-C
//
//  Created by 王登武 on 14-1-15.
//  Copyright (c) 2014年 wangdengwu. All rights reserved.
//

#import <Foundation/Foundation.h>
#define MAN @"man"
#define WOMAN @"women"

static NSString *classProperty=@"class property";

@interface WDWObject : NSObject//为了避免冲突，需要加前缀，比如WDW

@property NSString *name;//2.0支持的属性，简化了属性定义的Get,Set
@property int age;
@property BOOL man;
@property(readonly) WDWObject *mySelf;//只读属性，即没有Set方法

-(void)sayHello;
-(void)sayHello:(NSString *) word;
//-(void)sayHello:(NSMutableString*) word; //不支持重载
+(BOOL)areYou:(WDWObject*)you Old:(BOOL)old Man:(BOOL)man;
@end
