//
//  PostsTableViewController.m
//  TableDemo
//
//  Created by Lance Fallon on 4/24/15.
//  Copyright (c) 2015 Lance Fallon. All rights reserved.
//

#import "PostsTableViewController.h"
#import "ConnectionHelper.h"
#import "Post.h"
#import "PostsTableViewCell.h"

@interface PostsTableViewController()
    @property NSArray *posts;
    @property IBOutlet UITableView *myPostsTableView;
@end

@implementation PostsTableViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:@"http://jsonplaceholder.typicode.com/posts"]];
    ConnectionHelper *connHelper = [[ConnectionHelper alloc]initWithRequest:request];
    
    //make request to web service, then await callback with data array
    [connHelper makeRequestWithCallback:^void(NSArray *a) {
        self.posts = [[NSArray alloc]initWithArray:a];
        [self.myPostsTableView reloadData];
    }];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return [self.posts count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    //convert the dictionary item located at index[indexPath.row] to a user model then create cell
    NSDictionary *postDict = [self.posts objectAtIndex:indexPath.row];
    
    NSString *uidAsString = [postDict objectForKey:@"userId"];
    NSInteger uid = [uidAsString integerValue];
    NSString *t = [postDict objectForKey:@"title"];
    NSString *b = [postDict objectForKey:@"body"];
    Post *post = [[Post alloc]initWithUserId:uid title:t body:b];
    
    //create custom cell, and set values
    PostsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PostCell" forIndexPath:indexPath];
    [cell setModel:post];
    
    return cell;
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
@end
