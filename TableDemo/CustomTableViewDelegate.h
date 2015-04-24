//
//  CustomTableViewDelegate.h
//  TableDemo
//
//  Created by Lance Fallon on 4/23/15.
//  Copyright (c) 2015 Lance Fallon. All rights reserved.
//

@protocol CustomTableViewReloader
@required
-(void)reloadData:(NSArray *)arr;
@end
