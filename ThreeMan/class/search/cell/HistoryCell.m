//
//  HistoryCell.m
//  ThreeMan
//
//  Created by tianj on 15/3/30.
//  Copyright (c) 2015年 ___普马克___. All rights reserved.
//

#import "HistoryCell.h"

@implementation HistoryCell

- (void)awakeFromNib {
    // Initialization code
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.backgroundColor = HexRGB(0xf3f3f3);
        CGFloat leftDis = 20;
        CGFloat height = 40;
        
        self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(leftDis, 0,kWidth-leftDis,height)];
        self.titleLabel.backgroundColor = [UIColor clearColor];
        [self.contentView addSubview:self.titleLabel];
        
        UIView *line = [[UIView alloc] initWithFrame:CGRectMake(0, height-1,kWidth,1)];
        line.backgroundColor = [UIColor blackColor];
        [self.contentView addSubview:line];
        
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
