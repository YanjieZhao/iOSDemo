//
//  PopDemoViewController.m
//  iOSDemo
//
//  Created by 赵艳杰 on 16/4/30.
//  Copyright © 2016年 Netease. All rights reserved.
//

#import "PopDemoViewController.h"
#import <POP/Pop.h>

@interface PopDemoViewController ()
@property (weak, nonatomic) IBOutlet UIView *popUp;
@property (weak, nonatomic) IBOutlet UIButton *click;
- (IBAction)animClick:(id)sender;
@property (weak, nonatomic) IBOutlet UIImageView *image;
@property(nonatomic) NSUInteger initialLocation;
@property(nonatomic) NSUInteger lastLocation;
@property (weak, nonatomic) IBOutlet UIView *commentView;
@property (weak, nonatomic) IBOutlet UIView *containerView;
@property (assign, nonatomic) double imageMarginY;
@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;
@end

@implementation PopDemoViewController
UIView *plainView ;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _popUp.hidden = YES;
    
    NSArray *nibContents = [[NSBundle mainBundle] loadNibNamed:@"MenuView" owner:nil options:nil];
    
    // Find the view among nib contents (not too hard assuming there is only one view in it).
    plainView = [nibContents lastObject];
    
    CGRect rect = CGRectMake(20, 58, 200, 250);
    plainView.frame = rect;
    
    [self.view addSubview:plainView];
    plainView.hidden = YES;
    
    _imageMarginY = _containerView.frame.origin.y + _containerView.frame.size.height / 2;
    [self updateDots];
}

- (void) updateDots {
    for (int i = 0; i < [self.pageControl.subviews count]; i++) {
        UIImageView * dot = [self imageViewForSubview:[self.pageControl.subviews objectAtIndex: i]];
        if (i == self.pageControl.currentPage) dot.image = [UIImage imageNamed:@"Slice 1"];
        else dot.image = [UIImage imageNamed:@"Slice 2"];
    }
}

- (UIImageView *) imageViewForSubview: (UIView *) view {
    UIImageView * dot = nil;
    if ([view isKindOfClass: [UIView class]]) {
        for (UIView* subview in view.subviews) {
            if ([subview isKindOfClass:[UIImageView class]]) {
                dot = (UIImageView *)subview;
                break;
            }
        }
        if (dot == nil) {
            dot = [[UIImageView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, view.frame.size.width, view.frame.size.height)];
            [view addSubview:dot];
        }
    }else {
        dot = (UIImageView *) view;
    }
    
    return dot;
}

- (void)viewDidAppear:(BOOL)animated
{
    [self addGestureRecognizers];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)addGestureRecognizers
{
    UIPanGestureRecognizer *panGestureRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self
                                                                                           action:@selector(handlePan:)];
    
    UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                                           action:@selector(poke)];
    
    [self.view addGestureRecognizer:panGestureRecognizer];
    [self.view addGestureRecognizer:tapGestureRecognizer];
}
- (void)poke
{
    //[self rotateToOriginWithVelocity:5];
}
- (BOOL)isCommentViewOpened
{
    return _commentView.frame.origin.y + _commentView.frame.size.height - 5 <= self.view.bounds.size.height;
}
- (BOOL)isCommentViewHide
{
    return _commentView.frame.origin.y >= self.view.bounds.size.height;
}
- (void)animateCommentView:(double)currentLocation lastLocation:(double)lastLocation
{
    double centerY = (_commentView.frame.origin.y + _commentView.frame.size.height / 2);
    float delta = currentLocation - lastLocation;
    //delta *= 2;
    double toValue = centerY + delta;
    if (toValue < self.view.bounds.size.height - _commentView.bounds.size.height / 2) {
        toValue = self.view.bounds.size.height - _commentView.bounds.size.height / 2;
    }
    
    [self animateCommentView:toValue duration:0.01];
}

