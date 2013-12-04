//
//  ViewController.m
//  iOS9png
//
//  Created by Javier Gonzalez Cabezas on 04/12/13.
//  Copyright (c) 2013 Javier. All rights reserved.
//

#import "ViewController.h"
#import "Class9path.h"

@interface ViewController ()

@end

@implementation ViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIImage* myImage = [UIImage imageNamed:@"testButton.9.png"];
    
    UIImageView* temp = [[UIImageView alloc] initWithImage:[Class9path createImageFromNinepatch:myImage mWitdh:300 mHeight:300]];
    
    [self.view addSubview:temp];
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
