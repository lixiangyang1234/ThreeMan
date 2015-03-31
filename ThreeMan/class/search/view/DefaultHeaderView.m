//
//  DefaultHeaderView.m
//  ThreeMan
//
//  Created by tianj on 15/3/30.
//  Copyright (c) 2015年 ___普马克___. All rights reserved.
//

#import "DefaultHeaderView.h"

@implementation DefaultHeaderView


- (id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        CGFloat imgWidth = 20;
        _imgView = [[UIImageView alloc] initWithFrame:CGRectMake(20,(frame.size.height-imgWidth)/2,imgWidth,imgWidth)];
        [self addSubview:_imgView];
        
        CGFloat x = _imgView.frame.size.width+_imgView.frame.origin.x+5;
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(x, 0, frame.size.width-x, frame.size.height)];
        _titleLabel.backgroundColor = [UIColor clearColor];
        [self addSubview:_titleLabel];
        
    }
    return self;
}

- (void)setImgView:(UIImage *)image title:(NSString *)title
{
    self.imgView.image = image;
    self.titleLabel.text = title;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
