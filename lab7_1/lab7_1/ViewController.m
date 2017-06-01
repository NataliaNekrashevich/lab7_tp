//
//  ViewController.m
//  lab7_1
//
//  Created by admin on 23/05/17.
//  Copyright (c) 2017 admin. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (strong, nonatomic)IBOutlet UIImageView *canvas;
@property(nonatomic) CGPoint lastPoint;
@property (nonatomic) float lineWidth;
@property (nonatomic, strong) UIColor *lineColor;
@property (nonatomic, strong) UIColor *backColor;
@property (weak, nonatomic) IBOutlet UIButton *redColorBut;
@property (weak, nonatomic) IBOutlet UIButton *greenColorBut;
@property (weak, nonatomic) IBOutlet UIButton *blueColorBut;
@property (weak, nonatomic) IBOutlet UISlider *slider;
@property (weak, nonatomic) IBOutlet UISwitch *switchBack;
@end

@implementation ViewController
- (IBAction)backgroundCheck:(id)sender {
    if ([self.switchBack isOn])
    {
        self.backColor = [UIColor yellowColor];
        self.canvas.backgroundColor = self.backColor;
    }
    else{
        self.backColor = [UIColor whiteColor];
        self.canvas.backgroundColor = self.backColor;
    }
}

- (IBAction)redColorAction:(id)sender {
    _lineColor = [UIColor redColor];}
- (IBAction)greenColorAction:(id)sender {
    _lineColor = [UIColor greenColor];
}
- (IBAction)blueColorAction:(id)sender {
    _lineColor = [UIColor blueColor];
}
- (IBAction)checkWidth:(id)sender {
    self.lineWidth = self.slider.value * 10;
}

- (IBAction)eraserButton:(id)sender {
    self.canvas.image = nil;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initUi];
    [self initData];
}
- (void) initData
{
    self.lineWidth = 3.f;
    self.backColor = [UIColor yellowColor];
    self.canvas.backgroundColor = self.backColor;
}

- (void) initUi
{
    self.canvas = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height - 200)];
    self.canvas.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.canvas];
   	
    _lineColor = [UIColor blackColor];
}
- (IBAction)savePicture:(id)sender {
    NSString *fileName = @"1.png";
    // Create path.
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *filePath = [[paths objectAtIndex:0] stringByAppendingPathComponent:fileName];
    NSLog(@"%@", filePath);
    // Save image.
    [UIImagePNGRepresentation(_canvas.image) writeToFile:filePath atomically:YES];

}

- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    [self setLastPoint:[touch locationInView:self.canvas]];
}

- (void) touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint currentPoint = [touch locationInView:self.canvas];
    UIGraphicsBeginImageContext(self.canvas.frame.size);
    CGRect drawRect = CGRectMake(0.0f, 0.0f, self.canvas.frame.size.width, self.canvas.frame.size.height);
    [[[self canvas]image]drawInRect:drawRect];
    CGContextSetLineCap(UIGraphicsGetCurrentContext(), kCGLineCapRound);
    if([_lineColor isEqual:[UIColor redColor]])
        CGContextSetRGBStrokeColor(UIGraphicsGetCurrentContext(), 1.0f, 0.0f, 0.0f, 1.0f);
    if([_lineColor isEqual:[UIColor blueColor]])
        CGContextSetRGBStrokeColor(UIGraphicsGetCurrentContext(), 0.0f, 0.0f, 1.0f, 1.0f);
    if([_lineColor isEqual:[UIColor greenColor]]	)
        CGContextSetRGBStrokeColor(UIGraphicsGetCurrentContext(), 0.0f, 1.0f, 0.0f, 1.0f);
    CGContextSetLineWidth(UIGraphicsGetCurrentContext(), self.lineWidth);
    CGContextBeginPath(UIGraphicsGetCurrentContext());
    CGContextMoveToPoint(UIGraphicsGetCurrentContext(), _lastPoint.x, _lastPoint.y);
    CGContextAddLineToPoint(UIGraphicsGetCurrentContext(), currentPoint.x, currentPoint.y);
    CGContextStrokePath(UIGraphicsGetCurrentContext());
    [[self canvas] setImage:UIGraphicsGetImageFromCurrentImageContext()];
    UIGraphicsEndImageContext();
    _lastPoint = currentPoint;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UIPickerView Delegate,DataSource

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}





@end
