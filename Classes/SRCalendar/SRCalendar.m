//
//  SRCalendar.m
//  SRToolkit
//
//  Created by Seorenn <hirenn@gmail.com>
//

#import "SRCalendar.h"

@implementation SRCalendar

@synthesize date = _date;
@synthesize calendar = _calendar;

- (id)init
{
    self = [super init];
    if (self) {
        self.calendar = [NSCalendar currentCalendar];
        self.date = [NSDate date];
    }
    return self;
}

- (NSDate *)monthStartDate
{
    NSDateComponents *components = [self.calendar components:NSMonthCalendarUnit | NSYearCalendarUnit fromDate:self.date];
    components.day = 1;
    return [self.calendar dateFromComponents:components];
}

- (void)stepMonth:(int)month
{
    NSDateComponents *monthStep = [[NSDateComponents alloc] init];
    monthStep.month = month;
    self.date = [self.calendar dateByAddingComponents:monthStep toDate:self.date options:0];
}

// count of empty space before first day(1)
- (int)shift
{
    NSDateComponents *components = [self.calendar components:NSWeekdayCalendarUnit fromDate:[self monthStartDate]];
    NSInteger shift = components.weekday - self.calendar.firstWeekday;
    if (shift < 0) {
        shift = 7 + shift;
    }
    
    return shift;
}

// count of days: it's same to last day of month
- (int)days
{
    NSRange range = [self.calendar rangeOfUnit:NSDayCalendarUnit inUnit:NSMonthCalendarUnit forDate:self.date];
    return range.length;
}

// returns array of NSString *
- (NSArray *)weekNames
{
    NSMutableArray __autoreleasing *names = [[NSMutableArray alloc] init];
    
    NSDateFormatter *dateFromatter = [[NSDateFormatter alloc] init];
    dateFromatter.calendar = self.calendar;
    
    for (int i = self.calendar.firstWeekday; i < self.calendar.firstWeekday + 7; i++) {
        int index = (i - 1) < 7 ? (i - 1) : ((i - 1) - 7);
        
        NSString *weekName = [[dateFromatter shortWeekdaySymbols] objectAtIndex:index];
        [names addObject:weekName];
    }
    
    return names;
}

// returns number of weeks (eg. count of calendar row)
- (int)weeks
{
    int num = [self days] + [self shift];
    int weeks = num / 7;
    if (num % 7 > 0) weeks++;
    
    return weeks;
}

- (BOOL)isSundayWithDay:(int)day
{
    int daysOfFirstWeek = 7 - [self shift];
    if (daysOfFirstWeek > 0 && day <= daysOfFirstWeek) {
        return NO;
    }
    
    if ((day - (daysOfFirstWeek+1)) % 7 == 0) return YES;
    
    return NO;
}

- (BOOL)isSaturdayWithDay:(int)day
{
    int daysOfFirstWeek = 7 - [self shift];
    if (daysOfFirstWeek > 0 && day <= daysOfFirstWeek) {
        if (day == daysOfFirstWeek) return YES;
        return NO;
    }
    
    if ((day - (daysOfFirstWeek+1)) % 7 == 6) return YES;
    
    return NO;
}

@end
