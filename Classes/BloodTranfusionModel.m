//
//  BloodTranfusionModel.m
//  BloodTranfusion
//
//  Created by doug chang on 9/29/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "BloodTranfusionModel.h"


@implementation BloodTranfusionModel
@synthesize bloodTypes,firstDonorBloodType, secondDonorBloodType;

-(id)init{
	NSArray *blood = [[NSArray alloc] initWithObjects:@"A",@"B",@"AB",@"O",nil];
	NSArray *array = [[NSArray alloc] initWithObjects:blood,blood,nil];
	self.bloodTypes = array;
	return self;
}

//setYes, setNo methods are in the view you have to return a boolean
//and let the view call the right method
-(BOOL)compareBloodTypes {
	NSLog(@"calling compareBloodTypes firstDonorBloodType:%@",firstDonorBloodType);
	NSLog(@"calling compareBloodTypes secondDonorBloodType:%@",secondDonorBloodType);
	if ([self firstDonorBloodType]==@"A") {
		if ([self secondDonorBloodType]==@"A" || [self secondDonorBloodType]==@"AB") {
			//[self setYes];
			return YES;
		}else{
//			[self setNo];
			return NO;
		}
	}else if ([self firstDonorBloodType]==@"B") {
		if ([self secondDonorBloodType]==@"B" || [self secondDonorBloodType]==@"AB") {
			//[self setYes];
			return YES;
		}else{
//			[self setNo];
			return NO;
		}
	}else if ([self firstDonorBloodType]==@"AB") {
		if ([self secondDonorBloodType]==@"AB") {
			//[self setYes];
			return YES;
		}else{
//			[self setNo];
			return NO;
		}	
	}else if ([self firstDonorBloodType]==@"O") {
		//[self setYes];
		return YES;
	}
	
}

@end
