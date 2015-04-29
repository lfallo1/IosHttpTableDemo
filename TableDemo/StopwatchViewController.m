//
//  StopwatchViewController.m
//  TableDemo
//
//  Created by Lance Fallon on 4/25/15.
//  Copyright (c) 2015 Lance Fallon. All rights reserved.
//

#import "StopwatchViewController.h"

@interface StopwatchViewController()
{
    NSTimer *timer;
    NSDate *_startDate;
    NSDate *_endDate;
}
@end

@implementation StopwatchViewController

-(void)viewDidLoad{
    timer = nil;
}

-(void)startTimer{
    if(!timer){
        timer = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(updateTimer:) userInfo:nil repeats:YES];
        _startDate = [NSDate date];
    }
}

-(void)updateTimer:(NSTimer *)t{
    NSDate *currentDate = [NSDate date];
    NSCalendar *gregorianCalendar = [[NSCalendar alloc]initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    
    NSUInteger unitFlags = NSCalendarUnitHour | NSCalendarUnitMinute |  NSCalendarUnitSecond | NSCalendarUnitNanosecond;
    
    NSDateComponents *dateComponents = [gregorianCalendar components:unitFlags fromDate:_startDate toDate:currentDate options:0];
    
    NSString *hourMinuteSeconds = [NSString stringWithFormat:@"%02ld:%02ld:%02ld",[dateComponents hour],[dateComponents minute], [dateComponents second]];
    
    NSInteger nanoSingleDigit = [dateComponents nanosecond] / 100000000;;
    
    NSString *nanoSeconds = [NSString stringWithFormat:@".%ld",nanoSingleDigit];
    
    self.timeLabel.text = hourMinuteSeconds;
    self.nanoSecondLabel.text = nanoSeconds;
}

-(void)stopTimer{
    [timer invalidate];
    timer = nil;
    
    _endDate = [NSDate date];
    
    
}


-(void)resetTimer{
    [self stopTimer];
    _startDate = nil;
    _endDate = nil;
    self.timeLabel.text = @"00:00:00";
    self.nanoSecondLabel.text = @".0";
}

//triggered when START button is pressed
- (IBAction)startTimerPressed:(id)sender {
    [self startTimer];
}

//triggered when STOP button is pressed
- (IBAction)stopTimerPressed:(id)sender {
    [self stopTimer];
}

//triggered when RESET buttoon is pressed
- (IBAction)resetTimerPressed:(id)sender {
    [self resetTimer];
}

@end
