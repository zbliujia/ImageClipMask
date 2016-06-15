//
//  ViewController.h
//  instruments
//
//  Created by jiedaibao on 16/3/31.
//  Copyright © 2016年 jiedaibao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *table;
@property (weak, nonatomic) IBOutlet UIButton *testButton;
- (IBAction)onTest:(id)sender;
@property (weak, nonatomic) IBOutlet UIImageView *testImage;

@end

