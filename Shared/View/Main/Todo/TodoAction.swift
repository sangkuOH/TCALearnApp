//
//  TodoAction.swift
//  TACLeanApp (iOS)
//
//  Created by 상구 on 2022/03/11.
//

import Foundation
import ComposableArchitecture

enum TodoAction: Equatable, BindableAction {
	case binding(BindingAction<TodoState>)
	case textfieldChanged(String)
	case circlebadgeTapped
}
