#import <Foundation/Foundation.h>

@interface NSAttributedString (Q)

- (NSFont *)fontOfTheBeginning;
- (id)initWithHtmlFragment:(NSString *)htmlFragment;

@end