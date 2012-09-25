//
//  AddCityTVC.m
//  CityGuideWithCoreData
//
//  Created by Audrey Tam on 12/09/12.
//  Copyright (c) 2012 Audrey Tam. All rights reserved.
//

#import "AddCityTVC.h"
#import "City.h"
#import "Country.h"

@implementation AddCityTVC

@synthesize nameCell = _nameCell;
@synthesize nameField = _nameField;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.navigationItem.title = NSLocalizedString(@"Add City", @"Add City ViewController NavigationItem title");
    self.navigationItem.rightBarButtonItem =
    [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:self action:@selector(save:)];
}

- (IBAction)save:(id)sender {
    
    if ( self.nameField.text.length > 0 ) {
        // instead of saving managedObjectContext here, tell delegate to save new city
        if (self.delegate && [self.delegate respondsToSelector:
                              @selector(cityDidGetAdded:)]) {
            [self.delegate cityDidGetAdded:self];
        }
    }
    
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)viewDidUnload
{
  [self setNameCellLabel:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
  self.nameCellLabel.text = NSLocalizedString(@"City", @"New City 'Name Cell' label");
  return self.nameCell;
}

@end
