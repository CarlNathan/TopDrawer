//
//  DownloadManager.h
//  TopDrawer
//
//  Created by Carl Udren on 2/8/16.
//  Copyright © 2016 Carl Udren. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Source.h"

@interface DownloadManager : NSObject

+ (void) contentForSource: (Source *) source completion:(void(^)(NSDictionary *content))completion;

+ (void)imageForPhoto:(NSString *)urlString completion:(void(^)(UIImage *image))completion;

@end
