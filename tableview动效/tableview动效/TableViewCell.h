//
//  TableViewCell.h
//  tableview动效
//
//  Created by fairy on 2017/2/17.
//  Copyright © 2017年 fairy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewCell : UITableViewCell
@property (nonatomic, strong) UIImageView *image;
- (CGFloat)cellOffset;
-(void)setModel:(NSString *)str;
@end
