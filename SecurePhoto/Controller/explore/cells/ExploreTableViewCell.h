//
//  ExploreTableViewCell.h
//  SecurePhoto
//
//  Created by Bill on 2018/2/11.
//  Copyright © 2018年 Bill. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ExploreTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *mImage;
@property (weak, nonatomic) IBOutlet UILabel *mNameLabel;


@property (strong, nonatomic) NSObject *entry;

@end
