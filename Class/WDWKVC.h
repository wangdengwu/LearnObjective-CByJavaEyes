//
//  WDWKVC.h
//  JavaAndObjective-C
//
//  Created by 王登武 on 14-1-22.
//  Copyright (c) 2014年 wangdengwu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WDWObject4:NSObject
@property NSString *name;
@property int index;
@end

@interface WDWObject3:NSObject
@property NSMutableArray *objs;
@end

@interface WDWObject2:NSObject
@property WDWObject3 *obj3;
@end

@interface WDWObject1:NSObject
@property WDWObject2 *obj2;
@end

@interface WDWKVC : NSObject
@property WDWObject1 *obj1;
@end


