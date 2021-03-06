//
//  HomeViewController.m
//  ThreeMan
//
//  Created by YY on 15-3-17.
//  Copyright (c) 2015年 ___普马克___. All rights reserved.
//

#import "HomeViewController.h"
#import "CourseEightController.h"
#import "KDCycleBannerView.h"
#import "NineBlockController.h"
#import "NeedViewController.h"
#import "BusinessController.h"
#define BANNER    135           //banner高度
#define EIGHTH    125          //八大课程体系
#define NEEDH     135         //按需求
#define BUSINESS  183       //按行业
#define NEEDTAG  100
@interface HomeViewController ()<KDCycleBannerViewDataource,KDCycleBannerViewDelegate>
{
    KDCycleBannerView *_bannerView;
}
@property(nonatomic,strong)KDCycleBannerView *_bannerView;
@property(nonatomic,strong)UIScrollView *backScrollView;
@property(nonatomic,copy)NSArray *noticeArray;
@property(nonatomic,strong)NSMutableArray *bannerArray;
@end

@implementation HomeViewController
static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor =[UIColor whiteColor];
    _bannerArray =[[NSMutableArray alloc]initWithCapacity:0];
    [_bannerArray addObject:@"img"];
    [_bannerArray addObject:@"img"];
    [_bannerArray addObject:@"img"];

    [self addUIBanner];//1区
    [self addUICourse];//2区添加八大课程体系
    [self addUINeed];//3添加需求
    [self addUIBusiness];//添加行业

}
//1区
-(void)addUIBanner{
    //添加滑动背景
    self.backScrollView =[[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, kWidth, kHeight-104)];
    self.backScrollView.backgroundColor =[UIColor whiteColor];
    [self.view addSubview:self.backScrollView];
    self.backScrollView.contentSize =CGSizeMake(kWidth, 714);
    self.backScrollView.bounces=NO;
    self.backScrollView.showsHorizontalScrollIndicator =NO;
    self.backScrollView.showsVerticalScrollIndicator=NO;
    //顶部广告视图
    _bannerView = [[KDCycleBannerView alloc] initWithFrame:CGRectMake(0, 0,kWidth,BANNER)];
    _bannerView.delegate = self;
    _bannerView.datasource = self;
    _bannerView.continuous = YES;
    _bannerView.autoPlayTimeInterval = 3;
    [self.backScrollView addSubview:_bannerView];
    
    UIView *topLine =[[UIView alloc]initWithFrame:CGRectMake(0, BANNER, kWidth, 1)];
    [self.backScrollView addSubview:topLine];
    topLine.backgroundColor =HexRGB(0xe9eaec);
    
}
//2八大课程体系
-(void)addUICourse{

    
    self.noticeArray=@[@"企业蜕变",@"领袖蜕变",@"跟进服务",@"协作突破",@"总裁实修",@"心灵修炼",@"能力构建",@"生命辅修"];
    for (int c=0; c<self.noticeArray.count; c++)
    {
        CGFloat courseBorderW = 35;//边界宽
        CGFloat courseBorderH = 9;//边界高
        CGFloat betweenW = 39;// 间距宽

        
        UIImageView *courseImage =[[UIImageView alloc]init];
        courseImage.frame =CGRectMake(courseBorderW+c%4*(betweenW+(kWidth-courseBorderW*2-betweenW*3)/4),courseBorderH+ BANNER+c/4*(23+courseBorderH+(kWidth-courseBorderW*2-betweenW*3)/4), (kWidth-courseBorderW*2-betweenW*3)/4,(kWidth-courseBorderW*2-betweenW*3)/4);
        [courseImage setBackgroundColor:[UIColor cyanColor]];
        courseImage.layer.cornerRadius =(kWidth-courseBorderW*2-betweenW*3)/8;
        courseImage.layer.masksToBounds=YES;
        
        [_backScrollView addSubview:courseImage];
        
        UIButton *courseButtTitle =[UIButton buttonWithType:UIButtonTypeCustom];
        
        courseButtTitle.frame =CGRectMake(18+c%4*(courseImage.frame.size.width+betweenW), courseImage.frame.origin.y+30+c/4, 70, 30);
        [self.backScrollView addSubview:courseButtTitle];
        [courseButtTitle setTitle:self.noticeArray[c] forState:UIControlStateNormal];
        [courseButtTitle setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        courseButtTitle.titleLabel.font =[UIFont systemFontOfSize:PxFont(20)];
        [courseButtTitle setTitleColor:HexRGB(0x404040) forState:UIControlStateNormal];
        [courseButtTitle setBackgroundColor:[UIColor clearColor]];
        
        
        UIButton *courseBtn =[UIButton buttonWithType:UIButtonTypeCustom];
        courseBtn.frame =CGRectMake(30+c%4*(courseButtTitle.frame.size.width), courseImage.frame.origin.y+c/4, 50,60);
        [courseBtn setTitle:self.noticeArray[c] forState:UIControlStateNormal  ];
        [courseBtn setTitleColor:[UIColor clearColor] forState:UIControlStateNormal];
        [_backScrollView addSubview:courseBtn];
        courseBtn.backgroundColor =[UIColor clearColor];
        courseBtn.alpha =.4;
//        CategoryButt.tag=[hotCategoryModel.cateid intValue]+100;
        
        courseImage.tag = courseBtn.tag+10000;
        courseButtTitle.tag =courseImage.tag ;
        
        courseImage.userInteractionEnabled = NO;
        courseImage.image =[UIImage imageNamed:@"nav_return_pre"];
//        [findImage setImageWithURL:[NSURL URLWithString:hotCategoryModel.image]  placeholderImage:[UIImage imageNamed:@"find_fail.png"]];
        
        [courseBtn addTarget:self action:@selector(eightCourseBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        
        
        
        
    }


}
//2、八大课程体系按钮
-(void)eightCourseBtnClick:(UIButton *)cate{
    CourseEightController *courseEightVc=[[CourseEightController alloc]init];
    [self.nav pushViewController:courseEightVc animated:YES];
}
//
//3、添加需求
-(void)addUINeed
{
    CGFloat needHeight =45+BANNER+EIGHTH;
    for (int l=0; l<3; l++) {
        UIView *lineView=[[UIView alloc]initWithFrame:CGRectMake(0, needHeight+l%2*(NEEDH+14+27), kWidth, 12)];
        
        if (l==2) {
            lineView.frame =CGRectMake(0, _backScrollView.contentSize.height-12, kWidth, 12);
        }
        [self.backScrollView addSubview:lineView];
        lineView.backgroundColor =HexRGB(0xeeeee9);
        UIView *line =[[UIView alloc]initWithFrame:CGRectMake(0, 0, kWidth, 1)];
        [lineView addSubview:line];
        line.backgroundColor =HexRGB(0xcacaca);
        
        
    }
    for (int t=0; t<2; t++) {
        NSArray *titleArray =@[@"按需求 ",@"按行业"];
        NSArray *imgArray =@[[UIImage imageNamed:@"needImg"],[UIImage imageNamed:@"businessImg"]];
        UIButton* titleBtn =[UIButton buttonWithType:UIButtonTypeCustom];
        titleBtn.frame =CGRectMake(20, needHeight+12+t%2*(NEEDH+14+27), kWidth-20, 27 );
        [self.backScrollView addSubview:titleBtn];
        [titleBtn setImage:imgArray[t] forState:UIControlStateNormal];
        [titleBtn setTitle:titleArray[t] forState:UIControlStateNormal];
        [titleBtn setTitleColor:HexRGB(0x404040) forState:UIControlStateNormal];
        titleBtn.contentHorizontalAlignment=UIControlContentHorizontalAlignmentLeft;
        [titleBtn.titleLabel setFont:[UIFont systemFontOfSize:PxFont(22)]];
        [titleBtn setBackgroundColor:[UIColor clearColor]];
        
    }
    
    UIView *needBackView =[[UIView alloc]initWithFrame:CGRectMake(0, needHeight+40-1, kWidth, NEEDH)];
    [self.backScrollView addSubview:needBackView];
    needBackView.backgroundColor =HexRGB(0xeaebec);
    
    NSArray *needTitleArray =@[@"九大项",@"三大委员会",@"客户管理",@"外勤管理",@"内勤管理",@"营销活动"];
        for (int i=0; i<6; i++) {
            UIButton* needBtn =[UIButton buttonWithType:UIButtonTypeCustom];
            [self.backScrollView addSubview:needBtn];
            [needBtn setImage:[UIImage imageNamed:@"nav_return_pre"] forState:UIControlStateNormal];
            [needBtn setTitle:needTitleArray[i] forState:UIControlStateNormal];
            [needBtn setTitleColor:HexRGB(0x808080) forState:UIControlStateNormal];
            needBtn.backgroundColor =[UIColor whiteColor];
            if (i==0) {
                needBtn.frame =CGRectMake(0, needHeight+40, kWidth-150, 90);
            }else if (i==1){
                needBtn.frame =CGRectMake(kWidth-149, needHeight+40, 150, 44);
            }else if (i==2){
                needBtn.frame =CGRectMake(kWidth-149, needHeight+40+45, 150, 45);

            }else{
                needBtn.frame =CGRectMake(i%3*(kWidth/3+1), needHeight+40+91, kWidth/3, 45);
            }
            [needBtn addTarget:self action:@selector(needBtnClick:) forControlEvents:UIControlEventTouchUpInside];
            
            needBtn.tag =i+NEEDTAG;

    }
    
    

}
//4、添加行业
-(void)addUIBusiness{
    UIView *needBackView =[[UIView alloc]initWithFrame:CGRectMake(0, NEEDH+BANNER+249, kWidth, BUSINESS)];
    [self.backScrollView addSubview:needBackView];
    needBackView.backgroundColor =HexRGB(0xeaebec);
    for (int i=0; i<6; i++) {
        UIButton* businessBtn =[UIButton buttonWithType:UIButtonTypeCustom];
                    businessBtn.frame =CGRectMake(0+i/3*(kWidth/2+1),NEEDH+ BANNER+250+i%3*61, (kWidth)/2, 60 );
        [self.backScrollView addSubview:businessBtn];
        [businessBtn setImage:[UIImage imageNamed:@"nav_return_pre"] forState:UIControlStateNormal];
        [businessBtn setTitle:@"课程推荐" forState:UIControlStateNormal];
        //            [businessBtn setTitleColor:HexRGB(0x808080) forState:UIControlStateNormal];
        businessBtn.backgroundColor =[UIColor whiteColor];
        
        [businessBtn addTarget:self action:@selector(businessBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        
        businessBtn.tag =i+10;
        
    }

}
//3、需求
-(void)needBtnClick:(UIButton *)more{

    if (more.tag==NEEDTAG) {
        NineBlockController *nineVc =[[NineBlockController alloc]init];
        [self.nav pushViewController:nineVc animated:YES];
    }else if (more.tag ==NEEDTAG+1 ){
        NineBlockController *nineVc =[[NineBlockController alloc]init];
        [self.nav pushViewController:nineVc animated:YES];
    }else{
        NeedViewController *needVc =[[NeedViewController alloc]init];
        [self.nav pushViewController:needVc animated:YES];
    }
       }
//行业
-(void)businessBtnClick:(UIButton *)sender{
    BusinessController *businessVC=[[BusinessController alloc]init];
    [self.nav pushViewController:businessVC animated:YES];
}
-(void)categoryneedBtn:(UIButton *)category{
    NSLog(@"%d",category.tag);
}

#pragma mark KDCycleBannerView_delegate
- (NSArray *)numberOfKDCycleBannerView:(KDCycleBannerView *)bannerView
{
    return _bannerArray;
}

- (UIViewContentMode)contentModeForImageIndex:(NSUInteger)index
{
    return UIViewContentModeScaleAspectFill;
}

//广告占位图
- (UIImage *)placeHolderImageOfBannerView:(KDCycleBannerView *)bannerView atIndex:(NSUInteger)index
{
    return [UIImage imageNamed:@"img"];
}

//选中广告的第几张图片
- (void)cycleBannerView:(KDCycleBannerView *)bannerView didSelectedAtIndex:(NSUInteger)index
{
//    AdsItem *item = [_adsArray objectAtIndex:index];
//    BannerDetailController *detail = [[BannerDetailController alloc] init];
//    detail.urlStr = item.content;
//    [self.navigationController pushViewController:detail animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
