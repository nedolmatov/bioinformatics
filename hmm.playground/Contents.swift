
//  Hidden Markov's models (HMM)
//  Скрытые Марковские модели
//
//  Created by Nikita Dolmatov on 17.01.2018.
//  Copyright © 2018 Nikita Dolmatov. All rights reserved.

import Foundation

class HMM {
	
	// a - adenin
	private let ayy = 3.5 // from Yes to Yes
	private let any = 5.0 // from No to Yes
	private let ayn = 2.5 // from Yes to No
	private let ann = 1.0 // from No to No
	// t - timin
	private let tyy = 0.7
	private let tny = 2.2
	private let tyn = 4.0
	private let tnn = 2.5
	
	private struct nucleobase {
		var symbol: Character
		var qualityYes: Double
		var qualityNo: Double
		var fromYes: [Bool]
		
		init(symbol: Character) {
			self.symbol = symbol
			self.qualityYes = 0.0
			self.qualityNo = 0.0
			self.fromYes = [false, false]
		}
		
		init(symbol: Character, qualityYes: Double, qualityNo: Double, fromYes: [Bool]) {
			self.symbol = symbol
			self.qualityYes = qualityYes
			self.qualityNo = qualityNo
			self.fromYes = fromYes
		}
	}
	
	private var chain: Array<nucleobase> = [nucleobase(symbol: "λ", qualityYes: Double.infinity, qualityNo: 0.0, fromYes: [false, false])]
	
	private var answer_chain: Array<nucleobase> = []
	
	init(str: String) {
		let characters = Array(str.characters)
		for c in characters {
			chain.append(nucleobase(symbol: c))
		}
	}

	func hmmFind() {
		hmmCount()
		
		if chain.last?.qualityNo < chain.last?.qualityYes {
			findRoot(from: 1) // from No
		} else {
			findRoot(from: 0) // from Yes
		}
	}
	
	private func findRoot(from j: Int) {
		var f = j
		for(var i = chain.count - 1; i > 0; i--) {
			if chain[i].fromYes[f] {
				answer_chain.append(nucleobase(symbol: chain[i-1].symbol))
				f = changeRootWay(j)
			} else if !answer_chain.isEmpty {
				var str = ""
				for a in answer_chain {
					str += String(a.symbol)
				}
				answer_chain.removeAll()
				print(str)
				f = j
			}
		}
	}
	
	private func changeRootWay(j: Int) -> Int {
		if j == 0 {
			return 1
		}
		return 0
	}
	
	private func hmmCount() {
		for(var i = 1; i < chain.count; i++) {
			sectorCount(i)
		}
	}

	private func sectorCount(index: Int) {
		let prevYes = chain[index-1].qualityYes
		let prevNo = chain[index-1].qualityNo
		switch(chain[index].symbol) {
			case "a":
				chain[index].qualityYes = min(prevYes + ayy, prevNo + any)
				chain[index].qualityNo = min(prevYes + ayn, prevNo + ann)
				if prevYes + ayy <= prevNo + any {
					chain[index].fromYes[0] = true
				}
				if prevYes + ayn <= prevNo + ann {
					chain[index].fromYes[1] = true
				}
				break
			case "t":
				chain[index].qualityYes = min(prevYes + tyy, prevNo + tny)
				chain[index].qualityNo = min(prevYes + tyn, prevNo + tnn)
				if prevYes + tyy <= prevNo + tny {
					chain[index].fromYes[0] = true
				}
				if prevYes + tyn <= prevNo + tnn {
					chain[index].fromYes[1] = true
				}
				break
			default: break
		}
	}

}

var hmm: HMM = HMM(str: "ataatttatttaaatttta")
//var hmm: HMM = HMM(str: "ttaaaatataaaattt")
hmm.hmmFind()
hmm.chain
hmm.chain[12]
