//
//  MyAnimator.m
//  CustomTransitionTest
//
//  Created by Appest on 15/10/29.
//  Copyright © 2015年 Appest Limited. All rights reserved.
//

#import "MyAnimator.h"

@implementation MyAnimator

- (NSTimeInterval)transitionDuration:(nullable id <UIViewControllerContextTransitioning>)transitionContext{
    return [transitionContext isAnimated] ? 0.5 : 0.5;
    
}
- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext{
    // Get the set of relevant objects.
    UIView *containerView = [transitionContext containerView];
    UIViewController *fromVC = [transitionContext
                                viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toVC   = [transitionContext
                                viewControllerForKey:UITransitionContextToViewControllerKey];
    
    UIView *toView = [transitionContext viewForKey:UITransitionContextToViewKey];
    UIView *fromView = [transitionContext viewForKey:UITransitionContextFromViewKey];
    
    // Set up some variables for the animation.
    CGRect containerFrame = containerView.frame;
    CGRect toViewStartFrame = [transitionContext initialFrameForViewController:toVC];
    CGRect toViewFinalFrame = [transitionContext finalFrameForViewController:toVC];
    CGRect fromViewFinalFrame = [transitionContext finalFrameForViewController:fromVC];
    
    // Set up the animation parameters.
    if (self.isPresented) {
        // Modify the frame of the presented view so that it starts
        // offscreen at the lower-right corner of the container.
        toViewStartFrame.origin.x = containerFrame.size.width;
        toViewStartFrame.origin.y = containerFrame.size.height;
    }
    else {
        // Modify the frame of the dismissed view so it ends in
        // the lower-right corner of the container view.
        fromViewFinalFrame = CGRectMake(containerFrame.size.width,
                                        containerFrame.size.height,
                                        toView.frame.size.width,
                                        toView.frame.size.height);
    }
    
    // Always add the "to" view to the container.
    // And it doesn't hurt to set its start frame.
    [containerView addSubview:toView];
    toView.frame = toViewStartFrame;
    
    // Animate using the animator's own duration value.
    [UIView animateWithDuration:[self transitionDuration:transitionContext]
                     animations:^{
                         if (self.isPresented) {
                             // Move the presented view into position.
                             [toView setFrame:toViewFinalFrame];
                         }
                         else {
                             // Move the dismissed view offscreen.
                             [fromView setFrame:fromViewFinalFrame];
                         }
                     }
                     completion:^(BOOL finished){
                         BOOL success = ![transitionContext transitionWasCancelled];
                         
                         // After a failed presentation or successful dismissal, remove the view.
                         if ((self.isPresented && !success) || (!self.isPresented && success)) {
                             [toView removeFromSuperview];
                         }
                         
                         // Notify UIKit that the transition has finished
                         [transitionContext completeTransition:success];
                     }];
}

- (void)animationEnded:(BOOL) transitionCompleted{
    
}

@end
