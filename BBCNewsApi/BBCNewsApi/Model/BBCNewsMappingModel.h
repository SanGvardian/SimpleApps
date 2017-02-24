//
//  BBCNewsMappingModel.h
//  BBCNewsApi
//
//  Created by Alexander Gvardian on 06.02.17.
//  Copyright © 2017 home. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BBCNewsMappingModel : NSObject

@property (nonatomic, strong) NSString* authorModel;
@property (nonatomic, strong) NSString* titleModel;
@property (nonatomic, strong) NSString* descriptionModel;
@property (nonatomic, strong) NSString* urlModel;
@property (nonatomic, strong) NSString* urlToImageModel;
@property (nonatomic, strong) NSString* publishedAtModel;

+ (FEMMapping*)defaultMapping;

@end
