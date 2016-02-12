//
//  Source.h
//  TopDrawer
//
//  Created by Carl Udren on 2/8/16.
//  Copyright © 2016 Carl Udren. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Source : NSObject

@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *RSSURL;

- (instancetype) initWithName: (NSString *) name RSSURL: (NSString *) RSSURL;

@end
