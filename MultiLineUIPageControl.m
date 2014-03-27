//
//  MultiLineUIPageControl.m
//  Pods
//
//  Created by Bruno Correa on 26/03/14.
//
//

#import "MultiLineUIPageControl.h"

#define DETAULT_DOTS_SPACE 9.0f

@implementation MultiLineUIPageControl

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self)
    {
        self.dotsSpace = DETAULT_DOTS_SPACE;
    }
    return self;
}


-(void) awakeFromNib {
    [super awakeFromNib];
    self.dotsSpace = DETAULT_DOTS_SPACE;
}


-(NSArray *) dots {
    return [self subviews];
}


-(NSInteger) numberOfLines {
    return (NSInteger)ceil([self sizeForNumberOfPages:self.numberOfPages].width / self.frame.size.width);
}


-(CGFloat) heightThatFits {
    UIView *lastDot = [[self dots] lastObject];
    return ([self numberOfLines] * (lastDot.frame.size.height + self.dotsSpace));
}


-(void) layoutSubviews {
    [super layoutSubviews];
    
    BOOL needsRelayout = ([self sizeForNumberOfPages:self.numberOfPages].width > self.frame.size.width);
    if (needsRelayout)
    {
        CGFloat x = 0.0f;
        CGFloat y = (self.frame.size.height / 2 - [self heightThatFits] / 2) + (self.dotsSpace / 2);
        
        NSArray *dots = [self dots];
        for (UIView *dot in dots)
        {
            dot.frame = CGRectMake(x, y, dot.frame.size.width, dot.frame.size.height);
            x = (x + dot.frame.size.width + self.dotsSpace);
            
            if ((x + dot.frame.size.width) > self.frame.size.width) // break line
            {
                x = 0.0f;
                y = (y + dot.frame.size.height + self.dotsSpace);
            }
        }
    }
}


@end
