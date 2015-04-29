//
//  UserConnection.m
//  TableDemo
//
//  Created by Lance Fallon on 4/23/15.
//  Copyright (c) 2015 Lance Fallon. All rights reserved.
//

#import "ConnectionHelper.h"

@interface ConnectionHelper()
@property NSMutableData *_data;
@property NSURLRequest *request;
@end

@implementation ConnectionHelper

-(id)initWithRequest:(NSURLRequest *)request {
    self = [super initWithRequest:request delegate:self];
    if(self){
        self.request = request;
    }
    return self;
}

-(void)makeRequestWithCallback:(void (^)(NSArray *))callback{
    [NSURLConnection sendAsynchronousRequest:self.request queue:[[NSOperationQueue alloc]init] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        
        //built in NSURLConnection callback
        dispatch_async(dispatch_get_main_queue(), ^(void){
            //should be checking for errors before processing data
            
            //parse data into array
            NSArray *jsonArray = (NSArray *)[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
            
            //custom callback used to update
            callback(jsonArray);
        });
    }];
}

@end
