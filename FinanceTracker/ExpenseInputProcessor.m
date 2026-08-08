#import "ExpenseInputProcessor.h"
#import <math.h>

@implementation ExpenseInputProcessor

+ (NSString *)normalizedCategory:(NSString *)category {
    NSString *trimmedCategory = [category stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];

    if (trimmedCategory.length == 0) {
        return @"Other";
    }

    NSDictionary<NSString *, NSString *> *aliases = @{
        @"groceries": @"Food",
        @"grocery": @"Food",
        @"food": @"Food",
        @"restaurant": @"Food",
        @"uber": @"Transportation",
        @"lyft": @"Transportation",
        @"transport": @"Transportation",
        @"transportation": @"Transportation",
        @"rent": @"Housing",
        @"housing": @"Housing",
        @"shopping": @"Shopping",
        @"clothes": @"Shopping",
        @"movie": @"Entertainment",
        @"entertainment": @"Entertainment"
    };

    NSString *normalizedInput = [trimmedCategory lowercaseString];
    NSString *mappedCategory = aliases[normalizedInput];

    if (mappedCategory != nil) {
        return mappedCategory;
    }

    return [trimmedCategory capitalizedStringWithLocale:[NSLocale currentLocale]];
}

+ (BOOL)isValidAmount:(double)amount {
    return isfinite(amount) && amount > 0;
}

@end
