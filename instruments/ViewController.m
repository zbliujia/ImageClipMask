//
//  ViewController.m
//  instruments
//
//  Created by jiedaibao on 16/3/31.
//  Copyright © 2016年 jiedaibao. All rights reserved.
//

#import "ViewController.h"
#import <objc/runtime.h>

@interface TestObject : NSObject

@end

@implementation TestObject

- (void)test{
    NSLog(@"test1");
}

@end


@interface ViewController ()

- (void)test;

@end

@implementation ViewController

//- (BOOL)respondsToSelector:(SEL)aSelector{
//        return YES;
//}

- (void)forwardInvocation:(NSInvocation *)invocation
{
    SEL aSelector = [invocation selector];
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
            [invocation invokeWithTarget:[[TestObject alloc] init]];
    });
    //[super forwardInvocation:invocation];
}

- (nullable NSMethodSignature *)methodSignatureForSelector:(SEL)sel
{
    NSMethodSignature *s = [super methodSignatureForSelector:sel];
    if(!s){
        s = [NSObject methodSignatureForSelector:@selector(init)];
    }
    return s;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UISearchBar *searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 45)];
    searchBar.barTintColor = [UIColor colorWithRed:0.85 green:0.85 blue:0.86 alpha:1];
    searchBar.delegate = self;
    searchBar.placeholder = @"搜手机号加好友";
    
    UIView *view = [[UIView alloc] init];
    [searchBar addSubview:view];
    view.frame = CGRectMake(0, searchBar.frame.size.height - 2, searchBar.frame.size.width, 2);
    view.backgroundColor = [UIColor colorWithRed:0.91 green:0.91 blue:0.92 alpha:1];
    
    self.table.tableHeaderView = searchBar;
    
//    self.table.tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.table.frame.size.width, 100)];
//    self.table.tableHeaderView.backgroundColor = [UIColor redColor];
    [self test];
    
    NSString *str = @"123";
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        for (int i = 0 ; i < 100000; i++) {
            for (int i = 0 ; i < str.length; i++) {
                char c = [str characterAtIndex:i];
                NSLog(@"%c",c);
            }
        }
    });
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        for (int i = 0 ; i < 100000; i++) {
            for (int i = 0 ; i < str.length; i++) {
                [str characterAtIndex:i];
            }
        }
    });
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        for (int i = 0 ; i < 100000; i++) {
            for (int i = 0 ; i < str.length; i++) {
                [str characterAtIndex:i];
            }
        }
    });
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        for (int i = 0 ; i < 100000; i++) {
            for (int i = 0 ; i < str.length; i++) {
                [str characterAtIndex:i];
            }
        }
    });
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        for (int i = 0 ; i < 100000; i++) {
            for (int i = 0 ; i < str.length; i++) {
                [str characterAtIndex:i];
            }
        }
    });
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        for (int i = 0 ; i < 100000; i++) {
            for (int i = 0 ; i < str.length; i++) {
                [str characterAtIndex:i];
            }
        }
    });
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        for (int i = 0 ; i < 100000; i++) {
            for (int i = 0 ; i < str.length; i++) {
                [str characterAtIndex:i];
            }
        }
    });
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        for (int i = 0 ; i < 100000; i++) {
            for (int i = 0 ; i < str.length; i++) {
                [str characterAtIndex:i];
            }
        }
    });
    
    
    // Do any additional setup after loading the view, typically from a nib.
    self.testButton.titleLabel.backgroundColor = [UIColor greenColor];
    NSLog(@"replace");
    [self replace];
    NSLog(@"replace1");
    [self replace1];
    [self method1];
    
    NSLog(@"%@",self.nibName);
    //NSLog(@"%@",_nibName);
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIImage *)yal_imageWithRoundedCornersAndSize:(CGSize)sizeToFit andCornerRadius:(CGFloat)radius
{
    CGRect rect = (CGRect){0.f, 0.f, sizeToFit};
    
    UIGraphicsBeginImageContextWithOptions(sizeToFit, NO, UIScreen.mainScreen.scale);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathAddPath(path, NULL, [UIBezierPath bezierPathWithRect:rect].CGPath);
    //CGPathCloseSubpath(path);
    CGPathAddPath(path, NULL, [UIBezierPath bezierPathWithRoundedRect:rect cornerRadius:radius].CGPath);
    //CGPathCloseSubpath(path);
    
    //CGContextAddPath(context, [UIBezierPath bezierPathWithRect:rect].CGPath);
//    CGContextAddPath(context,
//                     [UIBezierPath bezierPathWithRoundedRect:rect cornerRadius:radius].CGPath);
    
    CGContextAddPath(context, path);
    
    //CGContextClip(context);
    CGContextEOClip(context);
    
    CGContextSetRGBFillColor(context,0,0,1,1);
    CGContextFillRect(context, rect);
    //CGContextEOFillPath(context);
    
    UIImage *output = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return output;
}

