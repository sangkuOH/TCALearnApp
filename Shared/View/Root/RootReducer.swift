//
//  RootReducer.swift
//  TACLeanApp (iOS)
//
//  Created by 상구 on 2022/03/10.
//

import Foundation
import ComposableArchitecture

let rootReducer: Reducer<RootState, RootAction, RootEnvironment> =
	.combine(
		mainReducer
			.pullback(
				state: /RootState.main,
				action: /RootAction.main,
				environment: {
					.init(mainQueue: $0.mainQueue)
				}
			),
		onboardingReducer
			.pullback(
				state: /RootState.onboarding,
				action: /RootAction.onboarding,
				environment: { _ in .init() }
			),
		.init { state, action, environment in
			switch action {
			case .main:
				return .none
			case .onboarding:
				return .init(value: .moveToMain)
			case .moveToMain:
				state = .main(.init())
				return .none
			}
		}
	)
