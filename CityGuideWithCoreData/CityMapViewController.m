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
  [self.mapView addAnnotation:self.city];
  [self centerMapAtCity:self.city animated:NO];
}

- (void)viewDidAppear:(BOOL)animated
{
  [super viewDidAppear:animated];

  [self.mapView selectAnnotation:self.city animated:YES];
}

#pragma mark - MKMapViewDelegate

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation
{
  NSString *annotationIdentifier = @"AnnotationViewReuseIdentifier";

  MKPinAnnotationView *view = (MKPinAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:annotationIdentifier];

  if (!view)
  {
    view = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:annotationIdentifier];
    view.canShowCallout = YES;
    view.pinColor = MKPinAnnotationColorGreen;
  }
  else
  {
    view.annotation = annotation;
  }

  return view;
}

#pragma mark - CityMapViewController

- (void)centerMapAtCity:(City *)city animated:(BOOL)animated
{
  MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance([city coordinate], 6000, 6000);
  [self.mapView setRegion:region animated:animated];
}

- (IBAction)refreshButtonPressed:(id)sender
{
//  [self googleGeocodeCity:self.city];
  [self appleGeocodeCity:self.city];
}

- (void)appleGeocodeCity:(City *)city
{
  CLGeocoder *geocoder = [[CLGeocoder alloc] init];
  NSString *fullCityName = [NSString stringWithFormat:@"%@ %@", self.city.cityName, self.city.inCountry.countryName];
  __block CityMapViewController *block_self = self;

  self.navigationItem.rightBarButtonItem.enabled = NO;
  [geocoder geocodeAddressString:fullCityName completionHandler:^(NSArray *placemarks, NSError *error) {
    if ([placemarks count] > 0)
    {
      CLPlacemark *placeMark = [placemarks objectAtIndex:0];
      self.city.coordinate = placeMark.location.coordinate;
      [block_self centerMapAtCity:self.city animated:YES];
      self.navigationItem.rightBarButtonItem.enabled = YES;
    }
  }];
}

- (void)googleGeocodeCity:(City *)city
{
  NSString *fullCityName = [NSString stringWithFormat:@"%@ %@", self.city.cityName, self.city.inCountry.countryName];
  NSString *googleAPIRequestString = [NSString stringWithFormat:@"http://maps.googleapis.com/maps/api/geocode/json?sensor=false&address=%@", [fullCityName stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
  NSURL *googleAPIRequestURL = [NSURL URLWithString:googleAPIRequestString];
  NSURLRequest *geocodeRequest = [NSURLRequest requestWithURL:googleAPIRequestURL];

  __block CityMapViewController *block_self = self;

  AFJSONRequestOperation *requestOperation = [AFJSONRequestOperation JSONRequestOperationWithRequest:geocodeRequest success:^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON) {

    NSDictionary *results = [[JSON objectForKey:@"results"] objectAtIndex:0];
    double latitude = [[results valueForKeyPath:@"geometry.location.lat"] doubleValue];
    double longitude = [[results valueForKeyPath:@"geometry.location.lng"] doubleValue];

    self.city.coordinate = CLLocationCoordinate2DMake(latitude,longitude);

    [block_self centerMapAtCity:self.city animated:YES];

    self.navigationItem.rightBarButtonItem.enabled = YES;

  } failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, id JSON) {
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:nil
                                                        message:@"Google geocode error"
                                                       delegate:nil
                                              cancelButtonTitle:@"Cancel"
                                              otherButtonTitles:nil];
    NSLog(@"%@",error);
    [alertView show];
    self.navigationItem.rightBarButtonItem.enabled = YES;
  }];

  [requestOperation start];
  self.navigationItem.rightBarButtonItem.enabled = NO;
}

@end
