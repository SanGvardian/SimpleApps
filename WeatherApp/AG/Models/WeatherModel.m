//
//  WeatherModel.m
//  AG
//
//  Created by Alexander Gvardian on 29.12.16.
//  Copyright © 2016 com.alexanderGvardian.AG. All rights reserved.
//

#import "WeatherModel.h"

@implementation WeatherModel

+ (FEMMapping*)defaultMapping
{
    
    FEMMapping* mapping = [[FEMMapping alloc] initWithObjectClass:[self class]];
    [mapping addAttributeWithProperty:@"cityName" keyPath:@"name"];
    [mapping addAttributeWithProperty:@"itemID" keyPath:@"id"];
    [mapping addRelationshipMapping:[TemperatureModel defaultMapping]
                        forProperty:@"temperatureModel"
                            keyPath:@"main"];
    [mapping addRelationshipMapping:[WeatherDescription defaultMapping]
                        forProperty:@"weatherDescription"
                            keyPath:@"weather ()"];
    return mapping;
    
}

@end