- (void)animateCommentView:(double)toCenterY duration:(double)duration
{
    double centerX = (_commentView.frame.origin.x + _commentView.frame.size.width / 2);
    POPBasicAnimation *anim = [POPBasicAnimation animationWithPropertyNamed:kPOPViewCenter];
    
    if (toCenterY < self.view.bounds.size.height - _commentView.bounds.size.height / 2) {
        toCenterY = self.view.bounds.size.height - _commentView.bounds.size.height / 2;
    }
    
    anim.toValue = [NSValue valueWithCGPoint:CGPointMake(centerX, toCenterY)];
    anim.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    anim.duration = duration;
    [self.commentView pop_addAnimation:anim forKey:@"centerAnimation"];
    
    
}
- (void)openCommentView
{
    double centerY = self.view.bounds.size.height - _commentView.bounds.size.height / 2;
    [self animateCommentView:centerY duration:1.f];
    POPDecayAnimation *anDecay = [POPDecayAnimation animationWithPropertyNamed:kPOPLayerPositionY];
    anDecay.velocity = @(0 - centerY / 2);
    NSLog(@"%f,%f", centerY, anDecay.duration);
    
    POPSpringAnimation *spring = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerPositionY];
    spring.springSpeed = 0.5f;
    spring.springBounciness = 2.f;
    spring.toValue = @(centerY);

    //[self.commentView pop_addAnimation:anDecay forKey:@"decay"];
    //[self.commentView pop_addAnimation:spring forKey:@"decay1"];
}
- (void)closeCommentView
{
    double centerY = self.view.bounds.size.height + _commentView.bounds.size.height / 2;
    [self animateCommentView:centerY duration:1.f];
    
    
    POPDecayAnimation *anDecay = [POPDecayAnimation animationWithPropertyNamed:kPOPLayerPositionY];
    anDecay.velocity = @(centerY);
    POPSpringAnimation *spring = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerPositionY];
    spring.toValue = @(centerY);
    NSLog(@"%f,%f", centerY, anDecay.duration);
    //[self.commentView pop_addAnimation:anDecay forKey:@"decay"];
    //[self.commentView pop_addAnimation:spring forKey:@"decay1"];
}

- (void)animateDesktop:(double)currentLocation lastLocation:(double)lastLocation
{
    double rate = (currentLocation-self.initialLocation)/(CGRectGetHeight(self.view.bounds)-self.initialLocation);
    rate /= 8;
    
    double scaleRate = 1 + rate;
    if (rate > 0) {
        scaleRate = 0.8 + rate;
    }
    CGFloat conversionFactor = -M_PI / (CGRectGetHeight(self.view.bounds) - self.initialLocation);
    double factor = (currentLocation-self.initialLocation)*conversionFactor;
    factor /= 6;
    
    double coverCenterY = _containerView.frame.origin.y + _containerView.frame.size.height / 2;
    coverCenterY += (currentLocation - lastLocation) / 2;
    if (coverCenterY > _imageMarginY) {
        coverCenterY = _imageMarginY;
    }
    if (coverCenterY < 40 + _containerView.frame.size.height / 2) {
        coverCenterY = 40 + _containerView.frame.size.height / 2;
    }
    
    [self animateDesktop:scaleRate toRotation:factor coverCenterY:coverCenterY duration:0.01f];
}
- (void)resetDesktop:(BOOL)isCommentViewClosed
{
    double toScale = .8f;
    double transformX = 0.6f;
    double coverCenterY = 40 + _containerView.frame.size.height / 2;
    if (isCommentViewClosed) {
        toScale = 1.f;
        transformX = 0;
        coverCenterY = _imageMarginY;
    }
    
    [self animateDesktop:toScale toRotation:transformX coverCenterY:coverCenterY duration:0.2f];
    
}
- (void)animateDesktop:(double)toScale toRotation:(double)toRotation coverCenterY:(double)coverCenterY duration:(double)duration
{
    double scaleRate = toScale;
    if (scaleRate > 1) {
        scaleRate = 1;
    }
    if (scaleRate < 0.8) {
        scaleRate = 0.8;
    }
    
    if (toRotation < 0) {
        toRotation = 0.6 + toRotation;
    }
    if (toRotation > 0.6) {
        toRotation = 0.6;
    }
    
    POPBasicAnimation *scaleAnimation = [POPBasicAnimation animationWithPropertyNamed:kPOPLayerScaleXY];
    scaleAnimation.toValue  = [NSValue valueWithCGSize:CGSizeMake(scaleRate, scaleRate)];
    scaleAnimation.duration = duration;
    [_image.layer pop_addAnimation:scaleAnimation forKey:@"scaleAnimation"];
    
    POPBasicAnimation *rotationAnimation = [POPBasicAnimation animationWithPropertyNamed:kPOPLayerRotationX];
    rotationAnimation.duration = duration;
    rotationAnimation.toValue = @(toRotation);
    [self.image.layer pop_addAnimation:rotationAnimation forKey:@"rotationAnimation"];
    
    double centerX = (_containerView.frame.origin.x + _containerView.frame.size.width / 2);
    POPBasicAnimation *anim = [POPBasicAnimation animationWithPropertyNamed:kPOPViewCenter];
    anim.toValue = [NSValue valueWithCGPoint:CGPointMake(centerX, coverCenterY)];
    anim.duration = duration;
    [self.containerView pop_addAnimation:anim forKey:@"desktopCenterAnimation"];
}


