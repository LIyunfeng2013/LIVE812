//
//  UIKit+LExtension.swift
//  LIVE812x
//
//  Created by loop on 2020/07/13.
//  Copyright © 2020 loop. All rights reserved.
//

import Foundation
import UIKit


extension UIView {
    ///
    /// 获取或设置origin.x
    ///
    func originX() ->CGFloat {
        return self.frame.origin.x
    }
    
    func originX(originX: CGFloat) {
        var rect = self.frame
        rect.origin.x = originX
        self.frame = rect
    }
    
    ///
    /// 获取或设置origin.y
    ///
    func originY() ->CGFloat {
        return self.frame.origin.y
    }
    
    func originY(originY: CGFloat) {
        var rect = self.frame
        rect.origin.y = originY
        self.frame = rect
    }
    
    ///
    /// 获取或设置origin
    ///
    func origin() ->CGPoint {
        return self.frame.origin
    }
    
    func origin(origin: CGPoint) {
        var rect = self.frame
        rect.origin = origin
        self.frame = rect
    }
    
    ///
    /// 获取或设置width
    ///
    func width() ->CGFloat {
        return self.frame.size.width
    }
    
    func width(width: CGFloat) {
        var rect = self.frame
        rect.size.width = width
        self.frame = rect
    }
    
    ///
    /// 获取或设置height
    ///
    func height() ->CGFloat {
        return self.frame.size.height
    }
    
    func height(height: CGFloat) {
        var rect = self.frame
        rect.size.height = height
        self.frame = rect
    }
    
    ///
    /// 获取rightX
    ///
    func rightX() ->CGFloat {
        return originX() + width()
    }
    
    ///
    /// 获取或设置bottomY
    ///
    func bottomY() ->CGFloat {
        return originY() + height()
    }
    
    func bottomY(bottomY: CGFloat) {
        var rect = self.frame
        rect.origin.y = bottomY - height()
        self.frame = rect
    }
    //自定义控件圆角位置 如：只左上 左下有圆角   btn.addCorner(roundingCorners:  [.topLeft, .bottomLeft], cornerSize: CGSize(width:4, height:4))
    func addCorner(roundingCorners: UIRectCorner, cornerSize: CGSize) {
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: roundingCorners, cornerRadii: cornerSize)
        let cornerLayer = CAShapeLayer()
        cornerLayer.frame = bounds
        cornerLayer.path = path.cgPath
        layer.mask = cornerLayer
    }
    
    
}

extension UIImage {
    func imageByCroppingImage(_ size: CGSize) -> UIImage {
        var returnImage: UIImage?
        var scaleFactor: CGFloat = 1.0
        var scaledWidth = size.width
        var scaledHeight = size.height
        var thumbnailPoint = CGPoint(x: 0, y: 0)
        
        if !self.size.equalTo(size) {
            let widthFactor = size.width / self.size.width
            let heightFactor = size.height / self.size.height
            
            if widthFactor > heightFactor {
                scaleFactor = widthFactor
            } else {
                scaleFactor = heightFactor
            }
            
            scaledWidth = self.size.width * scaleFactor
            scaledHeight = self.size.height * scaleFactor
            
            if widthFactor > heightFactor {
                thumbnailPoint.y = (size.height - scaledHeight) * 0.5
            } else if widthFactor < heightFactor {
                thumbnailPoint.x = (size.width - scaledWidth) * 0.5
            }
        }
        
        UIGraphicsBeginImageContextWithOptions(size, true, 1)
        
        var thumbnailRect = CGRect.zero
        thumbnailRect.origin = thumbnailPoint
        thumbnailRect.size.width = scaledWidth
        thumbnailRect.size.height = scaledHeight
        
        self.draw(in: thumbnailRect)
        returnImage = UIGraphicsGetImageFromCurrentImageContext()
        
        UIGraphicsEndImageContext()
        
        return returnImage!
    }
    
    func circleImage() -> UIImage {
        //取最短边长
        let shotest = min(self.size.width, self.size.height)
        //输出尺寸
        let outputRect = CGRect(x: 0, y: 0, width: shotest, height: shotest)
        //开始图片处理上下文（由于输出的图不会进行缩放，所以缩放因子等于屏幕的scale即可）
        UIGraphicsBeginImageContextWithOptions(outputRect.size, false, 0)
        let context = UIGraphicsGetCurrentContext()!
        //添加圆形裁剪区域
        context.addEllipse(in: outputRect)
        context.clip()
        //绘制图片
        self.draw(in: CGRect(x: (shotest-self.size.width)/2,
                             y: (shotest-self.size.height)/2,
                             width: self.size.width,
                             height: self.size.height))
        //获得处理后的图片
        let maskedImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return maskedImage
    }
    
}

