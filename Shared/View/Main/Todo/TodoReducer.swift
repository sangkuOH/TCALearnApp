//
//  TodoReducer.swift
//  TACLeanApp (iOS)
//
//  Created by 상구 on 2022/03/11.
//

import Foundation
import ComposableArchitecture

let todoReducer: Reducer<
	Todo,
	TodoAction,
	TodoEnvironment
> = .init { state, action, environment in
	switch action {
	case .circlebadgeTapped:
		state.isFinish.toggle()
		return .none
	case .textfieldChanged(let text):
		state.description = text
		return .none
	}
}
.debug()

