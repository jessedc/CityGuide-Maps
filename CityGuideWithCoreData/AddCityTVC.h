//
//  AddCityTVC.h
//  CityGuideWithCoreData
//
//  Created by Audrey Tam on 12/09/12.
//  Copyright (c) 2012 Audrey Tam. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Country;
@class AddCityTVC;

@protocol AddCityTVCDelegate <NSObject>

- (void)cityDidGetAdded:(AddCityTVC *)tvc;

@end

@interface AddCityTVC : UITableViewController

@property (strong, nonatomic) IBOutlet UITableViewCell *nameCell;
@property (strong, nonatomic) IBOutlet UITextField *nameField;

@property (weak, nonatomic) id<AddCityTVCDelegate> delegate;
- (IBAction)save:(id)sender;

@end
