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

@property (nonatomic, strong) NSDate *date;
@property (nonatomic, strong) NSCalendar *calendar;

- (int)shift;
- (int)days;
- (int)weeks;
- (void)stepMonth:(int)month;
- (NSArray *)weekNames;
- (BOOL)isSundayWithDay:(int)day;
- (BOOL)isSaturdayWithDay:(int)day;

@end
