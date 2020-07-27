//
//  HomeController.swift
//  LIVE812x
//
//  Created by loop on 2020/06/30.
//  Copyright © 2020 loop. All rights reserved.
//

import UIKit
import CryptoSwift
import CryptoEthereumSwift


class HomeController: BaseController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "HOME".localized()
        
//        let name: String? = "asdf"
//        _ = name!.count
//        
//        let mnemonic = Mnemonic.create()
//        let seed = try! Mnemonic.createSeed(mnemonic: mnemonic)
//        // BIP32: Key derivation and address generation
//        let wallet = try! Wallet(seed: seed, network: .mainnet, debugPrints: true)
//        
//        print(mnemonic)
//        print(seed)
//        print(wallet)
    }
}
