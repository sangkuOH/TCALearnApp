//
//  RootAction.swift
//  TACLeanApp (iOS)
//
//  Created by 상구 on 2022/03/10.
//

import Foundation
import ComposableArchitecture

enum RootAction: Equatable {
	case moveToMain
	
	case main(MainAction)
	case onboarding(OnboardingAction)
}
