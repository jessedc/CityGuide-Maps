//
//  City.h
//  CityGuideWithCoreData
//
//  Created by Audrey Tam on 12/09/12.
//  Copyright (c) 2012 Audrey Tam. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import <MapKit/MapKit.h>

@class Country;

@interface City : NSManagedObject <MKAnnotation>

@property (nonatomic, retain) NSString * cityName;
@property (nonatomic, retain) Country *inCountry;

//the MKAnnotation Protocol does not implement this as readwrite. We are so we can set the value
@property (nonatomic, readwrite) CLLocationCoordinate2D coordinate;

@end
