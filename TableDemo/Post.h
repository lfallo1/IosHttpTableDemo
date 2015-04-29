//
//  Posts.h
//  TableDemo
//
//  Created by Lance Fallon on 4/24/15.
//  Copyright (c) 2015 Lance Fallon. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Post : NSObject
@property NSInteger userId;
@property NSString *title;
@property NSString *body;

-(id)initWithUserId:(NSInteger)uid title:(NSString *)t body:(NSString *)b;
@end
