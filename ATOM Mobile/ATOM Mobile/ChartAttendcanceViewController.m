//
//  ChartAttendcanceViewController.m
//  ATOM Mobile
//
//  Created by Orland on 6/18/15.
//  Copyright (c) 2015 Accenture. All rights reserved.
//

#import "ChartAttendcanceViewController.h"
#import <TelerikUI/TelerikUI.h>

@interface ChartAttendcanceViewController ()

@end

@implementation ChartAttendcanceViewController
{
    CGFloat _headerHeight;
    CGFloat _offset;
    TKChart *_chart;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    [self updateHeaderHeight];
    
    [self updateLayoutConstraints];
    _chart = [[TKChart alloc] initWithFrame:self.exampleBoundsWithInset];
    _chart.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    _chart.userInteractionEnabled = NO;
    
    [self.view addSubview:_chart];
    
    [self reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)updateLayoutConstraints
{
    _exampleBounds = self.view.bounds;
    
    [self updateHeaderHeight];
    
    _exampleBounds.origin.y += _headerHeight;
    _exampleBounds.size.height -= _headerHeight;
    
    if (_offset > 0) {
        _exampleBounds.origin.y += _offset;
        _exampleBounds.size.height -= _offset;
    }
    
    UIUserInterfaceIdiom idiom = [[UIDevice currentDevice] userInterfaceIdiom];
    if (idiom == UIUserInterfaceIdiomPad) {
        _exampleBoundsWithInset = CGRectInset(_exampleBounds, 30, 30);
    }
    else {
        _exampleBoundsWithInset = CGRectInset(_exampleBounds, 10, 10);
    }
}
- (void)updateHeaderHeight
{
    UINavigationBar *navigationBar = self.navigationController.navigationBar;
    if (navigationBar.translucent) {
        UIApplication *app = [UIApplication sharedApplication];
        BOOL isLandscape = UIInterfaceOrientationIsLandscape(app.statusBarOrientation);
        _headerHeight = navigationBar.intrinsicContentSize.height + (isLandscape ? app.statusBarFrame.size.width : app.statusBarFrame.size.height);
    }
}
- (void)reloadData
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [_chart removeAllData];
    
    NSArray * categories = [defaults objectForKey:@"AttendanceYaxis"];
    NSData *attendancedata = [defaults objectForKey:@"AttendanceData"];
    NSSet *attendance = [NSKeyedUnarchiver unarchiveObjectWithData:attendancedata];
    
    TKChartStackInfo *stackInfo = nil;
    
    stackInfo = [[TKChartStackInfo alloc] initWithID:@(1) withStackMode:TKChartStackModeStack];
    
    for(id item in attendance){
        NSMutableArray *array = [[NSMutableArray alloc] init];
        
        for (int i = 0; i<categories.count; i++) {
            [array addObject:[[TKChartDataPoint alloc] initWithX:categories[i] Y:item[i]]];
        }
        
        TKChartSeries *series = [[TKChartAreaSeries alloc] initWithItems:array];
        series.selectionMode = TKChartSeriesSelectionModeSeries;
        //series.stackInfo = stackInfo;
        [_chart addSeries:series];
    }
    
    
    TKChartNumericAxis *yAxis = [[TKChartNumericAxis alloc] init];
    yAxis.range = [TKRange rangeWithMinimum:@0 andMaximum:[defaults objectForKey:@"AttendanceYaxisMax"]];
    yAxis.majorTickInterval = [defaults objectForKey:@"AttendanceYinterval"];
    _chart.yAxis = yAxis;
    _chart.title.text = [defaults objectForKey:@"AttendanceGraphTitle"];
    [_chart reloadData];
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
