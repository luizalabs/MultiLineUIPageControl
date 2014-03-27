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
        self.dotsSpace = 9.0f;
    }
    return self;
}

/*
 do we need to relayot dots position?
 */
-(BOOL) needsRelayout {
    return ([self sizeForNumberOfPages:self.numberOfPages].width > self.frame.size.width);
}


-(void) layoutSubviews {
    [super layoutSubviews];
    
    if ([self needsRelayout])
    {
        NSArray *dots = [self subviews];
        CGFloat x = 0.0f, y = 0.0f;
        
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
