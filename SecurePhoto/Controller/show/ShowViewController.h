//
//  ShowViewController.h
//  SecurePhoto
//
//  Created by Bill on 2018/2/11.
//  Copyright © 2018年 Bill. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ShowViewController : UIViewController<UIGestureRecognizerDelegate>

@property (strong, nonatomic) NSString *entry;
@property (strong, nonatomic) NSMutableArray *entrys;
@property (assign, nonatomic) NSInteger index;


@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@property (weak, nonatomic) IBOutlet UIButton *lastBt;
@property (weak, nonatomic) IBOutlet UIButton *nextBt;




- (IBAction)taped:(id)sender;
- (IBAction)pinch:(id)sender;
- (IBAction)pan:(id)sender;



- (IBAction)last:(id)sender;
- (IBAction)next:(id)sender;


@end
