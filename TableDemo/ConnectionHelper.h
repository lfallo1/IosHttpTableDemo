//
//  UserConnection.h
//  TableDemo
//
//  Created by Lance Fallon on 4/23/15.
//  Copyright (c) 2015 Lance Fallon. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CustomTableViewDelegate.h"

@interface ConnectionHelper : NSURLConnection
-(id)initWithRequest:(NSURLRequest *)request sender:(id<CustomTableViewReloader>)tableReloaderDelegate;
-(void)makeRequest;
@end
