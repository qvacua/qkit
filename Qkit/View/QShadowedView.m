#import "QShadowedView.h"
#import <Qkit/Qkit.h>

@implementation QShadowedView {
    NSShadow *_backShadow;
    NSBezierPath *_path;

    __weak NSView *_onlySubview;
}

- (void)addOnlySubview:(NSView *)subview {
    _onlySubview = subview;

    NSSize originalSize = subview.frame.size;

    [self addSubview:subview];
    [subview setFrame:NewRectWithSize(CONTAINER_BORDER_WIDTH, CONTAINER_BORDER_WIDTH, originalSize)];

    [self setFrameSize:NewSize(originalSize.width + 2 * CONTAINER_BORDER_WIDTH + 20, originalSize.height + 2 * CONTAINER_BORDER_WIDTH + 20)];

    _path = [NSBezierPath bezierPathWithRect:NewRect(0, 0, originalSize.width + 2, originalSize.height + 2)];
    [_path setLineWidth:CONTAINER_BORDER_WIDTH];

    [self setNeedsDisplay:YES];
}

- (void)drawRect:(NSRect)dirtyRect {
    [NSGraphicsContext saveGraphicsState];

    [_backShadow set];
    [[NSColor grayColor] setStroke];
    [[NSColor whiteColor] setFill];

    [_path fill];
    [_path stroke];
    [NSGraphicsContext restoreGraphicsState];

    [super drawRect:dirtyRect];
}

- (id)initWithFrame:(NSRect)frameRect {
    if ((self = [super initWithFrame:frameRect])) {
        _backShadow = [[NSShadow alloc] init];
        [_backShadow setShadowColor:[[NSColor blackColor] colorWithAlphaComponent:0.5]];
        [_backShadow setShadowBlurRadius:10];
        [_backShadow setShadowOffset:NewSize(4, -4)];
    }

    return self;
}

- (BOOL)isFlipped {
    return YES;
}

@end
