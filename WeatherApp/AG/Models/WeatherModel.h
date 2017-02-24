//
//  WeatherModel.h
//  AG
//
//  Created by Alexander Gvardian on 29.12.16.
//  Copyright © 2016 com.alexanderGvardian.AG. All rights reserved.
//

#import "TemperatureModel.h"
#import "WeatherDescription.h"

@interface WeatherModel : NSObject

@property (nonatomic, strong) NSString* weather;
@property (nonatomic, assign) NSInteger itemID;
@property (nonatomic, strong) NSString* cityName;
@property (nonatomic, strong) TemperatureModel* temperatureModel;
@property (nonatomic, strong) WeatherDescription* weatherDescription;

+ (FEMMapping*)defaultMapping;

@end
