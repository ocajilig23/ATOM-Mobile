//
//  TKChartColumnSeries.h
//  TelerikUI
//
//  Copyright (c) 2013 Telerik. All rights reserved.
//

#import "TKChartSeries.h"

/**
 Represents TKChart column series. Check this [Guide](chart-series-column) for more information.
 
 <img src="../docs/images/chart-series-column001.png">
 
 @see [Working with TKChartColumnSeries](chart-series-column)
 
 */
@interface TKChartColumnSeries : TKChartSeries

/**
 The value which controls the distance between bar groups as percent. Note that the value should be between 0 and 1,
 where a value of 0 means that a bar would take the entire space between two ticks, while a value of 1 means the bar will have
 * zero width as all the space should appear as gap.
 */
@property (nonatomic, assign) CGFloat gapLength;

/**
 Value for maximum possible column width in TKChartColumnSeries.
 */
@property (nonatomic, strong) NSNumber *maxColumnWidth;

/**
 Value for minimum column width in TKChartColumnSeries.
 */
@property (nonatomic, strong) NSNumber *minColumnWidth;

/**
 Determines whether clustering is allowed when arranging non-stacked series
 */
@property (nonatomic, assign) BOOL allowClustering;

@end