//自己做得图片 就没有问题 用别人的图片 浪费了太多时间 擦擦擦
- (UIImage *)yal_imageWithImage:(CGSize)sizeToFit
{
    CGRect rect = (CGRect){0.f, 0.f, sizeToFit};
    
    UIGraphicsBeginImageContextWithOptions(sizeToFit, NO, UIScreen.mainScreen.scale);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    //clip掉了透明的地方
    //画在了不透明的地方 说明把透明的地方clip掉了
    UIImage *imgage = [UIImage imageNamed:@"select_s"];
    CGImageRef maskImage = [imgage CGImage];
    NSLog(@"%@",NSStringFromCGSize([imgage size]));
    
    //clip掉了 不 透明的地方
    //CGImageRef originalMask = [UIImage imageNamed:@"select_s"].CGImage;
    //CGImageRef maskImage = CGImageMaskCreate(CGImageGetWidth(originalMask),CGImageGetHeight(originalMask),CGImageGetBitsPerComponent(originalMask),CGImageGetBitsPerPixel(originalMask),CGImageGetBytesPerRow(originalMask),CGImageGetDataProvider(originalMask), nil, false);
    
    CGContextClipToMask(context, rect, maskImage);
    
    CGContextSetRGBFillColor(context,0,0,1,1);
    CGContextFillRect(context, rect);
    
    UIImage *output = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return output;
}

//clip掉了不透明的地方
- (UIImage*) maskImage:(UIImage *)image withMask:(UIImage *)maskImage {
    
    CGImageRef maskRef = maskImage.CGImage;
    
    CGImageRef mask = CGImageMaskCreate(CGImageGetWidth(maskRef),
                                        CGImageGetHeight(maskRef),
                                        CGImageGetBitsPerComponent(maskRef),
                                        CGImageGetBitsPerPixel(maskRef),
                                        CGImageGetBytesPerRow(maskRef),
                                        CGImageGetDataProvider(maskRef), NULL, false);
    
    CGImageRef masked = CGImageCreateWithMask([image CGImage], mask);
    return [UIImage imageWithCGImage:masked];
    
}

- (IBAction)onTest:(id)sender {
    
    [self.testButton setBackgroundImage:[self yal_imageWithImage:self.testButton.frame.size] forState:UIControlStateNormal];
    
    //[self.testButton setBackgroundImage:[self maskImage:[UIImage imageNamed:@"bg_blank.png"] withMask:[UIImage imageNamed:@"bg_authentication.png"]] forState:UIControlStateNormal];

    self.testImage.image = [self maskImage:[UIImage imageNamed:@"bg_authentication"] withMask:[UIImage imageNamed:@"select_s"]];
    
//    [self.testButton setBackgroundImage:[UIImage imageNamed:@"bg_authentication.png"] forState:UIControlStateNormal];

    
    //[self.testButton setBackgroundImage:[self yal_imageWithRoundedCornersAndSize:self.testButton.frame.size andCornerRadius:30.0] forState:UIControlStateNormal];
}

- (void)method1{
    NSLog(@"method1");
}

- (void)method2{
    NSLog(@"method2");
    [self method2];
}

- (void)method3{
    NSLog(@"method3");
    [self method3];
}

- (void)replace{
    
    Class class = [self class];
    
    SEL originalSelector = @selector(method1);
    SEL swizzledSelector = @selector(method2);
    
    Method originalMethod = class_getInstanceMethod(class, originalSelector);
    Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);
    
    // When swizzling a class method, use the following:
    // Class class = object_getClass((id)self);
    // ...
    // Method originalMethod = class_getClassMethod(class, originalSelector);
    // Method swizzledMethod = class_getClassMethod(class, swizzledSelector);
    
    BOOL didAddMethod =
    class_addMethod(class,
                    originalSelector,
                    method_getImplementation(swizzledMethod),
                    method_getTypeEncoding(swizzledMethod));
    
    if (didAddMethod) {
        class_replaceMethod(class,
                            swizzledSelector,
                            method_getImplementation(originalMethod),
                            method_getTypeEncoding(originalMethod));
    } else {
        method_exchangeImplementations(originalMethod, swizzledMethod);
    }
}

- (void)replace1{
    
    Class class = [self class];
    
    SEL originalSelector = @selector(method1);
    SEL swizzledSelector = @selector(method3);
    
    Method originalMethod = class_getInstanceMethod(class, originalSelector);
    Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);
    
    // When swizzling a class method, use the following:
    // Class class = object_getClass((id)self);
    // ...
    // Method originalMethod = class_getClassMethod(class, originalSelector);
    // Method swizzledMethod = class_getClassMethod(class, swizzledSelector);
    
    BOOL didAddMethod =
    class_addMethod(class,
                    originalSelector,
                    method_getImplementation(swizzledMethod),
                    method_getTypeEncoding(swizzledMethod));
    
    if (didAddMethod) {
        class_replaceMethod(class,
                            swizzledSelector,
                            method_getImplementation(originalMethod),
                            method_getTypeEncoding(originalMethod));
    } else {
        method_exchangeImplementations(originalMethod, swizzledMethod);
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 2;
}

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CellIdentifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    cell.backgroundColor = [UIColor clearColor];
    cell.textLabel.text = [NSString stringWithFormat:@"%ld %ld",(long)indexPath.section,(long)indexPath.row];
    //config the cell
    return cell;
}

@end
