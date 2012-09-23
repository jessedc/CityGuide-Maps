//
//  MasterViewController.h
//  CityGuideWithCoreData
//
//  Created by Audrey Tam on 12/09/12.
//  Copyright (c) 2012 Audrey Tam. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Country;
#import "AddCountryTVC.h"

#import "CoreDataTableViewController.h" // so we can fetch

@interface MasterViewController : CoreDataTableViewController <AddCountryTVCDelegate>

@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (strong, nonatomic) Country *selectedCountry;

@end
