//
//  BloodTranfusionModel.h
//  BloodTranfusion
//
//  Created by doug chang on 9/29/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface BloodTranfusionModel : NSObject {
	NSArray *bloodTypes;
	NSString *firstDonorBloodType;
	NSString *secondDonorBloodType;
}

@property (nonatomic, retain) NSArray *bloodTypes;
@property (nonatomic, retain) NSString *firstDonorBloodType;
@property (nonatomic, retain) NSString *secondDonorBloodType;

//you can have parameters in here. The model needs to hold the ivars? 
//or you can put this in the controller? 
-(BOOL)compareBloodTypes;

//
@end
