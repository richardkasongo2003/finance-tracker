#import <Foundation/Foundation.h>

@interface ExpenseInputProcessor : NSObject

+ (NSString *)normalizedCategory:(NSString *)category;
+ (BOOL)isValidAmount:(double)amount;

@end
