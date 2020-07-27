//
//  FavorController.swift
//  LIVE812x
//
//  Created by loop on 2020/06/30.
//  Copyright © 2020 loop. All rights reserved.
//

import UIKit
import SnapKit




class FavorController: BaseController {

    var HDWalletBtn :UIButton!
    var EthereumBtn :UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "FAVOR".localized()
        
        creatSubview()
    }
    
    func creatSubview() {
        HDWalletBtn = UIButton()
        HDWalletBtn.setTitle("HDWallet", for: .normal)
        HDWalletBtn.backgroundColor = .orange
        HDWalletBtn.setTitleColor(.lightGray, for: .highlighted)
        HDWalletBtn.addTarget(self, action: #selector(HDWalletClick), for: .touchUpInside)
        self.view.addSubview(HDWalletBtn)
        
        
        EthereumBtn = UIButton()
        EthereumBtn.setTitle("EthereumWallet", for: .normal)
        EthereumBtn.backgroundColor = .red
        EthereumBtn.setTitleColor(.lightGray, for: .highlighted)
        EthereumBtn.addTarget(self, action: #selector(EthereumClick), for: .touchUpInside)
        self.view.addSubview(EthereumBtn)
        
        
        creatFrame()
    }
    
    func creatFrame() {
        HDWalletBtn.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(LNaviBar_Height + 30)
            make.left.equalToSuperview().offset(40)
            make.right.equalToSuperview().offset(-40)
            make.height.equalTo(40)
        }
        
        EthereumBtn.snp.makeConstraints { (make) in
            make.top.equalTo(HDWalletBtn.snp_bottomMargin).offset(20)
            make.left.equalToSuperview().offset(40)
            make.right.equalToSuperview().offset(-40)
            make.height.equalTo(40)
        }
    }
    
    @objc func HDWalletClick(){
        print("HDWalletClick")
        
        let HDWalletVC = HDWalletController()
        self.navigationController?.pushViewController(HDWalletVC, animated: true)
    }
    
    @objc func EthereumClick(){
        print("EthereumClick")
        
        let EthereumVC = EthereumController()
        self.navigationController?.pushViewController(EthereumVC, animated: true)
    }
}
