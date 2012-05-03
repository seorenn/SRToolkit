//
//  SRCalendar.h
//  SRToolkit
//
//  Created by Seorenn <hirenn@gmail.com>
//

#import <Foundation/Foundation.h>

@interface SRCalendar : NSObject {
    int _shift;
    int _count;
}

@property (nonatomic, weak) NSDate *date;
@property (nonatomic, strong) NSCalendar *calendar;

// TODO: test codes
+ (void)test;

- (int)shift;
- (int)days;
- (void)stepMonth:(int)month;
- (NSArray *)weekNames;

@end
