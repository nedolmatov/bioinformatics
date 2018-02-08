
//  Created by Nikita Dolmatov on 17.01.2018.
//  Copyright © 2018 Nikita Dolmatov. All rights reserved.

import UIKit

typealias Целое = Int
typealias Вещественное = Double
typealias Строка = String
typealias Символ = Character

class Дерево {
	var листья = [Строка]()
	var цена: Целое = 0
}

class РПС {
	private let штрафы: Dictionary<Строка, Вещественное> = ["AG-CT": 0.9, "XY": 1, "X-": 0.5, "-X": 1.5, "XX": 0]
	private var дерево: Дерево = Дерево()
	
	init(последовательность: Строка) {
		
	}
	
	func реконструировать() {
		
	}
}

class Узел {
	var вес: Dictionary<Символ, Вещественное> = [:]
	var след: Узел = Узел()
	var пред: Узел = Узел()
	
	init() {
		let значения = "ACGT-"
		for значение in значения.characters {
			вес[значение] = 100_000.0
		}
	}
}
