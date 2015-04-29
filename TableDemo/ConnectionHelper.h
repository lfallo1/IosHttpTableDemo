//
//  UserConnection.h
//  TableDemo
//
//  Created by Lance Fallon on 4/23/15.
//  Copyright (c) 2015 Lance Fallon. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ConnectionHelper : NSURLConnection
-(id)initWithRequest:(NSURLRequest *)request;
-(void)makeRequestWithCallback:(void(^)(NSArray *))callback;
@end
