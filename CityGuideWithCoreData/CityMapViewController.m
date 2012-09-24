//
//  CityMapViewController.m
//  CityGuideWithCoreData
//
//  Created by Jesse Collis on 24/09/12.
//

#import "CityMapViewController.h"

#import "City.h"      // we need these two to use the properties of City and Country
#import "Country.h"
#import "AFJSONRequestOperation.h"
#import <CoreLocation/CoreLocation.h>

@interface CityMapViewController ()
@end

@implementation CityMapViewController
@synthesize mapView = _mapView;
@synthesize city = _city;

#pragma mark - View Lifecycle

- (void)viewDidLoad
{
  [super viewDidLoad];
  self.navigationItem.title = NSLocalizedString(@"Map", @"Map View Controller navigation item title");
  self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemRefresh
                                                                                         target:self
                                                                                         action:@selector(refreshButtonPressed:)];
}

- (void)didReceiveMemoryWarning
{
  [super didReceiveMemoryWarning];
}

- (void)viewDidUnload
{
  [self setMapView:nil];
  [super viewDidUnload];
}

- (void)viewWillAppear:(BOOL)animated
{
  [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
  [super viewDidAppear:animated];

  [self.mapView selectAnnotation:self.city animated:YES];
}

#pragma mark - MKMapViewDelegate

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation
{

}

#pragma mark - CityMapViewController

- (void)centerMapAtCity:(City *)city animated:(BOOL)animated
{
	
}

- (IBAction)refreshButtonPressed:(id)sender
{
//  [self googleGeocodeCity:self.city];
  [self appleGeocodeCity:self.city];
}

- (void)appleGeocodeCity:(City *)city
{
}

- (void)googleGeocodeCity:(City *)city
{

}

@end
