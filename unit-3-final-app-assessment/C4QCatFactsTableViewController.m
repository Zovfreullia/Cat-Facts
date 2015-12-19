//
//  C4QCatsTableViewController.m
//  unit-3-final-assessment
//
//  Created by Michael Kavouras on 12/17/15.
//  Copyright © 2015 Michael Kavouras. All rights reserved.
//

#import "C4QCatFactsTableViewController.h"
#import "C4QCustomTableViewCell.h"

#define CAT_API_URL @"http://catfacts-api.appspot.com/api/facts?number=100"

@interface C4QCatFactsTableViewController ()

@end

@implementation C4QCatFactsTableViewController


#pragma mark
#pragma mark - Life Cycle Methods
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // tell the table view to auto adjust the height of each cell
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.estimatedRowHeight = 15.0;
    
    // grab the nib from the main bundle
    UINib *nib = [UINib nibWithNibName:@"C4QCustomCell" bundle:nil];
    
    // register the nib for the cell identifer
    [self.tableView registerNib:nib forCellReuseIdentifier:@"C4QCustomCellIdentifier"];
}


#pragma mark
#pragma mark - Table View Data Source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    C4QCustomTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"C4QCustomCellIdentifier" forIndexPath:indexPath];
    
    cell.catFactsLabel.text = @"butt butt buttbuttbuttbuttbuttbuttbuttbuttbuttbuttbuttbuttbuttbuttbuttbuttbuttbuttbuttbuttbuttbuttbuttbuttbuttbuttbuttbuttbuttbuttbuttbuttbuttbuttbuttbuttbuttbuttbuttbuttbuttbuttbuttbuttbuttbuttbutt butt buttbuttbuttbuttbuttbuttbuttbuttbuttbuttbuttbuttbuttbuttbuttbuttbuttbuttbuttbuttbuttbuttbuttbuttbuttbuttbuttbuttbuttbuttbuttbuttbuttbuttbuttbuttbuttbuttbuttbuttbuttbuttbuttbuttbuttbuttbutt butt buttbuttbuttbuttbuttbuttbuttbuttbuttbuttbuttbuttbuttbuttbuttbuttbuttbuttbuttbuttbuttbuttbuttbuttbuttbuttbuttbuttbuttbuttbuttbuttbuttbuttbuttbuttbuttbuttbuttbuttbuttbuttbuttbuttbuttbuttbutt butt buttbuttbuttbuttbuttbuttbuttbuttbuttbuttbuttbuttbuttbuttbuttbuttbuttbuttbuttbuttbuttbuttbuttbuttbuttbuttbuttbuttbuttbuttbuttbuttbuttbuttbuttbuttbuttbuttbuttbuttbuttbuttbuttbuttbuttbutt";
    
    return cell;
}



@end
