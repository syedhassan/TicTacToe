//
//  HPMKBaseViewController.m
//  TicTacToe
//
//  Created by Sana Hassan on 5/28/14.
//  Copyright (c) 2014 Hipmunk. All rights reserved.
//

#import "HPMKBaseViewController.h"

@interface HPMKBaseViewController ()
@property (strong, nonatomic) IBOutlet UIView *box0;
@property (strong, nonatomic) IBOutlet UIView *box1;
@property (strong, nonatomic) IBOutlet UIView *box2;
@property (strong, nonatomic) IBOutlet UIView *box3;
@property (strong, nonatomic) IBOutlet UIView *box4;
@property (strong, nonatomic) IBOutlet UIView *box5;
@property (strong, nonatomic) IBOutlet UIView *box6;
@property (strong, nonatomic) IBOutlet UIView *box7;
@property (strong, nonatomic) IBOutlet UIView *box8;
@property (assign, nonatomic) BOOL toggleImage;
@property (strong, nonatomic) NSMutableArray *arrayOfViews;
@end

@implementation HPMKBaseViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.arrayOfViews = [[NSMutableArray alloc] initWithCapacity:9];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self addTapRecognizer:self.box0];
    [self addTapRecognizer:self.box1];
    [self addTapRecognizer:self.box2];
    [self addTapRecognizer:self.box3];
    [self addTapRecognizer:self.box4];
    [self addTapRecognizer:self.box5];
    [self addTapRecognizer:self.box6];
    [self addTapRecognizer:self.box7];
    [self addTapRecognizer:self.box8];
}

- (void)addTapRecognizer:(UIView *)view {
    UITapGestureRecognizer *tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(respondToTapGesture:)];
    [view addGestureRecognizer:tapRecognizer];
    [self.arrayOfViews addObject:view];
}

- (void) respondToTapGesture:(UITapGestureRecognizer *)recognizer {
    NSInteger viewIndex = [[recognizer view] tag];
    
    UIImage *image = self.toggleImage? [UIImage imageNamed:@"cross"] : [UIImage imageNamed:@"circle"];
    UIView *viewToAdd = [[UIImageView alloc] initWithImage:image];
    
    [[self.arrayOfViews objectAtIndex:viewIndex] addSubview:viewToAdd];
    [[self.arrayOfViews objectAtIndex:viewIndex] removeGestureRecognizer:recognizer];
    self.toggleImage = !self.toggleImage;
}

@end
