
#import "Constant.h"
@implementation Constant
+(NSString *)validString :(NSString *)str {
    if (str == (id)[NSNull null] || str.length == 0 ) {
        return nil;
    }
    return str;
}

@end
