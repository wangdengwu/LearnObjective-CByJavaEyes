//
//  WDWProtocol.m
//  JavaAndObjective-C
//
//  Created by 王登武 on 14-1-20.
//  Copyright (c) 2014年 wangdengwu. All rights reserved.
//

#import "WDWProtocol.h"


@implementation WDWProtocol

-(id)initWithDelegate:(id<WDWProtocolDelegate>)delegate{
    if (self=[super init]) {
        _delegate=delegate;
        return self;
    }
    return nil;
}

-(void)doWhateverYouLike{
    NSLog(@"doWhateverYouLike");
    if (_delegate&&[_delegate respondsToSelector:@selector(didDoWhateverYouLike)]) {
            [_delegate didDoWhateverYouLike];
    }
}
-(void)doWhateverYouLove{
    NSLog(@"doWhateverYouLove");
    if (_delegate&&[_delegate respondsToSelector:@selector(didDoWhateverYouLove)]) {
        [_delegate didDoWhateverYouLove];
    }
}
@end


@implementation WDWProtocolDidDo

-(void)didDoWhateverYouLove{
    NSLog(@"didDoWhateverYouLove");
}

-(void)didDoWhateverYouLike{
    NSLog(@"didDoWhateverYouLike");
}
@end