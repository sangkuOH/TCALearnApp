//
//  TodoState.swift
//  TACLeanApp (iOS)
//
//  Created by 상구 on 2022/03/11.
//

import Foundation

struct Todo: Equatable, Identifiable {
	let id = UUID()
	var isFinish: Bool = false
	var description: String
}
