//
//  C4QCatSavedTableViewController.m
//  unit-3-final-app-assessment
//
//  Created by Fatima Zenine Villanueva on 12/19/15.
//  Copyright © 2015 Michael Kavouras. All rights reserved.
//

#import "C4QCatSavedTableViewController.h"

@interface C4QCatSavedTableViewController ()

@property (nonatomic) NSMutableArray *defaulArray;

@end

@implementation C4QCatSavedTableViewController


- (void )loadDefaultArray {
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    NSArray *userDefaultKeys = [[[NSUserDefaults standardUserDefaults] dictionaryRepresentation] allKeys];
    
    
    BOOL isCatThere = [userDefaultKeys containsObject: @"cat"];
    
    if (isCatThere){
        NSArray *catArray =  [defaults objectForKey:@"cat"];
        NSMutableArray *catMutableArray = [catArray mutableCopy];
        self.defaulArray = catMutableArray;
    }
    
    NSLog(@"%@", [defaults objectForKey:@"cat"]);
}

#pragma mark
#pragma mark - Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    // alloc init mutable array
    self.defaulArray = [[NSMutableArray alloc]init];
    
    // load NSDefault array
    [self loadDefaultArray];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark
#pragma mark - Table View Data Source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.defaulArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"DefaultIdentifier" forIndexPath:indexPath];
    
    cell.textLabel.text = [self.defaulArray objectAtIndex:indexPath.row];
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
