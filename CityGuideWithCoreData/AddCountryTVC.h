//
//  AddCountryTVC.h
//  CityGuideWithCoreData
//
//  Created by Audrey Tam on 12/09/12.
//  Copyright (c) 2012 Audrey Tam. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Country;
/*
@protocol AddCountryTVCDelegate <NSObject>
- (void)saveButtonWasPressed:(Country *)country;
@end
*/
@interface AddCountryTVC : UITableViewController

@property (strong, nonatomic) IBOutlet UITableViewCell *nameCell;
@property (strong, nonatomic) IBOutlet UITextField *nameField;
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;
//@property (weak, nonatomic) id<AddCountryTVCDelegate> delegate;

- (IBAction)save:(id)sender;

@end
