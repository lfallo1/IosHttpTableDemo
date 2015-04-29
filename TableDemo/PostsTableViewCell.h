//
//  PostsTableViewCell.h
//  TableDemo
//
//  Created by Lance Fallon on 4/24/15.
//  Copyright (c) 2015 Lance Fallon. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Post.h"

@interface PostsTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *postsTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *postsBodyLabel;
@property (weak, nonatomic) IBOutlet UILabel *postsUsernameLabel;
-(void)setModel:(Post *)post;
@end
