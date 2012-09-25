//
//  City.m
//  CityGuideWithCoreData
//
//  Created by Audrey Tam on 12/09/12.
//  Copyright (c) 2012 Audrey Tam. All rights reserved.
//

#import "City.h"
#import "Country.h"


@implementation City

@dynamic cityName;
@dynamic inCountry;
@synthesize coordinate = _coordinate;

- (CLLocationCoordinate2D)coordinate
{
  if (_coordinate.latitude == 0 && _coordinate.longitude == 0)
  {
    return CLLocationCoordinate2DMake(-37.813611, 144.963056); //Melbourne
  }
  return _coordinate;
}

- (NSString *)title
{
  return self.cityName;
}

@end
