//
//  ViewModel.swift
//  uppgift1ai
//
//  Created by oscar gynning on 2023-10-18.
//
import Vision
import Foundation
import UIKit
class ViewModel : ObservableObject{
    func doImage(Picture: String)-> [Any] {
        
        let defaultConfig = MLModelConfiguration()
        
        let imageClassifierWrapper = try? MobileNetV2(configuration: defaultConfig)
        
        let theImage = UIImage(named: Picture)
        let theImageBuffer = buffer(from: theImage!)
        
        var responseString = [Any]()
        
        do{
        
            let output = try imageClassifierWrapper!.prediction(image: theImageBuffer!)
       
            print(output.classLabel)
            print(output.classLabelProbs[output.classLabel]!)
            responseString.append( output.classLabel)
            responseString.append(output.classLabelProbs[output.classLabel]!)
            
        } catch {
            // inget kommer gå fel jag kovar
        }
        return responseString
    }
    
    func buffer(from image: UIImage) -> CVPixelBuffer? {
       let attrs = [kCVPixelBufferCGImageCompatibilityKey: kCFBooleanTrue, kCVPixelBufferCGBitmapContextCompatibilityKey: kCFBooleanTrue] as CFDictionary
       var pixelBuffer : CVPixelBuffer?
       let status = CVPixelBufferCreate(kCFAllocatorDefault, Int(image.size.width), Int(image.size.height), kCVPixelFormatType_32ARGB, attrs, &pixelBuffer)
       guard (status == kCVReturnSuccess) else {
         return nil
       }

       CVPixelBufferLockBaseAddress(pixelBuffer!, CVPixelBufferLockFlags(rawValue: 0))
       let pixelData = CVPixelBufferGetBaseAddress(pixelBuffer!)

       let rgbColorSpace = CGColorSpaceCreateDeviceRGB()
       let context = CGContext(data: pixelData, width: Int(image.size.width), height: Int(image.size.height), bitsPerComponent: 8, bytesPerRow: CVPixelBufferGetBytesPerRow(pixelBuffer!), space: rgbColorSpace, bitmapInfo: CGImageAlphaInfo.noneSkipFirst.rawValue)

       context?.translateBy(x: 0, y: image.size.height)
       context?.scaleBy(x: 1.0, y: -1.0)

       UIGraphicsPushContext(context!)
       image.draw(in: CGRect(x: 0, y: 0, width: image.size.width, height: image.size.height))
       UIGraphicsPopContext()
       CVPixelBufferUnlockBaseAddress(pixelBuffer!, CVPixelBufferLockFlags(rawValue: 0))

       return pixelBuffer
     }}
