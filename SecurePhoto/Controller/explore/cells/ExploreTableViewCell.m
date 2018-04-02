//
//  ExploreTableViewCell.m
//  SecurePhoto
//
//  Created by Bill on 2018/2/11.
//  Copyright © 2018年 Bill. All rights reserved.
//

#import "ExploreTableViewCell.h"

@implementation ExploreTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setEntry:(NSDictionary *)entry {
    
    _entry = entry;
    _mNameLabel.text = [entry objectForKey:@"name"];
    
    NSString *path = [NSString stringWithFormat:@"%@/%@", [entry objectForKey:@"entry"], [entry objectForKey:@"name"]];
    NSFileManager *fm = [NSFileManager defaultManager];
    BOOL isDir;
    [fm fileExistsAtPath:path isDirectory:&isDir];
    if (isDir) {
//        NSLog(@"这是个****文件夹****");
    }else{
//        NSLog(@"这是个****文件**** ");
        _mImage.image = [UIImage imageWithContentsOfFile:path];
    }  
}

@end
