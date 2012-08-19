#import <Qkit/Qkit.h>

@implementation NSImage (Q)

- (NSImage *)imageWithOpacity:(CGFloat)opacity {
    NSSize imageSize = [self size];
    NSImage *newImg = [[NSImage allocWithZone:nil] initWithSize:imageSize];

    [newImg lockFocusFlipped:YES];
    [self drawAtPoint:NewPoint(0, 0) fromRect:NSZeroRect operation:NSCompositeSourceOver fraction:opacity];
    [newImg unlockFocus];

    return newImg;
}

@end