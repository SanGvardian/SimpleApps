//
//  TemperatureModel.h
//  AG
//
//  Created by Alexander Gvardian on 29.12.16.
//  Copyright © 2016 com.alexanderGvardian.AG. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TemperatureModel : NSObject

@property (nonatomic, assign) NSInteger temp;
@property (nonatomic, assign) NSInteger pressure;
@property (nonatomic, assign) NSInteger humidity;
@property (nonatomic, assign) NSInteger tempMin;
@property (nonatomic, assign) NSInteger tempMax;

+ (FEMMapping*)defaultMapping;

@end
