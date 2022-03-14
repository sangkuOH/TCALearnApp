//
//  MainState.swift
//  TACLeanApp (iOS)
//
//  Created by 상구 on 2022/03/10.
//

import Foundation
import IdentifiedCollections
import ComposableArchitecture

struct MainState: Equatable {
	var todos: IdentifiedArrayOf<TodoState> = []
}
