//
//  HomeViewController.m
//  ATOM Mobile
//
//  Created by Arthur Lacasandile on 6/19/15.
//  Copyright (c) 2015 Accenture. All rights reserved.
//

#import "HomeViewController.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController
{
    NSLog(@"%i", tabBarController.selectedIndex);
    
    [self.navigationController popViewControllerAnimated:NO];
    
    switch (tabBarController.selectedIndex) {
        case 0:
        {
            homeIconView.image = [UIImage imageNamed:@"home-highlight.png"];
            issueIconView.image = [UIImage imageNamed:@"issues-default.png"];
            approvalIconView.image = [UIImage imageNamed:@"approvals-default.png"];
            reminderIconView.image = [UIImage imageNamed:@"reminder-default.png"];
            newsIconView.image = [UIImage imageNamed:@"news-default.png"];
        }
            break;
            
        case 1:
        {
            homeIconView.image = [UIImage imageNamed:@"home-default.png"];
            issueIconView.image = [UIImage imageNamed:@"issues-highlight.png"];
            approvalIconView.image = [UIImage imageNamed:@"approvals-default.png"];
            reminderIconView.image = [UIImage imageNamed:@"reminder-default.png"];
            newsIconView.image = [UIImage imageNamed:@"news-default.png"];
        }
            break;
            
        case 2:
        {
            homeIconView.image = [UIImage imageNamed:@"home-default.png"];
            issueIconView.image = [UIImage imageNamed:@"issues-default.png"];
            approvalIconView.image = [UIImage imageNamed:@"approvals-highlight.png"];
            reminderIconView.image = [UIImage imageNamed:@"reminder-default.png"];
            newsIconView.image = [UIImage imageNamed:@"news-default.png"];
        }
            break;
            
        case 3:
        {
            homeIconView.image = [UIImage imageNamed:@"home-default.png"];
            issueIconView.image = [UIImage imageNamed:@"issues-default.png"];
            approvalIconView.image = [UIImage imageNamed:@"approvals-default.png"];
            reminderIconView.image = [UIImage imageNamed:@"reminder-highlight.png"];
            newsIconView.image = [UIImage imageNamed:@"news-default.png"];
        }
            break;
            
        case 4:
        {
            homeIconView.image = [UIImage imageNamed:@"home-default.png"];
            issueIconView.image = [UIImage imageNamed:@"issues-default.png"];
            approvalIconView.image = [UIImage imageNamed:@"approvals-default.png"];
            reminderIconView.image = [UIImage imageNamed:@"reminder-default.png"];
            newsIconView.image = [UIImage imageNamed:@"news-highlight.png"];
        }
            break;
            
        default:
            break;
    }
}
- (void)LoadDataToGraph
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    /* LOAD Attendance Graph Data */
    NSArray  *categories  = @[ @"Mon", @"Tue", @"Wed", @"Thu", @"Fri", @"Sat", @"Sun"];
    NSArray  *Expectedvalues = @[ @25, @20, @30, @33, @28 , @26, @29];
    NSArray  *Presentvalues = @[ @10, @3, @1, @0, @0 , @0, @0];
    NSArray  *Latevalues = @[ @2, @1, @0, @0, @0 , @0, @0];
    NSSet *attendance = [NSSet setWithObjects:Latevalues,Presentvalues,Expectedvalues,nil];
    NSData *attendancedata = [NSKeyedArchiver archivedDataWithRootObject:attendance];
    
    [defaults setObject:categories forKey:@"AttendanceYaxis"];
    [defaults setObject:attendancedata forKey:@"AttendanceData"];
    [defaults setObject:@"Attendance" forKey:@"AttendanceGraphTitle"];
    [defaults setInteger:100 forKey:@"AttendanceYaxisMax"];
    [defaults setInteger:10 forKey:@"AttendanceYinterval"];
    [defaults synchronize];
    
    
    
    /* LOAD Machine Graph Data */
    NSArray  *maccategories  = @[ @"2PM", @"3PM", @"4PM", @"5PM", @"6PM", @"7PM", @"8PM", @"9PM", @"10PM", @"11PM"];
    NSArray  *macExpectedvalues = @[ @0, @2, @5, @9, @12, @18 , @18, @40, @10, @0];
    NSArray  *macPresentvalues = @[ @0, @0, @3, @4,@10, @11 , @10, @20, @11, @0];
    NSArray  *macLatevalues = @[ @5, @2, @5, @0,@0, @10 , @18, @15, @10, @0];;
    NSSet *macattendance = [NSSet setWithObjects:macExpectedvalues,macPresentvalues,macLatevalues,nil];
    NSData *macattendancedata = [NSKeyedArchiver archivedDataWithRootObject:macattendance];
    
    [defaults setObject:maccategories forKey:@"MachineYaxis"];
    [defaults setObject:macattendancedata forKey:@"MachineData"];
    [defaults setObject:@"Machines Progress" forKey:@"MachineGraphTitle"];
    [defaults setInteger:50 forKey:@"MachineYaxisMax"];
    [defaults setInteger:10 forKey:@"MachineYinterval"];
    [defaults synchronize];
    
    
}
- (void)displayTabImages
{
    UITabBar *tabBar = self.tabBarController.tabBar;
    UIImageView *imgTab = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 50)];
    [tabBar addSubview:imgTab];
    
    homeIconView = [[UIImageView alloc] initWithFrame:CGRectMake(12, 0, 50, 50)];
    homeIconView.image = [UIImage imageNamed:@"home-default.png"];
    [imgTab addSubview:homeIconView];
    
    issueIconView = [[UIImageView alloc] initWithFrame:CGRectMake(73, 0, 50, 50)];
    issueIconView.image = [UIImage imageNamed:@"issues-default.png"];
    [imgTab addSubview:issueIconView];
    
    approvalIconView = [[UIImageView alloc] initWithFrame:CGRectMake(134, 0, 50, 50)];
    approvalIconView.image = [UIImage imageNamed:@"approvals-default.png"];
    [imgTab addSubview:approvalIconView];
    
    reminderIconView = [[UIImageView alloc] initWithFrame:CGRectMake(195, 0, 50, 50)];
    reminderIconView.image = [UIImage imageNamed:@"reminder-default.png"];
    [imgTab addSubview:reminderIconView];
    
    newsIconView = [[UIImageView alloc] initWithFrame:CGRectMake(256, 0, 50, 50)];
    newsIconView.image = [UIImage imageNamed:@"news-default.png"];
    [imgTab addSubview:newsIconView];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSDictionary *textAttributes = [NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor], NSForegroundColorAttributeName, [UIColor whiteColor], NSBackgroundColorAttributeName, nil];
    
    self.navigationController.navigationBar.titleTextAttributes = textAttributes;
    self.navigationItem.title = @"MENU";
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
    
    self.tabBarController.delegate = self;
    [self displayTabImages];
    [self LoadDataToGraph];
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
