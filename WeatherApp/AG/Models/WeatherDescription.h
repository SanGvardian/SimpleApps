//
//  WeatherDescription.h
//  AG
//
//  Created by Alexander Gvardian on 05.01.17.
//  Copyright © 2017 com.alexanderGvardian.AG. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WeatherDescription : NSObject
@property (nonatomic, strong) NSString* weath;

+ (FEMMapping*)defaultMapping;
@end
