//
//  CityMapViewController.h
//  CityGuideWithCoreData
//
//  Created by Jesse Collis on 24/09/12.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h> // required so our class knows about the delegate protocol

@class City;

@interface CityMapViewController : UIViewController <MKMapViewDelegate>
@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property (nonatomic, strong) City *city;
@end
