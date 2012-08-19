@implementation NSAttributedString (Q)

- (NSFont *)fontOfTheBeginning {
    // TODO: when the string is empty, then
    // NSMutableRLEArray objectAtIndex:effectiveRange:: Out of bounds
    // is thrown here. Dunno why...

    NSDictionary *dictionary;
    NSFont *font;
    @try {
        dictionary = [self fontAttributesInRange:NSMakeRange(0, 0)];
        font = [dictionary objectForKey:NSFontAttributeName];
    } @catch (NSException *ex) {
        font = nil;
    }

    return font;
}

- (id)initWithHtmlFragment:(NSString *)htmlFragment {
    NSData *htmlAsData = [[NSData alloc] initWithBytes:[htmlFragment UTF8String] length:[htmlFragment lengthOfBytesUsingEncoding:NSUTF8StringEncoding]];

    return [self initWithHTML:htmlAsData documentAttributes:NULL];
}

@end