extension UIImageView {
    /// 设置图片圆角
    func circleImage() {
        /// 建立上下文
        UIGraphicsBeginImageContextWithOptions(self.frame.size, false, 0)
        /// 获取当前上下文
        let ctx = UIGraphicsGetCurrentContext()
        /// 添加一个圆，并裁剪
        ctx?.addEllipse(in: self.bounds)
        ctx?.clip()
        /// 绘制图像
        self.draw(self.bounds)
        /// 获取绘制的图像
        let image = UIGraphicsGetImageFromCurrentImageContext()
        /// 关闭上下文
        UIGraphicsEndImageContext()
        DispatchQueue.global().async {
            self.image = image
        }
    }
}

extension Date {
    /// 判断当前日期是否为今年
    func isThisYear() -> Bool {
        // 获取当前日历
        let calender = Calendar.current
        // 获取日期的年份
        let yearComps = calender.component(.year, from: self)
        // 获取现在的年份
        let nowComps = calender.component(.year, from: Date())
        return yearComps == nowComps
    }
    /// 是否是昨天
    func isYesterday() -> Bool {
        // 获取当前日历
        let calender = Calendar.current
        // 获取日期的年份
        let comps = calender.dateComponents([.year, .month, .day], from: self, to: Date())
        return comps.year == 0 && comps.month == 0 && comps.day == 0
        
    }
    /// 是否是前天
    func isBeforeYesterday() -> Bool {
        // 获取当前日历
        let calender = Calendar.current
        // 获取日期的年份
        let comps = calender.dateComponents([.year, .month, .day], from: self, to: Date())
        return comps.year == 0 && comps.month == 0 && comps.day == 1
    }
    /// 判断是否是今天
    func isToday() -> Bool {
        // 日期格式化
        let formatter = DateFormatter()
        // 设置日期格式
        formatter.dateFormat = "yyyy-MM-dd"
        let dateStr = formatter.string(from: self)
        let nowStr = formatter.string(from: Date())
        return dateStr == nowStr
    }
}

 /**
  * UIViewController 的扩展类 获取当前的ViewController
  * 使用时只需let nowVC = UIViewController.currentViewController()
  */
 extension UIViewController {
     class func currentViewController(base: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {
         if let nav = base as? UINavigationController {
             return currentViewController(base: nav.visibleViewController)
         }
         if let tab = base as? UITabBarController {
             return currentViewController(base: tab.selectedViewController)
         }
         if let presented = base?.presentedViewController {
             return currentViewController(base: presented)
         }
         return base
     }
 }

extension String {
    //判断是否是中文
    func isChinese() -> Bool {
        let match = "(^[\u{4e00}-\u{9fa5}]+$)"
        let predicate = NSPredicate(format: "SELF matches %@", match)
        return predicate.evaluate(with: self)
    }
    //判断手机号码格式是否正确
    static func isMobile(_ mobile: String?) -> Bool {
        // 130-139  150-153,155-159  180-189  145,147  170,171,173,176,177,178
        let phoneRegex = "^((13[0-9])|(15[^4,\\D])|(18[0-9])|(14[57])|(17[013678]))\\d{8}$"
        let phoneTest = NSPredicate(format: "SELF MATCHES %@", phoneRegex)
        return phoneTest.evaluate(with: mobile)
    }
    // 判断是否是数字
    static func isNumber(_ number: String?) -> Bool {
        var res = true
        let tmpSet = CharacterSet(charactersIn: "0123456789")
        var i: Int = 0
        while i < (number?.count ?? 0) {
            let string = (number as NSString?)?.substring(with: NSRange(location: i, length: 1))
            let range: NSRange? = (string as NSString?)?.rangeOfCharacter(from: tmpSet)
            if Int(range?.length ?? 0) == 0 {
                res = false
                break
            }
            i = i + 1
        }
        return res
    }
    //格式化电话号码 136 2222 2222
    static func formatPhoneNumber(_ string: String?) -> String? {
        var str1 = string ?? ""
        str1.insert(contentsOf: " ", at: str1.index(str1.startIndex, offsetBy: 3))
        str1.insert(contentsOf: " ", at: str1.index(str1.startIndex, offsetBy: 8))
        return str1
    }
}

extension UIColor {
    //返回一个RGB颜色
    func getColor(r:CGFloat,g:CGFloat,b:CGFloat,l:CGFloat = 1) ->UIColor{
        let color = UIColor(red: r/255.0, green: g/255.0, blue: b/255.0, alpha: l)
        return color
    }
    //返回一个RGB颜色
    func getColor(str:Int,alpha:CGFloat = 1) ->UIColor{
        return UIColor(red:CGFloat((str & 0xFF0000) >> 16) / 255.0,green: CGFloat((str & 0x00FF00) >> 8) / 255.0,blue: CGFloat(str & 0x0000FF) / 255.0,alpha: CGFloat(alpha))
    }
    
}




