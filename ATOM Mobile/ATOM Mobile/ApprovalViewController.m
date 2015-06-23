//
//  ApprovalViewController.m
//  ATOM Mobile
//
//  Created by Arthur Lacasandile on 6/17/15.
//  Copyright (c) 2015 Accenture. All rights reserved.
//

#import "ApprovalViewController.h"

@interface ApprovalViewController ()

@end

@implementation ApprovalViewController

@synthesize scrollView, pageControl, leaveArray, segmentedControl;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSDictionary *textAttributes = [NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor], NSForegroundColorAttributeName, [UIColor whiteColor], NSBackgroundColorAttributeName, nil];
    
    self.navigationController.navigationBar.titleTextAttributes = textAttributes;
    self.navigationItem.title = @"Approval";
    
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
    
    selectedSegment = 1;
    segmentedControl.selectedSegmentIndex = selectedSegment;
    [self segmentSwitch:segmentedControl];
}

- (void)globalFilterButtonClicked:(id)sender
{
    
}

- (void)profileIconButtonClicked:(id)sender
{
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)segmentSwitch:(id)sender
{
    segmentedControl = (UISegmentedControl *)sender;
    selectedSegment = segmentedControl.selectedSegmentIndex;
    
    switch (selectedSegment) {
        case 0:
        {
            leaveArray = [[NSArray alloc] initWithObjects:@"leave_page1.png", @"leave_page2.png", nil];
            
            for (int i=0; i < [leaveArray count]; i++) {
                CGRect frame;
                frame.origin.x = self.scrollView.frame.size.width * i;
                frame.origin.y = 0;
                frame.size = self.scrollView.frame.size;
                
                UIImageView *imageView = [[UIImageView alloc] initWithFrame:frame];
                imageView.image = [UIImage imageNamed:[leaveArray objectAtIndex:i]];
                [self.scrollView addSubview:imageView];
            }
            
            scrollView.contentSize = CGSizeMake(scrollView.frame.size.width * [leaveArray count], scrollView.frame.size.height);
        }
            break;
        case 1:
        {
            UITableView *approvalTable = [[UITableView alloc] init];
            
            CGRect frame;
            frame.origin.x = self.scrollView.frame.size.width;
            frame.origin.y = 0;
            frame.size = self.scrollView.frame.size;
            
            UIView *view = approvalTable;
            view.frame = frame;
            
            [self.scrollView addSubview:view];
            
            scrollView.contentSize = CGSizeMake(scrollView.frame.size.width, scrollView.frame.size.height);
        }
            break;
        case 2:
        {
            UITableView *teamAttendanceTable = [[UITableView alloc] init];
            
            CGRect frame;
            frame.origin.x = self.scrollView.frame.size.width;
            frame.origin.y = 0;
            frame.size = self.scrollView.frame.size;
            
            UIView *view = teamAttendanceTable;
            view.frame = frame;
            
            [self.scrollView addSubview:view];
            
            scrollView.contentSize = CGSizeMake(scrollView.frame.size.width, scrollView.frame.size.height);
        }
            break;
            
        default:
            break;
    }
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
