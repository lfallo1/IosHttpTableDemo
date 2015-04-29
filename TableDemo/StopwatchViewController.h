//
//  StopwatchViewController.h
//  TableDemo
//
//  Created by Lance Fallon on 4/25/15.
//  Copyright (c) 2015 Lance Fallon. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StopwatchViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UILabel *nanoSecondLabel;
@end
