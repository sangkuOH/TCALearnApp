//
//  OnboardingView.swift
//  TACLeanApp (iOS)
//
//  Created by 상구 on 2022/03/10.
//

import SwiftUI
import ComposableArchitecture

struct OnboardingView: View {
	var store: OnboardingStroe
	
	init(store: OnboardingStroe) {
		self.store = store
	}
	
	var body: some View {
		WithViewStore(store) { viewStore in
			NavigationView {
				VStack {
					Text(viewStore.title)
					Text(viewStore.greeting)
				}
				.navigationTitle("TCALeanApp")
			}
			.task {
				DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
					viewStore.send(.onAppear)
				}
			}
		}
	}
}

typealias OnboardingStroe = Store<
	OnboardingState,
	OnboardingAction
>

struct OnboardingView_Previews: PreviewProvider {
	static var previews: some View {
		OnboardingView(
			store: .init(
				initialState: .init(),
				reducer: onboardingReducer,
				environment: .init()
			)
		)
	}
}
