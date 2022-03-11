//
//  MainEnvironment.swift
//  TACLeanApp (iOS)
//
//  Created by 상구 on 2022/03/10.
//

import Foundation
import ComposableArchitecture

struct MainEnvironment {
	let mainQueue: AnySchedulerOf<DispatchQueue>
}
