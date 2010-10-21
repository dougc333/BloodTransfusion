//
//  BloodTranfusionAppDelegate.m
//  BloodTranfusion
//
//  Created by doug chang on 9/19/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import "BloodTranfusionAppDelegate.h"

@implementation BloodTranfusionAppDelegate

@synthesize window, bloodPicker,yesOrNo,model;


-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
	return [self.model.bloodTypes count];
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
	return [[self.model.bloodTypes objectAtIndex:component] count];
}

-(NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
	return [[self.model.bloodTypes objectAtIndex:component] objectAtIndex:row];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
	NSArray *temp = [self.model.bloodTypes objectAtIndex:component];
	if (component==0) {
		//have to reach into the model to set the value, 
		//we should initialize this in the model ctor
		self.model.firstDonorBloodType=[temp objectAtIndex:row];
		//call compare blood types, 
		if(![self.model compareBloodTypes]){
			[self setYes];
		}
		else {
			[self setNo];
		}
	}else if(component==1){
		self.model.secondDonorBloodType=[temp objectAtIndex:row];
		if(![self.model compareBloodTypes]){
			[self setYes];
		}
		else {
			[self setNo];
		}
	}
}

-(void)setYes{
	yesOrNo.textColor=[UIColor greenColor];
	yesOrNo.text=@"YES";
}

-(void)setNo{
	yesOrNo.textColor=[UIColor redColor];
	yesOrNo.text=@"NO";
}


- (void)applicationDidFinishLaunching:(UIApplication *)application {    
	self.model = [[BloodTranfusionModel alloc] init];
	[bloodPicker selectRow:1 inComponent:0 animated:YES];
	NSArray *blood = [[self.model.bloodTypes objectAtIndex:1]autorelease];
	self.model.firstDonorBloodType = [blood objectAtIndex:1];
	[bloodPicker selectRow:2 inComponent:1 animated:YES];
	self.model.secondDonorBloodType = [blood objectAtIndex:2];
	if(![self.model compareBloodTypes]){
		[self setYes];
	}
	else {
		[self setNo];
	}
    [window makeKeyAndVisible];
}


- (void)dealloc {
	bloodPicker = nil;
	[[self.model.bloodTypes objectAtIndex:0] release];
	[[self.model.bloodTypes objectAtIndex:1] release];
	//release IBOutlets
	[yesOrNo release];
	[bloodPicker release];
    [window release];
    [super dealloc];
}


@end
