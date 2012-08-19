#import "QBaseTestCase.h"
#import "NSString+Q.h"

@interface NSCategoryTest : QBaseTestCase {} @end


@implementation NSCategoryTest

- (void)testCropping {
    NSString *longStr = @"It is possible to subclass NSString (and NSMutableString), but doing so requires providing storage facilities for the string (which is not inherited by subclasses) and implementing two primitive methods. The abstract NSString and NSMutableString classes are the public interface of a class cluster consisting mostly of private, concrete classes that create and return a string object appropriate for a given situation. Making your own concrete subclass of this cluster imposes certain requirements (discussed in “Methods to Override”).";
    
    NSString *croppedTo5 = [longStr stringByCroppingToLength:5];
    assertThat(croppedTo5, equalTo(@"It is..."));
    
    NSString *shortStr = @"12345";
    NSString *shortCropped = [shortStr stringByCroppingToLength:5];
    assertThat(shortCropped, equalTo(@"12345"));
    
    NSString *shortStr2 = @"123456";
    NSString *shortCropped2 = [shortStr2 stringByCroppingToLength:5];
    assertThat(shortCropped2, equalTo(@"12345..."));
    
    assertThat(longStr.stringByCropping, isNot(nilValue()));
}

- (void)testTrimming {
    NSString *strToTrim = @"     \n     ABC       \n     \n   ";
    NSString *trimmedStr = [strToTrim stringByTrimmingWsAndNl];
    
    assertThat(trimmedStr, equalTo(@"ABC"));
}

@end
