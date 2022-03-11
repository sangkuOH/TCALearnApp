//
//  RootState.swift
//  TACLeanApp (iOS)
//
//  Created by 상구 on 2022/03/10.
//

import Foundation

enum RootState: Equatable {
	case main(MainState)
	case onboarding(OnboardingState)
}
