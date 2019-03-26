//
//  KJImageViewExtension.swift
//  PickerView
//
//  Created by Kaden Jack on 2019/2/25.
//  Copyright © 2019 Kaden Jack. All rights reserved.
//

import UIKit
//import Kingfisher

extension UIImage {
    
    /// 加载本地图片
    ///
    /// - Parameter imageName: 图片名称
    public class func loadLocalImage(WithImageName imageName:String) -> UIImage {
        return UIImage.init(named: imageName) ?? UIImage.init()
    }
}


extension UIImageView {
    
    /// 加载网络图片
    ///
    /// - Parameters:
    ///   - imageUrl: 网络图片Url
    ///   - placeImageName: 默认图片
    //    func loadNetworkImage(WithImageUrl imageUrl:String , placeImageName:String = "placeholder") {
    //        kf.setImage(with: URL(string: imageUrl), placeholder: UIImage.init(named: placeImageName), options: [.transition(ImageTransition.fade(1))], progressBlock: { (receivedSize, totalSize) in
    //
    //        }) { (image, error, cacheType, imageURL) in
    //
    //        }
    //    }
    
    
    /// 加载本地图片
    ///
    /// - Parameter imageName: 图片名称
    public func loadLocalImage(WithImageName imageName:String) {
        image = UIImage.init(named: imageName)
    }
}

