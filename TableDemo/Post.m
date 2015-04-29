//
//  Posts.m
//  TableDemo
//
//  Created by Lance Fallon on 4/24/15.
//  Copyright (c) 2015 Lance Fallon. All rights reserved.
//

#import "Post.h"

@implementation Post
-(id)initWithUserId:(NSInteger)uid title:(NSString *)t body:(NSString *)b{
    self = [super init];
    if(self){
        [self setUserId:uid];
        [self setTitle:t];
        [self setBody:b];
    }
    return self;
}


@end
