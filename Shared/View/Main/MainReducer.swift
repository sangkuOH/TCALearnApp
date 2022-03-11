//
//  MainReducer.swift
//  TACLeanApp (iOS)
//
//  Created by 상구 on 2022/03/10.
//

import Foundation
import ComposableArchitecture

let mainReducer: Reducer<MainState, MainAction, MainEnvironment> =
	.combine(
		todoReducer
			.forEach(
				state: \MainState.todos,
				action: /MainAction.todoAction(id:action:),
				environment: { _ in .init() }
			),
		.init { state, action, environment in
			switch action {
			case .binding:
				return .none
			case .addTodo(let item):
				state.todos.append(Todo(description: item))
				return .none
			case .deleteTodo(let indexSet):
				state.todos.remove(atOffsets: indexSet)
				return .none
			case .deleteTodoWithId(let id):
				state.todos.remove(id: id)
				return .none
			case .todoAction(id: let id, action: let action):
				switch action {
				case .circlebadgeTapped:
					return .concatenate(
						Effect(value: .deleteTodoWithId(id))
							.delay(for: 1.5, scheduler: environment.mainQueue)
							.eraseToEffect()
					)
				default:
					return .none
				}
			}
		}
	)
	.binding()
