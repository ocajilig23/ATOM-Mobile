//
//  PieLeaveViewController.m
//  ATOM Mobile
//
//  Created by Orland on 6/18/15.
//  Copyright (c) 2015 Accenture. All rights reserved.
//

#import "PieLeaveViewController.h"
#import <TelerikUI/TelerikUI.h>

@interface PieLeaveViewController ()

@end

@implementation PieLeaveViewController
{
    TKChart *_pieChart;
    CGFloat _headerHeight;
    CGFloat _offset;
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
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self updateHeaderHeight];
    
    [self updateLayoutConstraints];
    CGRect bounds = _exampleBoundsWithInset;
    _pieChart = [[TKChart alloc] initWithFrame:CGRectInset(CGRectMake(bounds.origin.x, bounds.origin.y,
                                                                      bounds.size.width, bounds.size.height / 2), 10, 10)];
   // _pieChart.autoresizingMask = ~UIViewAutoresizingNone;
    _pieChart.allowAnimations = YES;
    _pieChart.legend.hidden = YES;
   // _pieChart.legend.style.position = TKChartLegendPositionLeft;
   // _pieChart.legend.style.offsetOrigin = TKChartLegendOffsetOriginTopLeft;
   // _pieChart.legend.style.position = TKChartLegendPositionFloating;

    [self.view addSubview:_pieChart];
    
    
    NSMutableArray *array = [[NSMutableArray alloc] init];
    [array addObject:[[TKChartDataPoint alloc] initWithName:@"Present" value:@60]];
    [array addObject:[[TKChartDataPoint alloc] initWithName:@"Late" value:@30]];
    [array addObject:[[TKChartDataPoint alloc] initWithName:@"Off" value:@10]];
    [array addObject:[[TKChartDataPoint alloc] initWithName:@"AWOL" value:@5]];
    [array addObject:[[TKChartDataPoint alloc] initWithName:@"VL" value:@2]];
    [array addObject:[[TKChartDataPoint alloc] initWithName:@"EL" value:@7]];
    [array addObject:[[TKChartDataPoint alloc] initWithName:@"SL" value:@20]];
    [array addObject:[[TKChartDataPoint alloc] initWithName:@"Training" value:@15]];
    [array addObject:[[TKChartDataPoint alloc] initWithName:@"PTO" value:@2]];
    [array addObject:[[TKChartDataPoint alloc] initWithName:@"Not Yet Reported" value:@3]];
    
    TKChartPieSeries *series = [[TKChartPieSeries alloc] initWithItems:array];
    series.selectionMode = TKChartSeriesSelectionModeDataPoint;
    series.selectionAngle = @(-M_PI_2);
    series.expandRadius = 1.2;
    series.labelDisplayMode = TKChartPieSeriesLabelDisplayModeInside;
    _pieChart.title.text = @"Attendance";
    [_pieChart addSeries:series];

}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [_pieChart select:[[TKChartSelectionInfo alloc] initWithSeries:_pieChart.series[0] dataPointIndex:0]];
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
