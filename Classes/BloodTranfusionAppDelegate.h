//
//  BloodTranfusionAppDelegate.h
//  BloodTranfusion
//
//  Created by doug chang on 9/19/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BloodTranfusionModel.h"

@interface BloodTranfusionAppDelegate : NSObject <UIApplicationDelegate,UIPickerViewDelegate, UIPickerViewDataSource> {
    UIWindow *window;
	UIPickerView *bloodPicker;
	UILabel *yesOrNo;
	BloodTranfusionModel *model;
}

@property (nonatomic, retain) BloodTranfusionModel *model;
@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UIPickerView *bloodPicker;
@property (nonatomic, retain) IBOutlet UILabel *yesOrNo;

-(void) setYes;
-(void) setNo;

@end

