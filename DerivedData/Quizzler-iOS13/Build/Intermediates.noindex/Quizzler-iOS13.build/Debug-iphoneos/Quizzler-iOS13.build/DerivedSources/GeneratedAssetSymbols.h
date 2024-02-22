#import <Foundation/Foundation.h>

#if __has_attribute(swift_private)
#define AC_SWIFT_PRIVATE __attribute__((swift_private))
#else
#define AC_SWIFT_PRIVATE
#endif

/// The "Background-Bubbles" asset catalog image resource.
static NSString * const ACImageNameBackgroundBubbles AC_SWIFT_PRIVATE = @"Background-Bubbles";

/// The "Rectangle" asset catalog image resource.
static NSString * const ACImageNameRectangle AC_SWIFT_PRIVATE = @"Rectangle";

#undef AC_SWIFT_PRIVATE