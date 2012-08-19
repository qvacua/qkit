#import <Qkit/Qkit.h>
#import "QBaseTestCase.h"

@interface GeometryUtilsTest : QBaseTestCase {} @end

@implementation GeometryUtilsTest

- (void)testRects {
    NSRect rect = NSMakeRect(23.1, 3243.1, 349.4, 342.1);

    assertThatRect(rect, equalToRect(NewRect(rect.origin.x, rect.origin.y, rect.size.width, rect.size.height)));
    assertThatRect(rect, equalToRect(NewRectWithSize(rect.origin.x, rect.origin.y, rect.size)));
    assertThatRect(rect, equalToRect(NewRectWithOrigin(rect.origin, rect.size.width, rect.size.height)));
    assertThatRect(rect, equalToRect(NewRectWithOriginAndSize(rect.origin, rect.size)));

    NSRect original = NSMakeRect(10, 10, 20, 40);
    NSRect result = NSInsetRect(original, -5, -2);
    NSRect computed = NewRectExpanding(original, 5.0, 2.0);
    assertThatRect(result, equalToRect(computed));
}

- (void)testTwoPointsRect {
    NSPoint a = NewPoint(5.0, 10.0);
    NSPoint b = NewPoint(10.0, 20.0);
    NSRect first = NewRect(5.0, 10.0, 5.0, 10.0);

    assertThatRect(first, equalToRect(NewRectWithTwoPoints(a, b)));
    assertThatRect(first, equalToRect(NewRectWithTwoPoints(b, a)));

    NSPoint c = NewPoint(-5.0, 10.0);
    NSPoint d = NewPoint(10.0, -20.0);
    NSRect second = NewRect(-5.0, -20.0, 15, 30.0);

    assertThatRect(second, equalToRect(NewRectWithTwoPoints(c, d)));
    assertThatRect(second, equalToRect(NewRectWithTwoPoints(d, c)));

    NSPoint f = NewPoint(-5.0, -10.0);
    NSPoint g = NewPoint(-10.0, -20.0);
    NSRect third = NewRect(-10.0, -20.0, 5, 10.0);
    
    assertThatRect(third, equalToRect(NewRectWithTwoPoints(g, f)));
    assertThatRect(third, equalToRect(NewRectWithTwoPoints(f, g)));
}

- (void)testPoints {
    assertThatPoint(NSMakePoint(434.1, 393.1), equalToPoint(NewPoint(434.1, 393.1)));
}

- (void)testSizes {
    assertThatSize(NSMakeSize(10.0, 20.0), equalToSize(NewSize(10.0, 20.0)));
}

@end
