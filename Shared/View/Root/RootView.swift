//
//  RootView.swift
//  TACLeanApp (iOS)
//
//  Created by 상구 on 2022/03/10.
//

import SwiftUI
import ComposableArchitecture

struct RootView: View {
	var store: RootStore
	
	init(store: RootStore) {
		self.store = store
	}
	
	var body: some View {
		SwitchStore(self.store) {
			CaseLet(
				state: /RootState.main,
				action: RootAction.main,
				then: MainView.init(store:)
			)
			
			CaseLet(
				state: /RootState.onboarding,
				action: RootAction.onboarding,
				then: OnboardingView.init(store:)
			)
		}
	}
}

typealias RootStore = Store<
	RootState,
	RootAction
>

struct RootView_Previews: PreviewProvider {
	static var previews: some View {
		RootView(
			store: .init(
				initialState: .onboarding(.init()),
				reducer: rootReducer,
				environment: .init(mainQueue: .main)
			)
		)
	}
}
