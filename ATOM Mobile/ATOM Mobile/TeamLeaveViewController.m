//
//  TeamLeaveViewController.m
//  ATOM Mobile
//
//  Created by Arthur Lacasandile on 6/19/15.
//  Copyright (c) 2015 Accenture. All rights reserved.
//

#import "TeamLeaveViewController.h"

@interface TeamLeaveViewController ()

@end

@implementation TeamLeaveViewController

@synthesize scrollView, pageControl, leaveArray, segmentedControl;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    segmentedControl.selectedSegmentIndex = selectedSegment;
    [self segmentSwitch:segmentedControl];
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
