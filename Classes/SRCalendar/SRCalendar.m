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

// TODO: test codes
+ (void)test
{
    NSDate *now = [NSDate date];
    SRCalendar *cal = [[SRCalendar alloc] init];
    cal.date = now;
    
    NSLog(@"now: %@", now);
    NSLog(@"days: %d", [cal days]);
    NSLog(@"shift: %d", [cal shift]);
    
    [cal stepMonth:1];
    NSLog(@"nextMonth: %@", cal.date);
    NSLog(@"days: %d", [cal days]);
    NSLog(@"shift: %d", [cal shift]);
    
    [cal stepMonth:-2];
    NSLog(@"prevMonth: %@", cal.date);
    NSLog(@"days: %d", [cal days]);
    NSLog(@"shift: %d", [cal shift]);
    
    [cal stepMonth:-11];
    NSLog(@"prevYear: %@", cal.date);
    NSLog(@"days: %d", [cal days]);
    NSLog(@"shift: %d", [cal shift]);

    [cal stepMonth:12];
    NSLog(@"nextYear: %@", cal.date);
    NSLog(@"days: %d", [cal days]);
    NSLog(@"shift: %d", [cal shift]);
    
    NSLog(@"week names----");
    for (NSString *weekName in [cal weekNames]) {
        // if your localzation was country using multi-byte language
        //     (eg. Chinese, Japanese or Korean, etc...),
        //     this code will log invalid chanracters or spaces or none.
        // If you want to watch this multi-byte character in log-window,
        //     switch your debugger to GDB from LLDB.
        NSLog(@"%@", weekName);
    }
}

@end
