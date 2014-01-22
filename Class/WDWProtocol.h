//
//  WDWProtocol.h
//  JavaAndObjective-C
//
//  Created by 王登武 on 14-1-20.
//  Copyright (c) 2014年 wangdengwu. All rights reserved.
//

#import <Foundation/Foundation.h>
@protocol WDWProtocolDelegate<NSObject>
@optional
-(void)didDoWhateverYouLike;
@required
-(void)didDoWhateverYouLove;
@end


@interface WDWProtocol : NSObject //必须显示声明集成自NSObject

@property(nonatomic,weak) id<WDWProtocolDelegate> delegate;

-(void)doWhateverYouLike;
-(void)doWhateverYouLove;

-(id)initWithDelegate:(id<WDWProtocolDelegate>)delegate;
@end


@interface WDWProtocolDidDo : NSObject<WDWProtocolDelegate>

@end