- (void)handlePan:(UIPanGestureRecognizer *)recognizer
{
    CGPoint location = [recognizer locationInView:self.view];
    double gesDelta = location.y - self.initialLocation;
    if (recognizer.state == UIGestureRecognizerStateBegan) {
        self.initialLocation = location.y;
        
        if ([self isCommentViewOpened]) {
            return;
        }
        CATransform3D transform = CATransform3DIdentity;
        transform.m34 =  2.5 / -1000;
        transform = CATransform3DTranslate(transform, 0, 0, -3);
        _image.layer.transform = transform;
        
        _image.layer.zPosition = -10000;
        [self.view bringSubviewToFront:_commentView];
    }
    if (recognizer.state == UIGestureRecognizerStateEnded ||
        recognizer.state == UIGestureRecognizerStateCancelled) {
        if (gesDelta > 0) {
            [self closeCommentView];
            [self resetDesktop:YES];
        } else {
            [self openCommentView];
            [self resetDesktop:NO];
        }
        return;
    }
    
    
    if (gesDelta > 0) {
        //向下滑动
        if (![self isCommentViewHide]) {
            [self animateCommentView:location.y lastLocation:self.lastLocation];
            [self animateDesktop:location.y lastLocation:self.lastLocation];
        }
    } else {
        //向上滑动
        if (![self isCommentViewOpened]) {
            [self animateCommentView:location.y lastLocation:self.lastLocation];
            [self animateDesktop:location.y lastLocation:self.lastLocation];
        }
        
    }
    self.lastLocation = location.y;
    return;
    
    
    
    
    if ([[self.image.layer valueForKeyPath:@"transform.rotation.x"] floatValue] < -M_PI_2) {
        //self.backView.alpha = 1.0;
        NSLog(@"%@", @"handlePan");
        [CATransaction begin];
        [CATransaction setValue:(id)kCFBooleanTrue
                         forKey:kCATransactionDisableActions];
        //self.topShadowLayer.opacity = 0.0;
        //self.bottomShadowLayer.opacity = (location.y-self.initialLocation)/(CGRectGetHeight(self.bounds)-self.initialLocation);
        [CATransaction commit];
    } else {
        //self.backView.alpha = 0.0;
        [CATransaction begin];
        [CATransaction setValue:(id)kCFBooleanTrue
                         forKey:kCATransactionDisableActions];
        CGFloat opacity = (location.y-self.initialLocation)/(CGRectGetHeight(self.view.bounds)-self.initialLocation);
        //self.bottomShadowLayer.opacity = opacity;
        //self.topShadowLayer.opacity = opacity;
        [CATransaction commit];
    }
    
    if ([self isLocation:location inView:self.view]) {
        CGFloat conversionFactor = -M_PI / (CGRectGetHeight(self.view.bounds) - self.initialLocation);
        POPBasicAnimation *rotationAnimation = [POPBasicAnimation animationWithPropertyNamed:kPOPLayerRotationX];
        
        rotationAnimation.duration = 0.01;
        double factor = (location.y-self.initialLocation)*conversionFactor;
        NSLog(@"factor: %f", factor);
        rotationAnimation.toValue = @(factor);
        [self.image.layer pop_addAnimation:rotationAnimation forKey:@"rotationAnimation"];
    } else {
        recognizer.enabled = NO;
        recognizer.enabled = YES;
    }
    
    if (recognizer.state == UIGestureRecognizerStateEnded ||
        recognizer.state == UIGestureRecognizerStateCancelled) {
        [self rotateToOriginWithVelocity:0];
    }
    
}
- (BOOL)isLocation:(CGPoint)location inView:(UIView *)view
{
    if ((location.x > 0 && location.x < CGRectGetWidth(self.view.bounds)) &&
        (location.y > 0 && location.y < CGRectGetHeight(self.view.bounds))) {
        return YES;
    }
    return NO;
}

- (void)rotateToOriginWithVelocity:(CGFloat)velocity
{
    POPSpringAnimation *rotationAnimation = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerRotationX];
    if (velocity > 0) {
        rotationAnimation.velocity = @(velocity);
    }
    rotationAnimation.springBounciness = 18.0f;
    rotationAnimation.dynamicsMass = 2.0f;
    rotationAnimation.dynamicsTension = 200;
    rotationAnimation.toValue = @(0);
    rotationAnimation.delegate = self;
    [self.image.layer pop_addAnimation:rotationAnimation forKey:@"rotationAnimation"];
}

