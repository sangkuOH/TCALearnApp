//
//  RootEnvironment.swift
//  TACLeanApp (iOS)
//
//  Created by 상구 on 2022/03/10.
//

import Foundation
import CombineSchedulers

struct RootEnvironment {
	let mainQueue: AnySchedulerOf<DispatchQueue>
}
