//
//  OnboardingReducer.swift
//  TACLeanApp (iOS)
//
//  Created by 상구 on 2022/03/10.
//

import Foundation
import ComposableArchitecture


let onboardingReducer: Reducer<OnboardingState, OnboardingAction, OnboardingEnvironment> =
	.init { state, action, environment in
		switch action {
		case .onAppear:
			return .none
		}
	}
