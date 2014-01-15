//
//  WDWObject.m
//  JavaAndObjective-C
//
//  Created by 王登武 on 14-1-15.
//  Copyright (c) 2014年 wangdengwu. All rights reserved.
//

#import "WDWObject.h"

@implementation WDWObject

-(void)sayHello{
    NSLog(@"%@ age is %d say Hello",self.name,self.age);
}
-(void)sayHello:(NSString *)word{
    NSLog(@"%@ age is %d say %@",self.name,self.age,word);
}

-(NSString *)description{
    return [NSString stringWithFormat:@"my name is %@ and i am %d years old %@",self.name,self.age,self.man?@"man":@"women"];
}

+(BOOL)areYou:(WDWObject *)you Old:(BOOL)old Man:(BOOL)man{
    if (old&&man) {
        if (you.age>50&&you.man) {
            return YES;
        }
    }
    return NO;
}
@end
