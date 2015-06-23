//
//  IssueViewController.m
//  ATOM Mobile
//
//  Created by Arthur Lacasandile on 6/16/15.
//  Copyright (c) 2015 Accenture. All rights reserved.
//

#import "IssueViewController.h"

@interface IssueViewController ()

@end

@implementation IssueViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSDictionary *textAttributes = [NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor], NSForegroundColorAttributeName, [UIColor whiteColor], NSBackgroundColorAttributeName, nil];
    
    self.navigationController.navigationBar.titleTextAttributes = textAttributes;
    self.navigationItem.title = @"Issue";
    
    // left bar button
    UIButton *globalFilterButton = [UIButton buttonWithType:UIButtonTypeCustom];
    globalFilterButton.frame = CGRectMake(0, 0, 30, 30);
    [globalFilterButton setImage:[UIImage imageNamed:@"global-filter.png"] forState:UIControlStateNormal];
    [globalFilterButton addTarget:self action:@selector(globalFilterButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *globalFilter = [[UIBarButtonItem alloc] initWithCustomView:globalFilterButton];
    self.navigationItem.leftBarButtonItem = globalFilter;
    // right bar button
    UIButton *profileIconButton = [UIButton buttonWithType:UIButtonTypeCustom];
    profileIconButton.frame = CGRectMake(0, 0, 30, 30);
    [profileIconButton setImage:[UIImage imageNamed:@"profile.png"] forState:UIControlStateNormal];
    [profileIconButton addTarget:self action:@selector(profileIconButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *profileIcon = [[UIBarButtonItem alloc] initWithCustomView:profileIconButton];
    self.navigationItem.rightBarButtonItem = profileIcon;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)globalFilterButtonClicked:(id)sender
{
    
}

- (void)profileIconButtonClicked:(id)sender
{
    
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
