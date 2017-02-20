//
//  TableViewCell.m
//  tableview动效
//
//  Created by fairy on 2017/2/17.
//  Copyright © 2017年 fairy. All rights reserved.
//

#import "TableViewCell.h"

@implementation TableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle = UITableViewCellSeparatorStyleNone;
        self.clipsToBounds = YES;//裁剪看不到的部分
        self.image = [[UIImageView alloc]init];
        self.image.frame = CGRectMake(1,-cellHeight/2, kWidth , cellHeight*2);  //image的Y往上加一半cellHeight 高度为2 * cellHeight，这样上下多出一半的cellHeight
        self.contentMode = UIViewContentModeScaleAspectFill;
        [self addSubview:self.image];
        self.backgroundColor = [UIColor blackColor];

    }
    return self;
}

-(void)setModel:(NSString *)str
{
    [self.image setImage:[UIImage imageNamed:str]];
}

- (CGFloat)cellOffset {
    
    /*
     - (CGRect)convertRect:(CGRect)rect toView:(nullable UIView *)view;
     将rect由rect所在视图转换到目标视图view中，返回在目标视图view中的rect
     这里用来获取self在window上的位置
     */
    
    CGRect centerToWindow = [self convertRect:self.bounds toView:self.window];//返回当前视图在view中的rect
    CGFloat centerY = CGRectGetMidY(centerToWindow);//当前视图中心点y坐标
    CGPoint windowCenter = self.superview.center;//父视图中心点
    
    CGFloat cellOffsetY = centerY - windowCenter.y;//cell的y偏移量 cell在y轴上的位移  CGRectGetMidY获取中心Y值
    CGFloat offsetDig = cellOffsetY / self.superview.frame.size.height * 2;//偏移量的比例   位移比例
    CGFloat offset = -offsetDig * ([UIScreen mainScreen].bounds.size.height / 1.7- cellHeight) *0.5;//要补偿的位移
//    CGFloat offset = -offsetDig *cellHeight/2;
    CGAffineTransform transY = CGAffineTransformMakeTranslation(0, offset);
    //让image y轴方向位移offset
    self.image.transform = transY;
    return offset;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
