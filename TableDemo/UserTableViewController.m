//
//  UserTableViewController.m
//  TableDemo
//
//  Created by Lance Fallon on 4/23/15.
//  Copyright (c) 2015 Lance Fallon. All rights reserved.
//

#import "UserTableViewController.h"
#import "ConnectionHelper.h"
#import "User.h"

@interface UserTableViewController ()
@property NSArray *users;
@property (strong, nonatomic) IBOutlet UITableView *myUserTableView;

@end

@implementation UserTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:@"http://jsonplaceholder.typicode.com/users"]];
    ConnectionHelper *connHelper = [[ConnectionHelper alloc]initWithRequest:request sender:self];
    
    //make request to web service.
    //once result is complete the reloadDate
    //method (implemented from the CustomTableViewReloader
    //protocol) will be invoked
    [connHelper makeRequest];
}

#pragma mark - CustomTableViewDelegateInfo

//after connHelper completes request it passes the response data to the jsonHelper, which
//returns a mutable array to this method
-(void)reloadData:(NSArray *)u{
    self.users = [[NSArray alloc]initWithArray:u];
    [self.myUserTableView reloadData];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return [self.users count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UserCell" forIndexPath:indexPath];
    
    //convert the dictionary item located at index[indexPath.row] to a user model then create cell
    NSDictionary *userDict = [self.users objectAtIndex:indexPath.row];
    User *user = [[User alloc]initWithName:[userDict objectForKey:@"name"] email:[userDict objectForKey:@"email"]];
    cell.textLabel.text = [user name];
    cell.detailTextLabel.text = [user email];
    return cell;
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

@end
