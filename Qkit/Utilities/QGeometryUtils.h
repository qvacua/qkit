#import <Cocoa/Cocoa.h>

static inline NSRect NewRect(CGFloat x, CGFloat y, CGFloat width, CGFloat height) {
    return NSMakeRect(x, y, width, height);
}

static inline NSRect NewRectWithSize(CGFloat x, CGFloat y, NSSize size) {
    return NSMakeRect(x, y, size.width, size.height);
}

static inline NSRect NewRectWithOrigin(NSPoint origin, CGFloat width, CGFloat height) {
    return NSMakeRect(origin.x, origin.y, width, height);
}

static inline NSRect NewRectWithOriginAndSize(NSPoint origin, NSSize size) {
    return NSMakeRect(origin.x, origin.y, size.width, size.height);
}

static inline NSRect NewRectWithTwoPoints(NSPoint a, NSPoint b) {
    return NSMakeRect(MIN(a.x, b.x), MIN(a.y, b.y), MAX(a.x, b.x) - MIN(a.x, b.x), MAX(a.y, b.y) - MIN(a.y, b.y));
//    More readable version of the above:
//    NSRect NewRectWithTwoPoints(NSPoint a, NSPoint b) {
//    CGFloat startX = MIN(a.x, b.x);
//    CGFloat startY = MIN(a.y, b.y);
//
//    CGFloat endX = MAX(a.x, b.x);
//    CGFloat endY = MAX(a.y, b.y);
//
//    CGFloat width = endX - startX;
//    CGFloat height = endY - startY;
//
//    return NSMakeRect(startX, startY, width, height);
}

static inline NSRect NewRectExpanding(NSRect rect, CGFloat dw, CGFloat dh) {
    return NSInsetRect(rect, -dw, -dh);
}

static inline NSPoint NewPoint(CGFloat x, CGFloat y) {
    return NSMakePoint(x, y);
}

static inline NSPoint NewPointFlipping(NSPoint originalPoint, CGFloat height) {
    return NewPoint(originalPoint.x, height - originalPoint.y);
}

static inline NSSize NewSize(CGFloat width, CGFloat height) {
    return NSMakeSize(width, height);
}

static const CGFloat MAX_CGFLOAT = 1E+37;

