//
//  PostsTableViewCell.m
//  TableDemo
//
//  Created by Lance Fallon on 4/24/15.
//  Copyright (c) 2015 Lance Fallon. All rights reserved.
//

#import "PostsTableViewCell.h"

@implementation PostsTableViewCell

-(void)setModel:p{
    self.postsTitleLabel.text = [p title];
    self.postsBodyLabel.text = [p body];
    self.postsUsernameLabel.text = [[NSNumber numberWithInteger:[p userId]] stringValue];
}

@end
