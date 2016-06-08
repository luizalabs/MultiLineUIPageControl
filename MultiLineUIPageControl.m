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

-(NSInteger) dotsPerLine {
    float dots = (float)self.dots.count / (float)self.numberOfLines;
    return ceil(dots);
}


-(CGFloat) heightThatFits {
    UIView *lastDot = [[self dots] lastObject];
    return ([self numberOfLines] * (lastDot.frame.size.height + self.dotsVerticalSpace));
}


-(void) layoutSubviews {
    [super layoutSubviews];
    
    CGFloat x = 0.0f;
    CGFloat y = self.dotsVerticalSpace;
    
    NSArray *dots = [self dots];
    int currentLineNumber = 1;
    
    for (int i = 0; i < dots.count; i++) {
        
        UIView *currentDot = dots[i];
        
        int currentDotNumber = i + 1;
        NSInteger remainingDots = dots.count - i;
        bool breakLine = self.numberOfLines > 1 && currentDotNumber > (self.dotsPerLine * currentLineNumber);
        
        if (breakLine) {
            x = 0.0f;
            y = (y + currentDot.frame.size.height + self.dotsVerticalSpace);
            currentLineNumber++;
        }
        
        bool lastLine = (currentLineNumber == self.numberOfLines);
        int currentDotWidth = currentDot.frame.size.width + self.dotsHorizontalSpace;
        
        if (x == 0) {
            
            int lineStartingPoint;
            int lineWidth;
            
            if (lastLine && remainingDots < self.dotsPerLine) {
                lineWidth = (currentDotWidth * remainingDots) - self.dotsHorizontalSpace;
            } else {
                lineWidth = (currentDotWidth * self.dotsPerLine) - self.dotsHorizontalSpace;
            }
            
            lineStartingPoint = (self.frame.size.width - lineWidth) / 2;
            x = lineStartingPoint;
        }
        
        UIColor *currentDotColor = [self.dotsColor objectForKey: [@(i) stringValue]];
        if (currentDotColor && currentDot.subviews.count == 0) {
            CGSize imageViewSize = CGSizeMake(currentDot.frame.size.height, currentDot.frame.size.height);
            UIImageView *imageView = [self imageWithColor:currentDotColor andSize: imageViewSize];
            [currentDot addSubview: imageView];
            [currentDot bringSubviewToFront:imageView];
        }
        currentDot.frame = CGRectMake(x, y, currentDot.frame.size.width, currentDot.frame.size.height);
        x += currentDotWidth;
    }
}

-(void)setColor:(UIColor*)color forPage:(NSInteger)pageNumber {
    if (!self.dotsColor) {
        self.dotsColor = [[NSMutableDictionary alloc] init];
    }
    [self.dotsColor setObject:color forKey: [@(pageNumber) stringValue]];
}

- (UIImageView *)imageWithColor:(UIColor *)color andSize:(CGSize)size
{
    UIGraphicsBeginImageContextWithOptions(size, YES, 0);
    
    [color set];
    UIBezierPath * path = [UIBezierPath bezierPathWithRect:CGRectMake(0, 0, size.width, size.height)];
    [path fill];
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    UIImageView *imageView = [[UIImageView alloc] initWithImage: image];
    imageView.layer.cornerRadius = imageView.frame.size.height/2;
    imageView.clipsToBounds = YES;
    
    return imageView;
}

@end
