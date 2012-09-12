//
//  City.h
//  CityGuideWithCoreData
//
//  Created by Audrey Tam on 12/09/12.
//  Copyright (c) 2012 Audrey Tam. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Country;

@interface City : NSManagedObject

@property (nonatomic, retain) NSString * cityName;
@property (nonatomic, retain) Country *inCountry;

@end
