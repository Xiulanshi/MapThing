//
//  SwipeySwipersonViewController.m
//  MapThing
//
//  Created by Xiulan Shi on 2/18/16.
//  Copyright © 2016 Xiulan Shi. All rights reserved.
//

#import "SwipeySwipersonViewController.h"

@interface SwipeySwipersonViewController ()

@end

@implementation SwipeySwipersonViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setupGestureRecognizers];
}

- (void)setupGestureRecognizers
{
    UISwipeGestureRecognizer *leftSwipe = [[UISwipeGestureRecognizer alloc]
                                           initWithTarget: self
                                           action: @selector(handleSwipe :)];
    leftSwipe.direction = UISwipeGestureRecognizerDirectionLeft;
    
    UISwipeGestureRecognizer *rightSwipe = [[UISwipeGestureRecognizer alloc]
                                            initWithTarget: self
                                            action: @selector(handleSwipe :)];
    rightSwipe.direction = UISwipeGestureRecognizerDirectionRight;
    
    UISwipeGestureRecognizer *downSwipe = [[UISwipeGestureRecognizer alloc]
                                           initWithTarget: self
                                           action: @selector(handleSwipe :)];
    downSwipe.direction = UISwipeGestureRecognizerDirectionDown;
    
    
    [self.view addGestureRecognizer:leftSwipe];
    [self.view addGestureRecognizer:rightSwipe];
    [self.view addGestureRecognizer:downSwipe];
}

-(void)handleSwipe:(UISwipeGestureRecognizer *)gesture
{
    switch (gesture.direction) {
        case UISwipeGestureRecognizerDirectionLeft:
            self.view.backgroundColor = [UIColor darkGrayColor];
            break;
        case UISwipeGestureRecognizerDirectionRight:
            self.view.backgroundColor = [UIColor orangeColor];
            break;
        case UISwipeGestureRecognizerDirectionDown:
            [self dismissViewControllerAnimated:YES completion:nil];
            break;
            
        default:
 //           break;
            return;
    }
}

@end
