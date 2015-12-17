#import <Foundation/Foundation.h>


#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface UIView (Convenience)

/**
 * Shortcut for frame.size.width
 *
 * Sets frame.size.width = width
 */
@property(nonatomic) CGFloat width;

/**
 * Shortcut for frame.size.height
 *
 * Sets frame.size.height = height
 */
@property(nonatomic) CGFloat height;

/**
 * Shortcut for center.x
 *
 * Sets center.x = centerX
 */
@property(nonatomic) CGFloat centerX;

/**
 * Shortcut for center.y
 *
 * Sets center.y = centerY
 */
@property(nonatomic) CGFloat centerY;

/**
 * Return the x coordinate on the screen, taking into account scroll views.
 */
@property(nonatomic, readonly) CGFloat screenViewX;

/**
 * Return the y coordinate on the screen, taking into account scroll views.
 */
@property(nonatomic, readonly) CGFloat screenViewY;

/**
 * Return the view frame on the screen, taking into account scroll views.
 */
@property(nonatomic, readonly) CGRect screenFrame;

/**
 * Shortcut for frame.origin
 */
@property(nonatomic) CGPoint origin;

/**
 * Shortcut for frame.size
 */
@property(nonatomic) CGSize size;

/**
 * Removes all subviews.
 */
- (void)removeAllSubviews;

// Frame Origin
@property (nonatomic) CGFloat x;
@property (nonatomic) CGFloat y;

@end