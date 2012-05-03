//
//  TimeHelper.m
//  iCoupleVow
//
//  Created by Seorenn <hirenn@gmail.com>
//

#import "SRDateTime.h"

@implementation SRDateTime

@synthesize year;
@synthesize month;
@synthesize day;
@synthesize hour;
@synthesize minute;
@synthesize second;

- (id)initWithNSDate:(NSDate *)date
{
    self = [super init];
    if (self) {
        NSCalendar* calendar = [NSCalendar currentCalendar];
        NSDateComponents* components = [calendar components:NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit | NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit fromDate:date];
        
        self.year = [components year];
        self.month = [components month];
        self.day = [components day];
        self.hour = [components hour];
        self.minute = [components minute];
        self.second = [components second];
    }
    
    return self;
}

- (NSDate *)nsDate
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *components = [[NSDateComponents alloc] init];
    
    [components setDay:self.day];
    [components setMonth:self.month];
    [components setYear:self.year];
    [components setHour:self.hour];
    [components setMinute:self.minute];
    [components setSecond:self.second];
    
    NSDate *date = [calendar dateFromComponents:components];
    
    return date;

}

+ (SRDateTime *)dateTimeFromNSDate:(NSDate *)date
{
    return [[SRDateTime alloc] initWithNSDate:date];
}

@end
