//
//  ManagementDashboardViewController.m
//  ATOM Mobile
//
//  Created by Arthur Lacasandile on 6/16/15.
//  Copyright (c) 2015 Accenture. All rights reserved.
//

#import "ManagementDashboardViewController.h"
#import "LeaveViewController.h"
#import "ChartAttendcanceViewController.h"
#import "ChartMacInProgressViewController.h"
#import "PieLeaveViewController.h"

@interface ManagementDashboardViewController ()

@end

@implementation ManagementDashboardViewController

@synthesize scrollView, pageControl, dashboardArray;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSDictionary *textAttributes = [NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor], NSForegroundColorAttributeName, [UIColor whiteColor], NSBackgroundColorAttributeName, nil];
    
    self.navigationController.navigationBar.titleTextAttributes = textAttributes;
    self.navigationItem.title = @"Management Dashboard";
    
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
    
    UIViewController *controller1 =  [[ ChartAttendcanceViewController alloc] init];
    UIViewController *controller2 =  [[ ChartMacInProgressViewController alloc] init];
    UIViewController *controller3 =  [[ PieLeaveViewController  alloc] init];
    
    dashboardArray = [[NSArray alloc] initWithObjects:controller1, controller2, controller3, nil];
    
    for (int i=0; i < [dashboardArray count]; i++) {
        CGRect frame;
        frame.origin.x = self.scrollView.frame.size.width * i;
        frame.origin.y = 0;
        frame.size = self.scrollView.frame.size;
        
        UIViewController *controller = [dashboardArray objectAtIndex:i ];
        controller.view.frame = frame;
        [self.scrollView addSubview:controller.view];
    }
    
    scrollView.contentSize = CGSizeMake(scrollView.frame.size.width * [dashboardArray count], scrollView.frame.size.height);
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat pageWidth = self.scrollView.frame.size.width;
    int page = floor((self.scrollView.contentOffset.x - pageWidth/2)/pageWidth) + 1;
    self.pageControl.currentPage = page;
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
