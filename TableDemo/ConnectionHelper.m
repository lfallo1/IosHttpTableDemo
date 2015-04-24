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
@property id<CustomTableViewReloader> tableReloaderDelegate;

@end

@implementation ConnectionHelper

-(id)initWithRequest:(NSURLRequest *)request sender:(id<CustomTableViewReloader>)tableReloaderDelegate{
    self.tableReloaderDelegate = tableReloaderDelegate;
    self.request = request;
    return self;
}

-(void)makeRequest{
    [[NSURLConnection alloc]initWithRequest:self.request delegate:self];
}

-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response{
    self._data = [[NSMutableData alloc]init];
}

-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error{
    NSLog(@"fail");
}

-(void)connection: (NSURLConnection *)connection didReceiveData:(NSData *)data {
    [self._data appendData:data];
}

-(void)connectionDidFinishLoading:(NSURLConnection *)connection{
    NSArray *jsonArray = (NSArray *)[NSJSONSerialization JSONObjectWithData:self._data options:NSJSONReadingMutableContainers error:nil];
    [self.tableReloaderDelegate reloadData:jsonArray];
}

@end
