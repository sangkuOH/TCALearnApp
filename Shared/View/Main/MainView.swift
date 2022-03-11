//
//  ContentView.swift
//  Shared
//
//  Created by 상구 on 2022/03/10.
//

import SwiftUI
import ComposableArchitecture

struct MainView: View {
	@ObservedObject
	private var viewStore: MainViewStore
	private let store: MainStore
	
	init(store: MainStore) {
		self.store = store
		self.viewStore = ViewStore(store)
	}
	
	var body: some View {
		NavigationView {
			List {
				ForEachStore(
					self.store
						.scope(
							state: \.todos,
							action: MainAction.todoAction(id:action:)
						),
					content: TodoView.init(store:)
				)
					.onDelete {
						viewStore.send(.deleteTodo($0))
					}
			}
			.navigationTitle("Todo")
			.toolbar {
				Button {
					viewStore.send(.addTodo(""))
				} label: {
					Text("add")
						.font(.headline)
				}
			}
		}
	}
}

struct MainView_Previews: PreviewProvider {
	static var previews: some View {
		MainView(
			store: .init(
				initialState: .init(),
				reducer: mainReducer,
				environment: .init(mainQueue: .main)
			)
		)
	}
}

typealias MainStore = Store<
	MainState,
	MainAction
>

typealias MainViewStore = ViewStore<
	MainState,
	MainAction
>

