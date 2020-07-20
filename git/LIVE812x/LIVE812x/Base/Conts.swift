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
import CryptoSwift
import HDWalletKit
import SCLAlertView



//var rootKeystore:KeystoreV3!
//var walletPassword:String!

// 屏幕的物理宽度
let LScreenWidth = UIScreen.main.bounds.size.width
// 屏幕的物理高度
let LScreenHeight = UIScreen.main.bounds.size.height

let LTextColor = UIColor.init(displayP3Red: 255, green: 255, blue: 255, alpha: 1.0)
let LTextPlaceHoderColor = UIColor.init(displayP3Red: 125, green: 125, blue: 125, alpha: 1.0)
let LWarningColor = UIColor.init(displayP3Red: 99, green: 99, blue: 99, alpha: 1.0)
let LViewBackColor = UIColor.init(displayP3Red: 10, green: 10, blue: 10, alpha: 1.0)


// iPhone 4/4s   320*480
let iPhone4 = LScreenHeight  < 568 ? true : false
// iPhone 5/5s/5c/SE   320*568
let iPhone5 = LScreenHeight  == 568 ? true : false
// iPhone 6/6s/7/8    375*667
let iPhone6 = LScreenHeight  == 667 ? true : false
// iphone 6P/6SP/7P/8P   414 *736
let iPhone6P = LScreenHeight == 736 ? true : false
// iphone X/XS/11Pro     375*812
let iPhoneX = LScreenHeight == 812 ? true : false
// iphone XR/11/XS Max/11Pro Max   414*896
let iPhoneXR = LScreenHeight == 896 ? true : false


//iPhonex及以上判断
let IS_IPhoneX_All = (LScreenHeight == 812.0 || LScreenHeight == 896.0)
//导航栏高
let LNaviBar_Height = (IS_IPhoneX_All ? 88.0 : 64.0)
//状态栏高
let LStatusBar_Height = (IS_IPhoneX_All ? 44.0 : 20.0)
//选项卡高
let LTabBar_Height = (IS_IPhoneX_All ? 83.0 : 49.0)
//安全区高
let LSafeArea_BottomHeight = (IS_IPhoneX_All ? 34.0 : 0.0)
/**宽度比例*/
func LScaleWidth(_ font:CGFloat) -> (CGFloat) {
    return (LScreenWidth/375)*font
}
/**高度比例*/
func LScaleHeight(_ font:CGFloat) -> (CGFloat) {
    return  LScreenHeight/667*font
}
/**字体比例*/
func LScaleFont(_ font:CGFloat) -> (CGFloat) {
    return  LScreenWidth/375*font
}


/*!
 打印内容，并包含类名和打印所在行数
 - Parameters:  泛型，打印对象
 - file: 打印所属类
 - lineNumber: 打印语句所在行数
 */
func NSLog<T>(parameter : T, file : String = #file, lineNumber : Int = #line)
{
    #if DEBUG
    let fileName = (file as NSString).lastPathComponent
    print("[\(fileName):line:\(lineNumber)] \(parameter)\n")
    #endif
}



