//
//  SavedContentItem+CoreDataProperties.h
//  TopDrawer
//
//  Created by Carl Udren on 2/9/16.
//  Copyright © 2016 Carl Udren. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "SavedContentItem.h"

NS_ASSUME_NONNULL_BEGIN

@interface SavedContentItem (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *byLine;
@property (nullable, nonatomic, retain) NSString *date;
@property (nullable, nonatomic, retain) NSString *imageURLString;
@property (nullable, nonatomic, retain) NSString *title;
@property (nullable, nonatomic, retain) NSString *urlString;

@end

NS_ASSUME_NONNULL_END
