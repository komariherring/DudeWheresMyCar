//
//  Car+CoreDataProperties.h
//  DudeWheresMyCar
//
//  Created by Komari Herring on 8/11/16.
//  Copyright © 2016 The Iron Yard. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Car.h"

NS_ASSUME_NONNULL_BEGIN

@interface Car (CoreDataProperties)

@property (nullable, nonatomic, retain) NSNumber *carLat;
@property (nullable, nonatomic, retain) NSNumber *carLong;
@property (nullable, nonatomic, retain) NSString *carDescription;
@property (nullable, nonatomic, retain) NSString *carDetail;

@end

NS_ASSUME_NONNULL_END
