//
//  WDWObject.h
//  JavaAndObjective-C
//
//  Created by 王登武 on 14-1-15.
//  Copyright (c) 2014年 wangdengwu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WDWObject : NSObject{
@private NSString * title;
}

@property NSString *name;
@property int age;

-(void)sayHello;
-(void)sayHello:(NSString *) word;
//-(void)sayHello:(NSMutableString*) word; //不支持重载
@end
