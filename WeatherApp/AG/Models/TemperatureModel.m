//
//  TemperatureModel.m
//  AG
//
//  Created by Alexander Gvardian on 29.12.16.
//  Copyright © 2016 com.alexanderGvardian.AG. All rights reserved.
//

#import "TemperatureModel.h"

@implementation TemperatureModel

+ (FEMMapping*)defaultMapping
{
    FEMMapping* mapping = [[FEMMapping alloc] initWithObjectClass:[self class]];
    
    [mapping addAttributesFromDictionary:@{@"temp" : @"temp",
                                           @"tempMin" : @"temp_min",
                                           @"tempMax" : @"temp_max",
                                           @"humidity" : @"humidity",
                                           @"pressure" : @"pressure",}];
    return mapping;
}
//
@end
