//
//  MultiLineUIPageControl.h
//  Pods
//
//  Created by Bruno Correa on 26/03/14.
//
//

#import <UIKit/UIKit.h>

#define DETAULT_DOTS_SPACE 9.0f

@interface MultiLineUIPageControl : UIPageControl {}

/*
 the horizontal space between dots
 default = DETAULT_DOTS_SPACE
 */
@property (nonatomic, assign)   CGFloat                 dotsHorizontalSpace;

/*
 the vertical space between dots
 default = DETAULT_DOTS_SPACE
 */
@property (nonatomic, assign)   CGFloat                 dotsVerticalSpace;

/*
 return the number of of lines based dotsHorizontalSpace and dotsVerticalSpace
 */
@property (nonatomic, readonly) NSInteger               numberOfLines;

/*
 return the number of dots per line
 */
@property (nonatomic, readonly) NSInteger               dotsPerLine;

/*
 return the best height
 */
@property (nonatomic, readonly) CGFloat                 heightThatFits;

/*
 return the best height
 */
@property (nonatomic, strong) NSMutableDictionary*      dotsColor;

/*
 change color for pageNumber dot
 */
-(void)setColor:(UIColor*)color forPage:(NSInteger)pageNumber;

@end
