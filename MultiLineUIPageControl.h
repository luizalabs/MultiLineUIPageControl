//
//  MultiLineUIPageControl.h
//  Pods
//
//  Created by Bruno Correa on 26/03/14.
//
//

#import <UIKit/UIKit.h>

@interface MultiLineUIPageControl : UIPageControl {}

// default = 9.0f
@property (nonatomic, assign)   CGFloat     dotsSpace;

@property (nonatomic, readonly) NSInteger   numberOfLines;

@property (nonatomic, readonly) CGFloat     heightThatFits; // best height?

@end
