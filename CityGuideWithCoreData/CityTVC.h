//
//  CityTVC.h
//  CityGuideWithCoreData
//
//  Created by Audrey Tam on 12/09/12.
//  Copyright (c) 2012 Audrey Tam. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CoreDataTableViewController.h" 

@class Country;
#import "AddCityTVC.h"

@interface CityTVC : CoreDataTableViewController <AddCityTVCDelegate>

@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (strong, nonatomic) Country *selectedCountry;

@end