- (void)showPopup
{
    _popUp.layer.cornerRadius = 5.f;
    POPBasicAnimation *opacityAnimation = [POPBasicAnimation animationWithPropertyNamed:kPOPLayerOpacity];
    opacityAnimation.fromValue = @(0);
    opacityAnimation.toValue = @(1);
    opacityAnimation.beginTime = CACurrentMediaTime();
    [plainView.layer pop_addAnimation:opacityAnimation forKey:@"opacityAnimation"];
    
    POPBasicAnimation *positionAnimation = [POPBasicAnimation animationWithPropertyNamed:kPOPLayerPosition];
    positionAnimation.fromValue = [NSValue valueWithCGPoint:CGPointMake(68, 58)];
    positionAnimation.toValue = [NSValue valueWithCGPoint:CGPointMake(128, 183)];
    positionAnimation.duration = .7f;
    [plainView.layer pop_addAnimation:positionAnimation forKey:@"positionAnimation"];
    
    
//    POPSpringAnimation *scaleAnimationS = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerScaleXY];
//    scaleAnimationS.fromValue  = [NSValue valueWithCGSize:CGSizeMake(0.5f, 0.5f)];
//    scaleAnimationS.toValue  = [NSValue valueWithCGSize:CGSizeMake(1.0f, 1.0f)];//@(0.0f);
//    scaleAnimationS.beginTime = CACurrentMediaTime() + 2.5f;
//    scaleAnimationS.springBounciness = 20.0f;
//    scaleAnimationS.springSpeed = 20.0f;
//    [plainView.layer pop_addAnimation:scaleAnimationS forKey:@"scaleAnimation"];
    
    POPBasicAnimation *scaleAnimation = [POPBasicAnimation animationWithPropertyNamed:kPOPLayerScaleXY];
    scaleAnimation.fromValue  = [NSValue valueWithCGSize:CGSizeMake(0.f, 0.f)];
    scaleAnimation.toValue  = [NSValue valueWithCGSize:CGSizeMake(1.f, 1.f)];//@(0.0f);
    scaleAnimation.duration = .7f;
    [plainView.layer pop_addAnimation:scaleAnimation forKey:@"scaleAnimation"];

    plainView.hidden = NO;
}

- (void)hidePop
{
    _popUp.layer.cornerRadius = 5.f;
    POPBasicAnimation *opacityAnimation = [POPBasicAnimation animationWithPropertyNamed:kPOPLayerOpacity];
    opacityAnimation.fromValue = @(1);
    opacityAnimation.toValue = @(0);
    opacityAnimation.beginTime = CACurrentMediaTime() + .9f;
    [plainView.layer pop_addAnimation:opacityAnimation forKey:@"opacityAnimation"];
    
    POPBasicAnimation *positionAnimation = [POPBasicAnimation animationWithPropertyNamed:kPOPLayerPosition];
    positionAnimation.fromValue = [NSValue valueWithCGPoint:CGPointMake(128, 183)];
    positionAnimation.toValue = [NSValue valueWithCGPoint:CGPointMake(68, 58)];
    positionAnimation.duration = .5f;
    [plainView.layer pop_addAnimation:positionAnimation forKey:@"positionAnimation"];
    positionAnimation.completionBlock = ^(POPAnimation *a,BOOL y){
        plainView.hidden = YES;
    };
    
    //    POPSpringAnimation *scaleAnimationS = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerScaleXY];
    //    scaleAnimationS.fromValue  = [NSValue valueWithCGSize:CGSizeMake(0.5f, 0.5f)];
    //    scaleAnimationS.toValue  = [NSValue valueWithCGSize:CGSizeMake(1.0f, 1.0f)];//@(0.0f);
    //    scaleAnimationS.beginTime = CACurrentMediaTime() + 2.5f;
    //    scaleAnimationS.springBounciness = 20.0f;
    //    scaleAnimationS.springSpeed = 20.0f;
    //    [plainView.layer pop_addAnimation:scaleAnimationS forKey:@"scaleAnimation"];
    
    POPBasicAnimation *scaleAnimation = [POPBasicAnimation animationWithPropertyNamed:kPOPLayerScaleXY];
    scaleAnimation.fromValue  = [NSValue valueWithCGSize:CGSizeMake(1.f, 1.f)];
    scaleAnimation.toValue  = [NSValue valueWithCGSize:CGSizeMake(0.f, 0.f)];//@(0.0f);
    scaleAnimation.duration = .5f;
    [plainView.layer pop_addAnimation:scaleAnimation forKey:@"scaleAnimation"];
}

- (IBAction)animClick:(id)sender {
    if (plainView.isHidden) {
        [self showPopup];
    } else {
        [self hidePop];
    }
    
}
@end
