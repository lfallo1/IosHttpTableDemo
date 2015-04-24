//
//  User.h
//  TableDemo
//
//  Created by Lance Fallon on 4/23/15.
//  Copyright (c) 2015 Lance Fallon. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject
@property NSString *name;
@property NSString *email;

-(id)initWithName:(NSString *)n email:(NSString *)e;
@end
