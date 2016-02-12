//
//  DownloadManager.m
//  TopDrawer
//
//  Created by Carl Udren on 2/8/16.
//  Copyright © 2016 Carl Udren. All rights reserved.
//

#import "DownloadManager.h"
#import "ContentItem.h"
#import "Source.h"

@implementation DownloadManager

+ (void) contentForSource: (Source *) source completion:(void(^)(NSDictionary *content))completion {
    
   if (source.RSSURL == nil || completion == nil) {
       return;
   }
    
    NSString *urlString = source.RSSURL;
    NSURL *url = [[NSURL alloc] initWithString:urlString];
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url];
    NSURLSessionDataTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        
        if (!error) {
            NSError *jsonParsingError;
            NSDictionary *jsonData = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonParsingError];
            if (!jsonParsingError) {
                completion(jsonData);
            }
            return;
        }
        return;
    }];
    
    
    [task resume];
}

+ (void) rssContentForSource: (Source *) source completion:(void(^)(NSArray *content))completion {
    
    
}

    

+ (void)imageForPhoto:(NSString *)urlString completion:(void(^)(UIImage *image))completion{
    
    if (urlString == nil || completion == nil) {
        return;
    }
    
    NSURL *url = [[NSURL alloc] initWithString:urlString];
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url];
    NSURLSessionDownloadTask *task = [session downloadTaskWithRequest:request completionHandler:^(NSURL * _Nullable location, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSData *data = [[NSData alloc] initWithContentsOfFile:[location path]];
        UIImage *image = [[UIImage alloc] initWithData:data];
        
        
        dispatch_async(dispatch_get_main_queue(), ^{
            completion(image);
        });
    }];
    [task resume];}




@end
