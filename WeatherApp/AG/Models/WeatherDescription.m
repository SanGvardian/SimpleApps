//
//  WeatherDescription.m
//  AG
//
//  Created by Alexander Gvardian on 05.01.17.
//  Copyright © 2017 com.alexanderGvardian.AG. All rights reserved.
//

#import "WeatherDescription.h"

@implementation WeatherDescription

+ (FEMMapping*)defaultMapping
{
    FEMMapping* mapping = [[FEMMapping alloc] initWithObjectClass:[self class]];
    
    [mapping addAttributesFromDictionary :@{@"weath": @"description"}];
    return mapping;
}
@end
