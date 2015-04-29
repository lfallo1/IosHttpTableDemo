//
//  HomeTableViewController.m
//  TableDemo
//
//  Created by Lance Fallon on 4/24/15.
//  Copyright (c) 2015 Lance Fallon. All rights reserved.
//

#import "HomeViewController.h"

@interface HomeViewController()
{
    NSMutableArray *menuItems;
    NSMutableArray *categories;
}
@end

@implementation HomeViewController
#pragma mark - Table view data source

-(void)viewDidLoad{
    menuItems = [[NSMutableArray alloc]initWithObjects:@"Home", @"About", @"Contact", nil];
    categories = [[NSMutableArray alloc]initWithObjects:@"Electronics", @"Appliances", @"Furnature", nil];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    if(tableView == self.MenuTableView){
        return [menuItems count];
    }
    else{
        return [categories count];
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = nil;
    //determine which table is being used
    if(tableView == self.MenuTableView){
        //create a generic UITableViewCell then set the label
        cell = [tableView dequeueReusableCellWithIdentifier:@"MenuItemCell" forIndexPath:indexPath];
        cell.textLabel.text = [menuItems objectAtIndex:indexPath.row];
    }
    else{
        //create a generic UITableViewCell then set the label and detailLabel
        cell = [tableView dequeueReusableCellWithIdentifier:@"CategoryItemCell" forIndexPath:indexPath];
        cell.textLabel.text = [categories objectAtIndex:indexPath.row];
        cell.detailTextLabel.text = [[NSNumber numberWithInteger: indexPath.row ] stringValue];
    }
    
    return cell;
}

-(void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath{
    NSString *title = [menuItems objectAtIndex:indexPath.row];
    NSString *msg;
    
    if([title isEqualToString:@"Home"]){
        msg = @"Home page information";
    }
    else if([title isEqualToString:@"About"]){
        msg = @"Home page information";
    }
    else if([title isEqualToString:@"Contact"]){
        msg = @"Click row to contact app owner";
    }
    else{
        msg = @"Sample App";
    }
    
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:title message:msg delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alert show];
}

@end
