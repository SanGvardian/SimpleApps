//
//  BBCTableViewCell.h
//  BBCNewsApi
//
//  Created by Alexander Gvardian on 06.02.17.
//  Copyright © 2017 home. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BBCTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imageNews;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel;
@property (weak, nonatomic) IBOutlet UILabel *publishedAtLabel;

@property (nonatomic, strong) NSURL* urlToGo;

@end
