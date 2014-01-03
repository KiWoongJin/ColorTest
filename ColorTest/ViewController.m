//
//  ViewController.m
//  ColorTest
//
//  Created by SDT-1 on 2014. 1. 3..
//  Copyright (c) 2014년 SDT-1. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UISlider *redSlider;
@property (weak, nonatomic) IBOutlet UISlider *greenSlider;
@property (weak, nonatomic) IBOutlet UISlider *blueSlider;
@property (weak, nonatomic) IBOutlet UIImageView *colorView;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;
@end

@implementation ViewController
- (IBAction)onColorSliderChanged:(id)sender{
    if([self.activityIndicator isAnimating]){
        [self.activityIndicator stopAnimating];
    }
    self.colorView.backgroundColor = [UIColor colorWithRed:self.redSlider.value green:self.greenSlider.value blue:self.blueSlider.value alpha:1.0];
}
- (IBAction)powerOnOff:(id)sender {
    BOOL isOn = ((UISwitch *)sender).on;
    
    self.redSlider.enabled = isOn;
    self.greenSlider.enabled = isOn;
    self.blueSlider.enabled = isOn;
    
    if(isOn){
        [self.activityIndicator startAnimating];
        [self performSelector:@selector(onColorSliderChanged:) withObject:nil afterDelay:1.0];
    }
    else{
        self.colorView.backgroundColor = [UIColor grayColor];
    }
}
- (void)viewWillAppear:(BOOL)animated{
    [self onColorSliderChanged:nil];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
