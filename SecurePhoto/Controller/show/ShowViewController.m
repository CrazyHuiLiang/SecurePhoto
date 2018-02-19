//
//  ShowViewController.m
//  SecurePhoto
//
//  Created by Bill on 2018/2/11.
//  Copyright © 2018年 Bill. All rights reserved.
//

#import "ShowViewController.h"

@interface ShowViewController ()

@end

@implementation ShowViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setImg];
    
}


-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [super touchesBegan:touches withEvent:event];
    
    [self toggleBt];
}

- (void)setImg {
    self.title = [NSString stringWithFormat:@"%lu/%lu", _index+1, _entrys.count];
    
    NSString *path = [NSString stringWithFormat:@"%@/%@", _entry, _entrys[_index]];
    NSFileManager *fm = [NSFileManager defaultManager];
    BOOL isDir;
    [fm fileExistsAtPath:path isDirectory:&isDir];
    
    if (!isDir) {
        _imageView.image = [UIImage imageWithContentsOfFile:path];
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)taped:(id)sender {
//    [self toggleBt];
}

- (void)toggleBt {
    [self.navigationController setNavigationBarHidden:!self.navigationController.navigationBarHidden animated:YES];
}

- (IBAction)pinch:(UIPinchGestureRecognizer *)sender {
    
    //scale 缩放比例
    //    sender.view.transform = CGAffineTransformMake(sender.scale, 0, 0, sender.scale, 0, 0);
    //每次缩放以原来位置为标准
    //    sender.view.transform = CGAffineTransformMakeScale(sender.scale, sender.scale);
    
    //每次缩放以上一次为标准
    sender.view.transform = CGAffineTransformScale(sender.view.transform, sender.scale, sender.scale);
    //重新设置缩放比例 1是正常缩放.小于1时是缩小(无论何种操作都是缩小),大于1时是放大(无论何种操作都是放大)
    sender.scale = 1;
}

- (IBAction)pan:(UIPanGestureRecognizer *)sender {
    CGPoint point = [sender translationInView:_imageView];
    //    sender.view.transform = CGAffineTransformMake(1, 0, 0, 1, point.x, point.y);
    
    //平移一共两种移动方式
    //第一种移动方法:每次移动都是从原来的位置移动
    //    sender.view.transform = CGAffineTransformMakeTranslation(point.x, point.y);
   

    //第二种移动方式:以上次的位置为标准(移动方式 第二次移动加上第一次移动量)
    sender.view.transform = CGAffineTransformTranslate(sender.view.transform, point.x, point.y);
    //增量置为o
    [sender setTranslation:CGPointZero inView:sender.view];
}


- (IBAction)last:(id)sender {
    
    if (_index > 0) {
        _index--;
    } else {
//        _index = _entrys.count-1;
    }
    
    [self setImg];
}

- (IBAction)next:(id)sender {
    
    if (_index < _entrys.count-1) {
        _index++;
    } else {
//        _index = 0;
    }
    [self setImg];
}
@end
