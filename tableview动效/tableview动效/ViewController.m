//
//  ViewController.m
//  tableview动效
//
//  Created by fairy on 2017/2/17.
//  Copyright © 2017年 fairy. All rights reserved.
//

#import "ViewController.h"
#import "TableViewCell.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    UITableView * table;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    table = [[UITableView alloc]initWithFrame:self.view.bounds];
//    table.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:table];
    table.delegate = self;
    table.dataSource = self;
    [table registerClass:[TableViewCell class] forCellReuseIdentifier:@"cell"];
    // Do any additional setup after loading the view, typically from a nib.
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSArray *array = [NSArray arrayWithObjects:@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"11",@"12", nil];
       NSString * str =[array objectAtIndex:indexPath.row];
    TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    [cell setModel:str];
        
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return cellHeight+1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 12;
}

-(void)tableView:(UITableView *)tableView willDisplayCell:(TableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    //在willDisplayCell方法中处理数据，能优化滑动性能
    
//    TodayModel *model = self.selectDict[self.dateArray[indexPath.section]][indexPath.row];
//    
//    if (![[SDWebImageManager sharedManager] memoryCacheImageExistsForURL:[NSURL URLWithString:model.coverForDetail]]) {
    
        CATransform3D rotation; // 3D旋转
        rotation = CATransform3DMakeTranslation(0, 50, 20);
        rotation = CATransform3DScale(rotation, 0.9, 0.9, 1);
        rotation.m34 = 1.0 / -600;
        
        cell.layer.shadowColor = [[UIColor orangeColor] CGColor];
        cell.layer.shadowOffset = CGSizeMake(10, 10);
        cell.alpha = 0;
        
        cell.layer.transform = rotation;
        [UIView beginAnimations:@"rotation" context:nil];
        [UIView setAnimationDuration:0.5];
        cell.layer.transform = CATransform3DIdentity; // 停止动画
        cell.alpha = 1;
        cell.layer.shadowOffset = CGSizeMake(0, 0);
        [UIView commitAnimations];
//    }
    
    [cell cellOffset];
//    cell.model = model;
}


- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    NSArray <TableViewCell *> *array = [table visibleCells];
    [array enumerateObjectsUsingBlock:^(TableViewCell * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
//        CGAffineTransform transY = CGAffineTransformMakeTranslation(10, 100);
//        obj.image.transform = transY;
        [obj cellOffset];
    }];

    
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    
    
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
