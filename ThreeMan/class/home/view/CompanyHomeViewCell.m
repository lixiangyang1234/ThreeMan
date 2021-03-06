//
//  CompanyHomeViewCell.m
//  ThreeMan
//
//  Created by YY on 15-3-30.
//  Copyright (c) 2015年 ___普马克___. All rights reserved.
//

#import "CompanyHomeViewCell.h"
#define YYBorderX 10
#define YYBorderY 10
@implementation CompanyHomeViewCell



@synthesize companyHomeImage,companyHomeSmailImage,companyHomeTitle,downLoadBtn,zanBtn;
- (void)awakeFromNib {
    // Initialization code
}

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self =[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        UIView *backCell =[[UIView alloc]initWithFrame:CGRectMake(YYBorderX, YYBorderX, kWidth-YYBorderX*2, 80)];
        [self addSubview:backCell];
        backCell.backgroundColor =[UIColor whiteColor];
        
        companyHomeImage =[[UIImageView alloc]initWithFrame:CGRectMake(YYBorderX, YYBorderY, 80, 60)];
        [backCell addSubview:companyHomeImage];
        companyHomeImage.backgroundColor =[UIColor redColor];
        companyHomeImage.userInteractionEnabled =YES;
        
        companyHomeSmailImage =[[UIImageView alloc]initWithFrame:CGRectMake(YYBorderX*2+80, YYBorderY, 30, 20)];
        [backCell addSubview:companyHomeSmailImage];
        companyHomeSmailImage.backgroundColor =[UIColor redColor];
        companyHomeSmailImage.userInteractionEnabled =YES;
        
        
        companyHomeTitle =[[UILabel alloc]initWithFrame:CGRectMake(YYBorderX*2+80, YYBorderY, kWidth-YYBorderX*2-110, 50)];
        companyHomeTitle.backgroundColor =[UIColor clearColor];
        companyHomeTitle.text =@"首行缩进根据用户昵称自动调整 ";
        [backCell addSubview:companyHomeTitle];
        //        [companyHomeTitle sizeToFit];
        self . companyHomeTitle . adjustsFontSizeToFitWidth  =  YES ;
        
        //        self . companyHomeTitle . adjustsLetterSpacingToFitWidth  =  YES ;
        
        
        companyHomeTitle.numberOfLines =2;
        companyHomeTitle.font =[UIFont systemFontOfSize:20];
        
        downLoadBtn =[UIButton buttonWithType:UIButtonTypeCustom];
        [backCell addSubview:downLoadBtn];
        downLoadBtn.frame =CGRectMake(YYBorderX*2+80, YYBorderY*2+40, 100, 20);
        [downLoadBtn setTitle:@"230" forState:UIControlStateNormal];
        
        [downLoadBtn setImage:[UIImage imageNamed:@"nav_return_pre"] forState:UIControlStateNormal];
        [downLoadBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        
        zanBtn =[UIButton buttonWithType:UIButtonTypeCustom];
        [backCell addSubview:zanBtn];
        zanBtn.frame =CGRectMake(200, YYBorderY*2+40, 100, 20);
        [zanBtn setTitle:@"23" forState:UIControlStateNormal];
        
        [zanBtn setImage:[UIImage imageNamed:@"nav_return_pre"] forState:UIControlStateNormal];
        [zanBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        
        
        
        [self resetContent];
        
    }
    return self;
}
- ( void )resetContent{
    
    NSMutableAttributedString *attributedString = [[ NSMutableAttributedString alloc ] initWithString : self . companyHomeTitle . text ];
    
    NSMutableParagraphStyle *paragraphStyle = [[ NSMutableParagraphStyle alloc ] init ];
    
    paragraphStyle. alignment = NSTextAlignmentLeft ;
    
    //    paragraphStyle. maximumLineHeight = 40 ;  //最大的行高
    
    paragraphStyle. lineSpacing = 3 ;  //行自定义行高度
    
    [paragraphStyle setFirstLineHeadIndent :30 + 5 ]; //首行缩进 根据用户昵称宽度在加5个像素
    
    [attributedString addAttribute : NSParagraphStyleAttributeName value :paragraphStyle range : NSMakeRange ( 0 , [ self . companyHomeTitle . text length ])];
    
    self . companyHomeTitle . attributedText = attributedString;
    
    [ self . companyHomeTitle sizeToFit ];
    
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
