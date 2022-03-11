//
//  Todo.swift
//  TACLeanApp (iOS)
//
//  Created by 상구 on 2022/03/11.
//

import SwiftUI
import ComposableArchitecture

struct TodoView: View {
	@ObservedObject
	private var viewStore: TodoViewStore
	private let store: TodoStore
	
	init(store: TodoStore) {
		self.store = store
		self.viewStore = ViewStore(store)
	}
	
	var body: some View {
		HStack {
			TextField("",
								text: viewStore.binding(
									get: \.description,
									send: TodoAction.textfieldChanged
								)
			)
			Spacer()
			Button {
				viewStore.send(.circlebadgeTapped)
			} label: {
				Image(systemName: "circlebadge")
					.resizable()
					.scaledToFit()
					.foregroundColor(viewStore.isFinish ? .blue : .gray)
					.frame(width: 20, height: 20)
					.overlay {
						Image(systemName: "circlebadge.fill")
							.resizable()
							.scaledToFit()
							.foregroundColor(viewStore.isFinish ? .blue : .clear)
							.frame(width: 12, height: 12)
					}
			}
			.buttonStyle(.plain)
		}
	}
}

struct TodoView_Previews: PreviewProvider {
	static var previews: some View {
		TodoView(
			store: .init(
				initialState: .init(description: "할일을 입력하세요."),
				reducer: todoReducer,
				environment: .init()
			)
		)
	}
}

typealias TodoStore = Store<
	Todo,
	TodoAction
>

typealias TodoViewStore = ViewStore<
	Todo,
	TodoAction
>
