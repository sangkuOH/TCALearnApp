//
//  TACLeanAppApp.swift
//  Shared
//
//  Created by 상구 on 2022/03/10.
//

import SwiftUI
import ComposableArchitecture

@main
struct TACLeanAppApp: App {
	var body: some Scene {
		WindowGroup {
			RootView(
				store: .init(
					initialState: .onboarding(.init()),
					reducer: rootReducer,
					environment: .init(mainQueue: .main)
				)
			)
		}
	}
}
