//
//  EthereumController.swift
//  LIVE812x
//
//  Created by loop on 2020/07/27.
//  Copyright © 2020 loop. All rights reserved.
//

import UIKit

class EthereumController: BaseController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let mnemonic = Mnemonic.create(strength: .normal, language: .chinese)
        print(mnemonic)
        let seed = try! Mnemonic.createSeed(mnemonic: mnemonic, withPassphrase: "password")
        print(seed)
        let wallet =  HDWallet(seed: seed, network: .mainnet)
        print(wallet)
        let address = try! wallet.address(at: 0)
        let privatekey = try! wallet.privateKey(at: 0).raw.toHexString()
        
        print(address)
        print(privatekey)
        
    }
}
