//
//  DetailViewController.h
//  Fibo
//
//  Created by Kerekes Jozsef-Marton on 19/09/16.
//  Copyright © 2016 mkerekes. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;
@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

@end

