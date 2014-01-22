//
//  WDWParent.h
//  JavaAndObjective-C
//
//  Created by 王登武 on 14-1-21.
//  Copyright (c) 2014年 wangdengwu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WDWParent : NSObject

-(BOOL)isParent;
-(void)viewDidLoad;
@end

@interface WDWChild : WDWParent

@end

