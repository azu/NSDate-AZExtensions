//
// Created by azu on 2013/01/28.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "NSDate+AZBuilder.h"

const struct AZDateBuilderUnit AZDateBuilderUnit = {
        .era = @"era",
        .year = @"year",
        .month = @"month",
        .day = @"day",
        .hour = @"hour",
        .minute = @"minute",
        .second = @"second",
        .week = @"week",
        .weekday = @"weekday",
        .weekdayOrdinal = @"weekdayOrdinal",
        .quarter = @"quarter",
        .weekOfMonth = @"weekOfMonth",
        .weekOfYear = @"weekOfYear",
        .yearForWeekOfYear = @"yearForWeekOfYear"
};

@implementation NSDate (AZBuilder)
+ (NSCalendar *)calendar {
    static NSCalendar *calendarInstance;
    if (!calendarInstance) {
        calendarInstance = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    }
    return calendarInstance;
}

+ (NSDate *)createNSDate:(NSDictionary *)builderUnit {
    NSCalendar *calendar = [self calendar];
    NSDateComponents *dateComponents = [[NSDateComponents alloc] init];
    dateComponents.calendar = calendar;
    for (NSString *key in [builderUnit allKeys]) {
        NSNumber *number = builderUnit[key];
        NSAssert([number isKindOfClass:[NSNumber class]], @"Value is not kind of NSNumber Class");
        [dateComponents setValue:number forKey:key];
    }

    NSDate *resultDate = [calendar dateFromComponents:dateComponents];
    return resultDate;
}

@end