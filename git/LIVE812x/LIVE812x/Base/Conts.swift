//
//  Conts.swift
//  Swift-KJ
//
//  Created by loop on 2020/03/23.
//  Copyright © 2020 loop. All rights reserved.
//
import UIKit
import Foundation
import SnapKit
import RxCocoa
import RxSwift
import CryptoSwift
import HDWalletKit
import SCLAlertView



var rootKeystore:KeystoreV3!
var walletPassword:String!

// 屏幕的物理宽度
let KScreenWidth = UIScreen.main.bounds.size.width
// 屏幕的物理高度
let KScreenHeight = UIScreen.main.bounds.size.height

let KTextColor = UIColor.init(displayP3Red: 255, green: 255, blue: 255, alpha: 1.0)
let KTextPlaceHoderColor = UIColor.init(displayP3Red: 125, green: 125, blue: 125, alpha: 1.0)
let KWarningColor = UIColor.init(displayP3Red: 99, green: 99, blue: 99, alpha: 1.0)
let KViewBackColor = UIColor.init(displayP3Red: 10, green: 10, blue: 10, alpha: 1.0)


// iPhone4
let iPhone4 = KScreenHeight  < 568 ? true : false
// iPhone 5
let iPhone5 = KScreenHeight  == 568 ? true : false
// iPhone 6
let iPhone6 = KScreenHeight  == 667 ? true : false
// iphone 6P
let iPhone6P = KScreenHeight == 736 ? true : false
// iphone X
let iPhoneX = KScreenHeight == 812 ? true : false

//iPhonex以上判
let IS_IPhoneX_All = (KScreenHeight == 812.0 || KScreenHeight == 896.0)
//导航栏高
let HYDevice_NaviBar_Height = (IS_IPhoneX_All ? 88.0 : 64.0)
//状态栏高
let HYDevice_StatusBar_Height = (IS_IPhoneX_All ? 44.0 : 20.0)
//选项卡高
let HYDevice_TabBar_Height = (IS_IPhoneX_All ? 83.0 : 49.0)
//安全区高
let HYDevice_SafeArea_BottomHeight = (IS_IPhoneX_All ? 34.0 : 0.0)
/**宽度比例*/
func XL_ScaleWidth(_ font:CGFloat) -> (CGFloat) {
    return (KScreenWidth/375)*font
}
/**高度比例*/
func XL_ScaleHeight(_ font:CGFloat) -> (CGFloat) {
    return  KScreenHeight/667*font
}
/**字体比例*/
func XL_ScaleFont(_ font:CGFloat) -> (CGFloat) {
    return  KScreenWidth/375*font
}
/*!
 打印内容，并包含类名和打印所在行数
 - Parameters:  泛型，打印对象
 - file: 打印所属类
 - lineNumber: 打印语句所在行数
 */
func DLog<T>(parameter : T, file : String = #file, lineNumber : Int = #line)
{
    #if DEBUG
    let fileName = (file as NSString).lastPathComponent
    print("[\(fileName):line:\(lineNumber)] \(parameter)\n")
    #endif
}

//国际化语言
//func LanguageString(str: String) -> String {
//    if str.isEmpty {
//        return "errorStr";
//    }
//    return NSLocalizedString(str, comment: "Localizable")
//}

