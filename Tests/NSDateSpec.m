//
// Created by azu on 2013/02/15.
//


#import "Kiwi.h"
#import "NSDate+AZBuilder.h"
#import "NSDate-AZUtilities.h"
#import "KWBeTrueMatcher.h"

@interface NSDateSpec : KWSpec

@end

@implementation NSDateSpec

#define DATE_COMPONENTS (NSYearCalendarUnit| NSMonthCalendarUnit | NSDayCalendarUnit | NSWeekCalendarUnit |  NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit | NSWeekdayCalendarUnit | NSWeekdayOrdinalCalendarUnit)
#define CURRENT_CALENDAR [NSCalendar currentCalendar]
+ (void)buildExampleGroups {
    describe(@"NSDateSpec", ^{
        NSDate *today = [NSDate date];
        describe(@"#dateAtEndOfDay", ^{
            context(@"when pass today", ^{
                it(@"should be today", ^{
                    NSDateComponents *components = [CURRENT_CALENDAR components:DATE_COMPONENTS fromDate:today];

                });
            });
        });
        context(@"differecen year of A and B but same time", ^{
            __block NSDate *dateA;
            __block NSDate *dateB;
            beforeEach(^{
                dateA = [NSDate createNSDate:@{
                        AZDateBuilderUnit.year : @2000,// <=
                        AZDateBuilderUnit.month : @5,
                        AZDateBuilderUnit.day : @5,
                        AZDateBuilderUnit.hour : @10,
                        AZDateBuilderUnit.minute : @10,
                        AZDateBuilderUnit.second : @10
                }];
                dateB = [NSDate createNSDate:@{
                        AZDateBuilderUnit.year : @1000,// <=
                        AZDateBuilderUnit.month : @5,
                        AZDateBuilderUnit.day : @5,
                        AZDateBuilderUnit.hour : @10,
                        AZDateBuilderUnit.minute : @10,
                        AZDateBuilderUnit.second : @10
                }];
            });

            describe(@"isEarlierThanDateByTime", ^{
                it(@"return NO", ^{
                    [[theValue([dateA isEarlierThanDateByTime:dateB]) should] beNo];
                });
            });
            describe(@"isLaterThanDateByTime", ^{
                it(@"return NO", ^{
                    [[theValue([dateA isLaterThanDateByTime:dateB]) should] beNo];
                });
            });
        });
        context(@"differecen time of A and B ", ^{
            __block NSDate *dateA;
            __block NSDate *dateB;
            beforeEach(^{
                dateA = [NSDate createNSDate:@{
                        AZDateBuilderUnit.year : @2000,
                        AZDateBuilderUnit.month : @5,
                        AZDateBuilderUnit.day : @5,
                        AZDateBuilderUnit.hour : @20,// <=
                        AZDateBuilderUnit.minute : @10,
                        AZDateBuilderUnit.second : @10
                }];
                dateB = [NSDate createNSDate:@{
                        AZDateBuilderUnit.year : @2000,
                        AZDateBuilderUnit.month : @5,
                        AZDateBuilderUnit.day : @5,
                        AZDateBuilderUnit.hour : @10,// <=
                        AZDateBuilderUnit.minute : @10,
                        AZDateBuilderUnit.second : @10
                }];
            });

            describe(@"isEarlierThanDateByTime", ^{
                it(@"return NO", ^{
                    [[theValue([dateA isEarlierThanDateByTime:dateB]) should] beNo];
                });
            });
            describe(@"isLaterThanDateByTime", ^{
                it(@"return NO", ^{
                    [[theValue([dateA isLaterThanDateByTime:dateB]) should] beYes];
                });
            });
        });
        context(@"differecen time second of A and B ", ^{
            __block NSDate *dateA;
            __block NSDate *dateB;
            beforeEach(^{
                dateA = [NSDate createNSDate:@{
                        AZDateBuilderUnit.year : @2000,
                        AZDateBuilderUnit.month : @5,
                        AZDateBuilderUnit.day : @5,
                        AZDateBuilderUnit.hour : @10,
                        AZDateBuilderUnit.minute : @10,
                        AZDateBuilderUnit.second : @10// <=
                }];
                dateB = [NSDate createNSDate:@{
                        AZDateBuilderUnit.year : @2000,
                        AZDateBuilderUnit.month : @5,
                        AZDateBuilderUnit.day : @5,
                        AZDateBuilderUnit.hour : @10,
                        AZDateBuilderUnit.minute : @10,
                        AZDateBuilderUnit.second : @58// <=
                }];
            });

            describe(@"isEarlierThanDateByTime", ^{
                it(@"return NO", ^{
                    [[theValue([dateA isEarlierThanDateByTime:dateB]) should] beYes];
                });
            });
            describe(@"isLaterThanDateByTime", ^{
                it(@"return NO", ^{
                    [[theValue([dateA isLaterThanDateByTime:dateB]) should] beNo];
                });
            });
        });
    });
}

@end