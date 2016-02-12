//
//  Source.m
//  TopDrawer
//
//  Created by Carl Udren on 2/8/16.
//  Copyright © 2016 Carl Udren. All rights reserved.
//

#import "Source.h"

@implementation Source

- (instancetype) initWithName: (NSString *) name RSSURL: (NSString *) RSSURL{
    self = [super init];
    if (self) {
        _name = name;
        _RSSURL = RSSURL;
    }
    return self;
}

@end
