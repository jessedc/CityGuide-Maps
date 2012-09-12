//
//  AddCityTVC.h
//  CityGuideWithCoreData
//
//  Created by Audrey Tam on 12/09/12.
//  Copyright (c) 2012 Audrey Tam. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Country;

@interface AddCityTVC : UITableViewController

@property (strong, nonatomic) IBOutlet UITableViewCell *nameCell;
@property (strong, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) Country *selectedCountry;

@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;

- (IBAction)save:(id)sender;

@end
