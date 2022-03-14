//
//  TodoState.swift
//  TACLeanApp (iOS)
//
//  Created by 상구 on 2022/03/11.
//

import Foundation
import ComposableArchitecture

struct TodoState: Equatable, Identifiable {
	let id = UUID()
	var isFinish: Bool = false
	@BindableState var description: String
}
