//
//  MultiLineUIPageControl.m
//  Pods
//
//  Created by Bruno Correa on 26/03/14.
//
//

#import "MultiLineUIPageControl.h"

@implementation MultiLineUIPageControl

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self)
    {
        self.dotsHorizontalSpace = DETAULT_DOTS_SPACE;
        self.dotsVerticalSpace = DETAULT_DOTS_SPACE;
    }
    return self;
}


-(void) awakeFromNib {
    [super awakeFromNib];
    self.dotsHorizontalSpace = DETAULT_DOTS_SPACE;
    self.dotsVerticalSpace = DETAULT_DOTS_SPACE;
}


-(NSArray *) dots {
    return [self subviews];
}


-(CGSize) sizeForNumberOfPages:(NSInteger)numberOfPages {
    UIView *lastDot = [[self dots] lastObject];
    return CGSizeMake((self.numberOfPages * (lastDot.frame.size.width + self.dotsHorizontalSpace) - self.dotsHorizontalSpace),
                      (self.numberOfPages * (lastDot.frame.size.height + self.dotsVerticalSpace)));
}


-(NSInteger) numberOfLines {
    return (NSInteger)ceil([self sizeForNumberOfPages:self.numberOfPages].width / self.frame.size.width);
}


-(CGFloat) heightThatFits {
    UIView *lastDot = [[self dots] lastObject];
    return ([self numberOfLines] * (lastDot.frame.size.height + self.dotsVerticalSpace));
}


-(void) layoutSubviews {
    [super layoutSubviews];
    
    CGFloat x = 0.0f;
    if ([self numberOfLines] == 1)
    {
        CGFloat dotsWidth = self.numberOfPages * ([[[self dots] lastObject] frame].size.width + self.dotsHorizontalSpace);
        x = self.frame.size.width / 2 - dotsWidth / 2;
        x = (x + self.dotsHorizontalSpace / 2);
    }
    
    CGFloat y = (self.frame.size.height / 2 - [self heightThatFits] / 2) + (self.dotsVerticalSpace / 2);
    
    NSArray *dots = [self dots];
    for (UIView *dot in dots)
    {
        dot.frame = CGRectMake(x, y, dot.frame.size.width, dot.frame.size.height);
        x = (x + dot.frame.size.width + self.dotsHorizontalSpace);
        
        if ((x + dot.frame.size.width) > self.frame.size.width) // break line
        {
            x = 0.0f;
            y = (y + dot.frame.size.height + self.dotsVerticalSpace);
        }
    }
}


@end
