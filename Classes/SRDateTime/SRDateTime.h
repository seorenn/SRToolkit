//
//  TimeHelper.h
//  iCoupleVow
//
//  Created by Seorenn <hirenn@gmail.com>
//

#import <Foundation/Foundation.h>

@interface SRDateTime : NSObject {
    int year;
    int month;
    int day;
    int hour;
    int minute;
    int second;
}

@property (nonatomic, assign) int year;
@property (nonatomic, assign) int month;
@property (nonatomic, assign) int day;
@property (nonatomic, assign) int hour;
@property (nonatomic, assign) int minute;
@property (nonatomic, assign) int second;

- (id)initWithNSDate:(NSDate *)date;
- (NSDate *)nsDate;

+ (SRDateTime *)dateTimeFromNSDate:(NSDate *)date;

@end
