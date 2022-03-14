//
//  MainAction.swift
//  TACLeanApp (iOS)
//
//  Created by 상구 on 2022/03/10.
//

import Foundation
import ComposableArchitecture

enum MainAction: Equatable {
	case addTodo(String)
	case deleteTodo(IndexSet)
	case deleteTodoWithId(UUID)
	case todoAction(id: UUID, action: TodoAction)
}
