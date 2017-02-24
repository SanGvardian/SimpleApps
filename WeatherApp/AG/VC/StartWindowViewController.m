//
//  StartWindowViewController.m
//  AG
//
//  Created by Alexander Gvardian on 26.12.16.
//  Copyright © 2016 com.alexanderGvardian.AG. All rights reserved.
//

#import "StartWindowViewController.h"
#import "AFNetworking.h"
#import "API.h"
#import "FEMDeserializer.h"
#import "WeatherModel.h"
#import "TemperatureModel.h"
#import "WeatherDescription.h"
@import CoreLocation;

@interface StartWindowViewController ()

@property (nonatomic, strong) UILabel* cityLabel;
@property (nonatomic, strong) UIButton* chooseCityButton;
@property (nonatomic, strong) UILabel* tempLabel;
@property (nonatomic, strong) UILabel* minTempLabel;
@property (nonatomic, strong) UILabel* maxTempLabel;
@property (nonatomic, strong) UILabel* humidityLabel;
@property (nonatomic, strong) UILabel* pressureLabel;
@property (nonatomic, strong) UITextField* cityChange;
@property (nonatomic, strong) UILabel* wetaherDescription;

@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;
@property (nonatomic, strong) WeatherModel *weatherModel;

@end

@implementation StartWindowViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    [self loadData];
    
    
}

- (void)loadData
{
    NSString* path = [NSString stringWithFormat:@"%@%@%@", kBaseApiUrl, kApiVersion, kApiWeatherPath];
    
    NSDictionary* params = @{@"q" : @"Kharkiv",
                             @"appid" : kWeatherApiKey,
                             @"units" : @"metric"};
    
    [self.activityIndicator setHidden:NO];
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager GET:path
      parameters:params
        progress:nil
         success:^(NSURLSessionTask *task, NSDictionary* responseObject) {
             
             WeatherModel* weatherModel = [FEMDeserializer objectFromRepresentation:responseObject mapping:[WeatherModel defaultMapping]];
             
             self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"unnamed.png"]];
             self.cityLabel.text = weatherModel.cityName;
             self.wetaherDescription.text = weatherModel.weatherDescription.weath;
             self.tempLabel.text =  [NSString stringWithFormat:@"%ld",(long)weatherModel.temperatureModel.temp];
             self.minTempLabel.text = [NSString stringWithFormat:@"min: %ld",(long)weatherModel.temperatureModel.tempMin];
             self.maxTempLabel.text = [NSString stringWithFormat:@"max: %ld",(long)weatherModel.temperatureModel.tempMax];
             self.humidityLabel.text = [NSString stringWithFormat:@"Humidity: %ld",(long)weatherModel.temperatureModel.humidity];;
             self.pressureLabel.text = [NSString stringWithFormat:@"Pressure: %ld",(long)weatherModel.temperatureModel.pressure];

              self.activityIndicator.hidden = YES;
                          NSLog(@"JSON: %@", responseObject);
             NSLog(@"Object: %@", weatherModel);
         } failure:^(NSURLSessionTask *operation, NSError *error) {
             self.activityIndicator.hidden = YES;
             NSLog(@"Error: %@", error);
         }];
    
}

#pragma Mark - Lazy Load

- (UILabel*)cityLabel
{
    if (!_cityLabel)
    {
        _cityLabel = [UILabel new];
        _cityLabel.textAlignment = NSTextAlignmentLeft;
        _cityLabel.font = [UIFont systemFontOfSize:32];
        _cityLabel.textColor = [UIColor whiteColor];
        [self.view addSubview:_cityLabel];
        
        [_cityLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.equalTo(@40);
            make.centerX.equalTo(self.view.mas_centerX);
            make.top.equalTo(self.view.mas_top).offset(100);
        }];
    }
    return _cityLabel;
}

- (UILabel*)wetaherDescription
{
    if (!_wetaherDescription)
    {
        _wetaherDescription = [UILabel new];
        _wetaherDescription.textAlignment = NSTextAlignmentLeft;
        _wetaherDescription.font = [UIFont systemFontOfSize:32];
        _wetaherDescription.textColor = [UIColor whiteColor];
        [self.view addSubview:_wetaherDescription];
        
        [_wetaherDescription mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.equalTo(@40);
            make.centerX.equalTo(self.view.mas_centerX);
            make.top.equalTo(self.view.mas_top).offset(175);
            make.width.equalTo(@50);

        }];
    }
    return _wetaherDescription;
}

- (UILabel*)tempLabel
{
    if (!_tempLabel)
    {
        _tempLabel = [UILabel new];
        _tempLabel.textAlignment = NSTextAlignmentLeft;
        _tempLabel.font = [UIFont systemFontOfSize:64];
        _tempLabel.textColor = [UIColor whiteColor];
        [self.view addSubview:_tempLabel];
        
        [_tempLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.equalTo(@70);
            make.centerX.equalTo(self.view.mas_centerX);
            make.top.equalTo(self.view.mas_top).offset(300);
        }];
    }
    return _tempLabel;
}

- (UILabel*)minTempLabel
{
    if (!_minTempLabel)
    {
        _minTempLabel = [UILabel new];
        _minTempLabel.textAlignment = NSTextAlignmentLeft;
        _minTempLabel.font = [UIFont systemFontOfSize:32];
        _minTempLabel.textColor = [UIColor whiteColor];
        [self.view addSubview:_minTempLabel];
        
        [_minTempLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.view).offset(50);
            make.top.equalTo(self.view.mas_top).offset(380);
            make.height.equalTo(@40);

        }];
    }
    return _minTempLabel;
}

- (UILabel*)maxTempLabel
{
    if (!_maxTempLabel)
    {
        _maxTempLabel = [UILabel new];
        _maxTempLabel.textAlignment = NSTextAlignmentLeft;
        _maxTempLabel.font = [UIFont systemFontOfSize:32];
        _maxTempLabel.textColor = [UIColor whiteColor];
        [self.view addSubview:_maxTempLabel];
        
        [_maxTempLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.view).offset(-50);
            make.top.equalTo(self.view.mas_top).offset(380);
            make.height.equalTo(@40);
            
        }];
    }
    return _maxTempLabel;
}

- (UILabel*)humidityLabel
{
    if (!_humidityLabel)
    {
        _humidityLabel = [UILabel new];
        _humidityLabel.textAlignment = NSTextAlignmentLeft;
        _humidityLabel.textColor = [UIColor whiteColor];
        _humidityLabel.numberOfLines = 0;
        _humidityLabel.font = [UIFont systemFontOfSize:24];
        [self.view addSubview:_humidityLabel];
        
        [_humidityLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.view).offset(50);
            make.top.equalTo(self.view.mas_top).offset(480);
            make.height.equalTo(@40);
        }];
    }
    return _humidityLabel;
}

- (UILabel*)pressureLabel
{
    if (!_pressureLabel)
    {
        _pressureLabel = [UILabel new];
        _pressureLabel.textAlignment = NSTextAlignmentLeft;
        _pressureLabel.textColor = [UIColor whiteColor];
        _pressureLabel.numberOfLines = 0;
        _pressureLabel.font = [UIFont systemFontOfSize:24];
        [self.view addSubview:_pressureLabel];
        
        [_pressureLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.view).offset(50);
            make.top.equalTo(self.view.mas_top).offset(530);
            make.height.equalTo(@40);
        }];
    }
    return _pressureLabel;
}


@end
