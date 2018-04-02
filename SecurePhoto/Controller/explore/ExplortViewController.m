//
//  ExplortViewController.m
//  SecurePhoto
//
//  Created by Bill on 2018/2/11.
//  Copyright © 2018年 Bill. All rights reserved.
//

#import "ExplortViewController.h"
#import "../show/ShowViewController.h"
#import "cells/ExploreTableViewCell.h"
#import "IDMPhotoBrowser.h"


@interface ExplortViewController ()

@end

@implementation ExplortViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSFileManager *manager = [NSFileManager defaultManager];
    NSArray *names = [manager contentsOfDirectoryAtPath:_entry error:nil];
    _entrys = [NSMutableArray arrayWithArray:names];
    [_entrys sortUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
        return [obj1 compare:obj2];
    }];
}
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}




#pragma mark tableview delegate


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _entrys.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifer = @"Cell";
    ExploreTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifer forIndexPath:indexPath];
    NSMutableDictionary *model = [NSMutableDictionary dictionary];
    [model setValue:_entrys[indexPath.row] forKey:@"name"];
    [model setValue:_entry forKey:@"entry"];
    cell.entry = model;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    NSString *path = [NSString stringWithFormat:@"%@/%@", _entry, _entrys[indexPath.row]];
    NSFileManager *fm = [NSFileManager defaultManager];
    BOOL isDir;
    [fm fileExistsAtPath:path isDirectory:&isDir];
    
    if (isDir) {
        UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        ExplortViewController *exploreVC = [mainStoryboard instantiateViewControllerWithIdentifier:@"ExplortViewController"];
        exploreVC.entry = path;
        [self.navigationController pushViewController:exploreVC animated:YES];
    }
    else
    {
//        UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
//        ShowViewController *showVC = [mainStoryboard instantiateViewControllerWithIdentifier:@"ShowViewController"];
//        showVC.entry = _entry;
//        showVC.entrys = _entrys;
//        showVC.index = indexPath.row;
//        [self.navigationController pushViewController:showVC animated:YES];
        
        [self showPath:_entry paths:_entrys index:indexPath.row];
    }
}


- (void)showPath:(NSString *)path paths:(NSArray *)photosURL index:(NSUInteger)index{
    // Create an array to store IDMPhoto objects
    NSMutableArray *photos = [NSMutableArray new];
    NSURL *baseUrl = [NSURL fileURLWithPath:path];
    for (NSString *name in photosURL) {
        
        NSURL *url = [[NSURL alloc] initFileURLWithPath:name relativeToURL:baseUrl];
        
        IDMPhoto *photo = [IDMPhoto photoWithURL:url];
        [photos addObject:photo];
    }
    IDMPhotoBrowser *browser = [[IDMPhotoBrowser alloc] initWithPhotos:photos];
//    browser.displayToolbar = true;
//    browser.displayCounterLabel = true;
//    browser.displayArrowButton = true;
//    browser.displayActionButton = true;
//    browser.actionButtonTitles = photosURL;
    
//    browser.displayDoneButton = true;
//    browser.useWhiteBackgroundColor = YES;
    [browser setInitialPageIndex:index];
    [self presentViewController:browser animated:YES completion:nil];
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
