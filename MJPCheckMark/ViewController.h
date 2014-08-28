//
//  ViewController.h
//  MJPCheckMark
//
//  Created by Mike Platt on 28/08/2014.
//  Copyright (c) 2014 RABFAP. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MJPCheckMark.h"

@interface ViewController : UIViewController <MJPCheckMarkDelegate>

@property (nonatomic, weak) IBOutlet MJPCheckMark *checkMark;

@end
