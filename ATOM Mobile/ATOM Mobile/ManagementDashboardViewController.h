//
//  ManagementDashboardViewController.h
//  ATOM Mobile
//
//  Created by Arthur Lacasandile on 6/16/15.
//  Copyright (c) 2015 Accenture. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ManagementDashboardViewController : UIViewController <UIScrollViewDelegate>

@property (nonatomic, strong) IBOutlet UIScrollView *scrollView;
@property (nonatomic, strong) IBOutlet UIPageControl *pageControl;
@property (nonatomic, strong) NSArray *dashboardArray;

@end
