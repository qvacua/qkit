#import <Cocoa/Cocoa.h>

static const CGFloat CONTAINER_BORDER_WIDTH = 1;

@interface QShadowedView : NSView

- (void)addOnlySubview:(NSView *)subview;

@end
