//
//  Source.m
//  TopDrawer
//
//  Created by Carl Udren on 2/8/16.
//  Copyright © 2016 Carl Udren. All rights reserved.
//

#import "Source.h"

@implementation Source

- (instancetype) initWithName: (NSString *) name image: (UIImage *) image apiURL: (NSString *) apiURL{
    self = [super init];
    if (self) {
        _name = name;
        _image = image;
        _apiURL = apiURL;
    }
    return self;
}

@end
