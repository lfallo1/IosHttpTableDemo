//
//  User.m
//  TableDemo
//
//  Created by Lance Fallon on 4/23/15.
//  Copyright (c) 2015 Lance Fallon. All rights reserved.
//

#import "User.h"

@implementation User

-(id)initWithName:(NSString *)n email:(NSString *)e{
    self = [super init];
    if(self)
    {
        self.name = n;
        self.email = e;
    }
    return self;
}

@end
