

import UIKit

public class BoardCG : NSObject {

    @objc dynamic public class func drawBoardView(frame targetFrame: CGRect = CGRect(x: 0, y: 0, width: 372, height: 372), resizing: ResizingBehavior = .aspectFit, pos0: String = "X", pos1: String = "X", pos2: String = "X", pos3: String = "X", pos4: String = "X", pos5: String = "X", pos6: String = "0", pos7: String = "X", pos8: String = "X", winLineNo: CGFloat = 0, winMsg: String = "") {

        let context = UIGraphicsGetCurrentContext()!
        

        context.saveGState()
        let resizedFrame: CGRect = resizing.apply(rect: CGRect(x: 0, y: 0, width: 372, height: 372), target: targetFrame)
        context.translateBy(x: resizedFrame.minX, y: resizedFrame.minY)
        context.scaleBy(x: resizedFrame.width / 372, y: resizedFrame.height / 372)
        let resizedShadowScale: CGFloat = min(resizedFrame.width / 372, resizedFrame.height / 372)


        let gradientColor = UIColor(red: 0.130, green: 0.000, blue: 1.000, alpha: 1.000)
        let color = UIColor(red: 0.000, green: 0.940, blue: 1.000, alpha: 1.000)
        let color2 = UIColor(red: 0.000, green: 0.000, blue: 0.000, alpha: 0.263)
        let color3 = UIColor(red: 0.944, green: 0.037, blue: 0.680, alpha: 1.000)
        let color4 = UIColor(red: 0.287, green: 0.000, blue: 0.408, alpha: 0.804)
        let shadowColor = UIColor(red: 0.000, green: 0.855, blue: 1.000, alpha: 1.000)
        let color5 = UIColor(red: 0.000, green: 1.000, blue: 0.877, alpha: 1.000)
        let shadow2Color = UIColor(red: 0.430, green: 0.430, blue: 0.430, alpha: 1.000)
        let shadow3Color = UIColor(red: 0.494, green: 0.148, blue: 0.148, alpha: 1.000)


        let gradient = CGGradient(colorsSpace: nil, colors: [UIColor.black.cgColor, gradientColor.cgColor] as CFArray, locations: [0, 1])!


        let shadow = NSShadow()
        shadow.shadowColor = shadowColor
        shadow.shadowOffset = CGSize(width: -6, height: -7)
        shadow.shadowBlurRadius = 8
        let shadow2 = NSShadow()
        shadow2.shadowColor = shadow2Color
        shadow2.shadowOffset = CGSize(width: -2, height: -1)
        shadow2.shadowBlurRadius = 5
        let shadow3 = NSShadow()
        shadow3.shadowColor = shadow3Color
        shadow3.shadowOffset = CGSize(width: 0, height: -1)
        shadow3.shadowBlurRadius = 10

        let lineExp0: CGFloat = winLineNo == 0 ? 1 : 0
        let lineExp1: CGFloat = winLineNo == 1 ? 1 : 0
        let lineExp2: CGFloat = winLineNo == 2 ? 1 : 0
        let lineExp3: CGFloat = winLineNo == 3 ? 1 : 0
        let lineExp4: CGFloat = winLineNo == 4 ? 1 : 0
        let lineExp5: CGFloat = winLineNo == 5 ? 1 : 0
        let lineExp6: CGFloat = winLineNo == 6 ? 1 : 0
        let lineExp7: CGFloat = winLineNo == 7 ? 1 : 0
        let drawMsgExp: CGFloat = winLineNo == 8 ? 1 : 0
        let winMsgExp: CGFloat = winMsg != "" ? 1 : 0


        let rectanglePath = UIBezierPath(rect: CGRect(x: 0, y: 0, width: 372, height: 372))
        context.saveGState()
        rectanglePath.addClip()
        context.drawLinearGradient(gradient, start: CGPoint(x: 186, y: 0), end: CGPoint(x: 186, y: 372), options: [])
        context.restoreGState()



        let rectangle2Path = UIBezierPath(rect: CGRect(x: 0, y: 0, width: 124, height: 124))
        context.saveGState()
        context.setShadow(offset: CGSize(width: shadow.shadowOffset.width * resizedShadowScale, height: shadow.shadowOffset.height * resizedShadowScale), blur: shadow.shadowBlurRadius * resizedShadowScale, color: (shadow.shadowColor as! UIColor).cgColor)
        color2.setFill()
        rectangle2Path.fill()
        context.restoreGState()

        color.setStroke()
        rectangle2Path.lineWidth = 1
        rectangle2Path.stroke()



        let rectangle3Path = UIBezierPath(rect: CGRect(x: 248, y: 0, width: 124, height: 124))
        context.saveGState()
        context.setShadow(offset: CGSize(width: shadow.shadowOffset.width * resizedShadowScale, height: shadow.shadowOffset.height * resizedShadowScale), blur: shadow.shadowBlurRadius * resizedShadowScale, color: (shadow.shadowColor as! UIColor).cgColor)
        color2.setFill()
        rectangle3Path.fill()
        context.restoreGState()

        color.setStroke()
        rectangle3Path.lineWidth = 1
        rectangle3Path.stroke()



        let rectangle4Path = UIBezierPath(rect: CGRect(x: 124, y: 0, width: 124, height: 124))
        context.saveGState()
        context.setShadow(offset: CGSize(width: shadow.shadowOffset.width * resizedShadowScale, height: shadow.shadowOffset.height * resizedShadowScale), blur: shadow.shadowBlurRadius * resizedShadowScale, color: (shadow.shadowColor as! UIColor).cgColor)
        color2.setFill()
        rectangle4Path.fill()
        context.restoreGState()

        color.setStroke()
        rectangle4Path.lineWidth = 1
        rectangle4Path.stroke()



        let rectangle5Path = UIBezierPath(rect: CGRect(x: 0, y: 124, width: 124, height: 124))
        context.saveGState()
        context.setShadow(offset: CGSize(width: shadow.shadowOffset.width * resizedShadowScale, height: shadow.shadowOffset.height * resizedShadowScale), blur: shadow.shadowBlurRadius * resizedShadowScale, color: (shadow.shadowColor as! UIColor).cgColor)
        color2.setFill()
        rectangle5Path.fill()
        context.restoreGState()

        color.setStroke()
        rectangle5Path.lineWidth = 1
        rectangle5Path.stroke()



        let rectangle6Path = UIBezierPath(rect: CGRect(x: 124, y: 124, width: 124, height: 124))
        context.saveGState()
        context.setShadow(offset: CGSize(width: shadow.shadowOffset.width * resizedShadowScale, height: shadow.shadowOffset.height * resizedShadowScale), blur: shadow.shadowBlurRadius * resizedShadowScale, color: (shadow.shadowColor as! UIColor).cgColor)
        color2.setFill()
        rectangle6Path.fill()
        context.restoreGState()

        color.setStroke()
        rectangle6Path.lineWidth = 1
        rectangle6Path.stroke()


  
        let rectangle7Path = UIBezierPath(rect: CGRect(x: 248, y: 124, width: 124, height: 124))
        context.saveGState()
        context.setShadow(offset: CGSize(width: shadow.shadowOffset.width * resizedShadowScale, height: shadow.shadowOffset.height * resizedShadowScale), blur: shadow.shadowBlurRadius * resizedShadowScale, color: (shadow.shadowColor as! UIColor).cgColor)
        color2.setFill()
        rectangle7Path.fill()
        context.restoreGState()

        color.setStroke()
        rectangle7Path.lineWidth = 1
        rectangle7Path.stroke()



        let rectangle8Path = UIBezierPath(rect: CGRect(x: 0.5, y: 247.5, width: 124, height: 124))
        context.saveGState()
        context.setShadow(offset: CGSize(width: shadow.shadowOffset.width * resizedShadowScale, height: shadow.shadowOffset.height * resizedShadowScale), blur: shadow.shadowBlurRadius * resizedShadowScale, color: (shadow.shadowColor as! UIColor).cgColor)
        color2.setFill()
        rectangle8Path.fill()
        context.restoreGState()

        color.setStroke()
        rectangle8Path.lineWidth = 1
        rectangle8Path.stroke()



        let rectangle9Path = UIBezierPath(rect: CGRect(x: 123.5, y: 247.5, width: 124, height: 124))
        context.saveGState()
        context.setShadow(offset: CGSize(width: shadow.shadowOffset.width * resizedShadowScale, height: shadow.shadowOffset.height * resizedShadowScale), blur: shadow.shadowBlurRadius * resizedShadowScale, color: (shadow.shadowColor as! UIColor).cgColor)
        color2.setFill()
        rectangle9Path.fill()
        context.restoreGState()

        color.setStroke()
        rectangle9Path.lineWidth = 1
        rectangle9Path.stroke()


        let rectangle10Path = UIBezierPath(rect: CGRect(x: 248, y: 248, width: 124, height: 124))
        context.saveGState()
        context.setShadow(offset: CGSize(width: shadow.shadowOffset.width * resizedShadowScale, height: shadow.shadowOffset.height * resizedShadowScale), blur: shadow.shadowBlurRadius * resizedShadowScale, color: (shadow.shadowColor as! UIColor).cgColor)
        color2.setFill()
        rectangle10Path.fill()
        context.restoreGState()

        color.setStroke()
        rectangle10Path.lineWidth = 1
        rectangle10Path.stroke()


        let textRect = CGRect(x: 31, y: 34, width: 59, height: 58)
        context.saveGState()
        context.setShadow(offset: CGSize(width: shadow2.shadowOffset.width * resizedShadowScale, height: shadow2.shadowOffset.height * resizedShadowScale), blur: shadow2.shadowBlurRadius * resizedShadowScale, color: (shadow2.shadowColor as! UIColor).cgColor)
        let textStyle = NSMutableParagraphStyle()
        textStyle.alignment = .center
        let textFontAttributes = [
            .font: UIFont.systemFont(ofSize: 48, weight: .bold),
            .foregroundColor: color5,
            .paragraphStyle: textStyle,
        ] as [NSAttributedString.Key: Any]

        let textTextHeight: CGFloat = pos0.boundingRect(with: CGSize(width: textRect.width, height: CGFloat.infinity), options: .usesLineFragmentOrigin, attributes: textFontAttributes, context: nil).height
        context.saveGState()
        context.clip(to: textRect)
        pos0.draw(in: CGRect(x: textRect.minX, y: textRect.minY + (textRect.height - textTextHeight) / 2, width: textRect.width, height: textTextHeight), withAttributes: textFontAttributes)
        context.restoreGState()
        context.restoreGState()



        let text2Rect = CGRect(x: 157, y: 33, width: 59, height: 58)
        context.saveGState()
        context.setShadow(offset: CGSize(width: shadow2.shadowOffset.width * resizedShadowScale, height: shadow2.shadowOffset.height * resizedShadowScale), blur: shadow2.shadowBlurRadius * resizedShadowScale, color: (shadow2.shadowColor as! UIColor).cgColor)
        let text2Style = NSMutableParagraphStyle()
        text2Style.alignment = .center
        let text2FontAttributes = [
            .font: UIFont.systemFont(ofSize: 48, weight: .bold),
            .foregroundColor: color5,
            .paragraphStyle: text2Style,
        ] as [NSAttributedString.Key: Any]

        let text2TextHeight: CGFloat = pos1.boundingRect(with: CGSize(width: text2Rect.width, height: CGFloat.infinity), options: .usesLineFragmentOrigin, attributes: text2FontAttributes, context: nil).height
        context.saveGState()
        context.clip(to: text2Rect)
        pos1.draw(in: CGRect(x: text2Rect.minX, y: text2Rect.minY + (text2Rect.height - text2TextHeight) / 2, width: text2Rect.width, height: text2TextHeight), withAttributes: text2FontAttributes)
        context.restoreGState()
        context.restoreGState()



        let text3Rect = CGRect(x: 281, y: 34, width: 59, height: 58)
        context.saveGState()
        context.setShadow(offset: CGSize(width: shadow2.shadowOffset.width * resizedShadowScale, height: shadow2.shadowOffset.height * resizedShadowScale), blur: shadow2.shadowBlurRadius * resizedShadowScale, color: (shadow2.shadowColor as! UIColor).cgColor)
        let text3Style = NSMutableParagraphStyle()
        text3Style.alignment = .center
        let text3FontAttributes = [
            .font: UIFont.systemFont(ofSize: 48, weight: .bold),
            .foregroundColor: color5,
            .paragraphStyle: text3Style,
        ] as [NSAttributedString.Key: Any]

        let text3TextHeight: CGFloat = pos2.boundingRect(with: CGSize(width: text3Rect.width, height: CGFloat.infinity), options: .usesLineFragmentOrigin, attributes: text3FontAttributes, context: nil).height
        context.saveGState()
        context.clip(to: text3Rect)
        pos2.draw(in: CGRect(x: text3Rect.minX, y: text3Rect.minY + (text3Rect.height - text3TextHeight) / 2, width: text3Rect.width, height: text3TextHeight), withAttributes: text3FontAttributes)
        context.restoreGState()
        context.restoreGState()


        let text4Rect = CGRect(x: 31, y: 157, width: 59, height: 58)
        context.saveGState()
        context.setShadow(offset: CGSize(width: shadow2.shadowOffset.width * resizedShadowScale, height: shadow2.shadowOffset.height * resizedShadowScale), blur: shadow2.shadowBlurRadius * resizedShadowScale, color: (shadow2.shadowColor as! UIColor).cgColor)
        let text4Style = NSMutableParagraphStyle()
        text4Style.alignment = .center
        let text4FontAttributes = [
            .font: UIFont.systemFont(ofSize: 48, weight: .bold),
            .foregroundColor: color5,
            .paragraphStyle: text4Style,
        ] as [NSAttributedString.Key: Any]

        let text4TextHeight: CGFloat = pos3.boundingRect(with: CGSize(width: text4Rect.width, height: CGFloat.infinity), options: .usesLineFragmentOrigin, attributes: text4FontAttributes, context: nil).height
        context.saveGState()
        context.clip(to: text4Rect)
        pos3.draw(in: CGRect(x: text4Rect.minX, y: text4Rect.minY + (text4Rect.height - text4TextHeight) / 2, width: text4Rect.width, height: text4TextHeight), withAttributes: text4FontAttributes)
        context.restoreGState()
        context.restoreGState()




        let text5Rect = CGRect(x: 157, y: 157, width: 59, height: 58)
        context.saveGState()
        context.setShadow(offset: CGSize(width: shadow2.shadowOffset.width * resizedShadowScale, height: shadow2.shadowOffset.height * resizedShadowScale), blur: shadow2.shadowBlurRadius * resizedShadowScale, color: (shadow2.shadowColor as! UIColor).cgColor)
        let text5Style = NSMutableParagraphStyle()
        text5Style.alignment = .center
        let text5FontAttributes = [
            .font: UIFont.systemFont(ofSize: 48, weight: .bold),
            .foregroundColor: color5,
            .paragraphStyle: text5Style,
        ] as [NSAttributedString.Key: Any]

        let text5TextHeight: CGFloat = pos4.boundingRect(with: CGSize(width: text5Rect.width, height: CGFloat.infinity), options: .usesLineFragmentOrigin, attributes: text5FontAttributes, context: nil).height
        context.saveGState()
        context.clip(to: text5Rect)
        pos4.draw(in: CGRect(x: text5Rect.minX, y: text5Rect.minY + (text5Rect.height - text5TextHeight) / 2, width: text5Rect.width, height: text5TextHeight), withAttributes: text5FontAttributes)
        context.restoreGState()
        context.restoreGState()



        let text6Rect = CGRect(x: 281, y: 157, width: 59, height: 58)
        context.saveGState()
        context.setShadow(offset: CGSize(width: shadow2.shadowOffset.width * resizedShadowScale, height: shadow2.shadowOffset.height * resizedShadowScale), blur: shadow2.shadowBlurRadius * resizedShadowScale, color: (shadow2.shadowColor as! UIColor).cgColor)
        let text6Style = NSMutableParagraphStyle()
        text6Style.alignment = .center
        let text6FontAttributes = [
            .font: UIFont.systemFont(ofSize: 48, weight: .bold),
            .foregroundColor: color5,
            .paragraphStyle: text6Style,
        ] as [NSAttributedString.Key: Any]

        let text6TextHeight: CGFloat = pos5.boundingRect(with: CGSize(width: text6Rect.width, height: CGFloat.infinity), options: .usesLineFragmentOrigin, attributes: text6FontAttributes, context: nil).height
        context.saveGState()
        context.clip(to: text6Rect)
        pos5.draw(in: CGRect(x: text6Rect.minX, y: text6Rect.minY + (text6Rect.height - text6TextHeight) / 2, width: text6Rect.width, height: text6TextHeight), withAttributes: text6FontAttributes)
        context.restoreGState()
        context.restoreGState()



        let text7Rect = CGRect(x: 33, y: 280, width: 59, height: 58)
        context.saveGState()
        context.setShadow(offset: CGSize(width: shadow2.shadowOffset.width * resizedShadowScale, height: shadow2.shadowOffset.height * resizedShadowScale), blur: shadow2.shadowBlurRadius * resizedShadowScale, color: (shadow2.shadowColor as! UIColor).cgColor)
        let text7Style = NSMutableParagraphStyle()
        text7Style.alignment = .center
        let text7FontAttributes = [
            .font: UIFont.systemFont(ofSize: 48, weight: .bold),
            .foregroundColor: color5,
            .paragraphStyle: text7Style,
        ] as [NSAttributedString.Key: Any]

        let text7TextHeight: CGFloat = pos6.boundingRect(with: CGSize(width: text7Rect.width, height: CGFloat.infinity), options: .usesLineFragmentOrigin, attributes: text7FontAttributes, context: nil).height
        context.saveGState()
        context.clip(to: text7Rect)
        pos6.draw(in: CGRect(x: text7Rect.minX, y: text7Rect.minY + (text7Rect.height - text7TextHeight) / 2, width: text7Rect.width, height: text7TextHeight), withAttributes: text7FontAttributes)
        context.restoreGState()
        context.restoreGState()



        let text8Rect = CGRect(x: 157, y: 281, width: 59, height: 58)
        context.saveGState()
        context.setShadow(offset: CGSize(width: shadow2.shadowOffset.width * resizedShadowScale, height: shadow2.shadowOffset.height * resizedShadowScale), blur: shadow2.shadowBlurRadius * resizedShadowScale, color: (shadow2.shadowColor as! UIColor).cgColor)
        let text8Style = NSMutableParagraphStyle()
        text8Style.alignment = .center
        let text8FontAttributes = [
            .font: UIFont.systemFont(ofSize: 48, weight: .bold),
            .foregroundColor: color5,
            .paragraphStyle: text8Style,
        ] as [NSAttributedString.Key: Any]

        let text8TextHeight: CGFloat = pos7.boundingRect(with: CGSize(width: text8Rect.width, height: CGFloat.infinity), options: .usesLineFragmentOrigin, attributes: text8FontAttributes, context: nil).height
        context.saveGState()
        context.clip(to: text8Rect)
        pos7.draw(in: CGRect(x: text8Rect.minX, y: text8Rect.minY + (text8Rect.height - text8TextHeight) / 2, width: text8Rect.width, height: text8TextHeight), withAttributes: text8FontAttributes)
        context.restoreGState()
        context.restoreGState()



        let text9Rect = CGRect(x: 281, y: 281, width: 59, height: 58)
        context.saveGState()
        context.setShadow(offset: CGSize(width: shadow2.shadowOffset.width * resizedShadowScale, height: shadow2.shadowOffset.height * resizedShadowScale), blur: shadow2.shadowBlurRadius * resizedShadowScale, color: (shadow2.shadowColor as! UIColor).cgColor)
        let text9Style = NSMutableParagraphStyle()
        text9Style.alignment = .center
        let text9FontAttributes = [
            .font: UIFont.systemFont(ofSize: 48, weight: .bold),
            .foregroundColor: color5,
            .paragraphStyle: text9Style,
        ] as [NSAttributedString.Key: Any]

        let text9TextHeight: CGFloat = pos8.boundingRect(with: CGSize(width: text9Rect.width, height: CGFloat.infinity), options: .usesLineFragmentOrigin, attributes: text9FontAttributes, context: nil).height
        context.saveGState()
        context.clip(to: text9Rect)
        pos8.draw(in: CGRect(x: text9Rect.minX, y: text9Rect.minY + (text9Rect.height - text9TextHeight) / 2, width: text9Rect.width, height: text9TextHeight), withAttributes: text9FontAttributes)
        context.restoreGState()
        context.restoreGState()


        context.saveGState()
        context.translateBy(x: 43, y: 325.46)
        context.rotate(by: -45 * CGFloat.pi/180)

        context.saveGState()
        context.setAlpha(lineExp7)
        context.beginTransparencyLayer(auxiliaryInfo: nil)

        let line7Path = UIBezierPath(roundedRect: CGRect(x: 0, y: 0, width: 400, height: 5), cornerRadius: 2.5)
        context.saveGState()
        context.setShadow(offset: CGSize(width: shadow3.shadowOffset.width * resizedShadowScale, height: shadow3.shadowOffset.height * resizedShadowScale), blur: shadow3.shadowBlurRadius * resizedShadowScale, color: (shadow3.shadowColor as! UIColor).cgColor)
        color3.setFill()
        line7Path.fill()
        context.restoreGState()


        context.endTransparencyLayer()
        context.restoreGState()

        context.restoreGState()


        context.saveGState()
        context.translateBy(x: 46.54, y: 43.62)
        context.rotate(by: 45 * CGFloat.pi/180)

        context.saveGState()
        context.setAlpha(lineExp6)
        context.beginTransparencyLayer(auxiliaryInfo: nil)

        let line6Path = UIBezierPath(roundedRect: CGRect(x: 0, y: 0, width: 400, height: 5), cornerRadius: 2.5)
        context.saveGState()
        context.setShadow(offset: CGSize(width: shadow3.shadowOffset.width * resizedShadowScale, height: shadow3.shadowOffset.height * resizedShadowScale), blur: shadow3.shadowBlurRadius * resizedShadowScale, color: (shadow3.shadowColor as! UIColor).cgColor)
        color3.setFill()
        line6Path.fill()
        context.restoreGState()


        context.endTransparencyLayer()
        context.restoreGState()

        context.restoreGState()


        context.saveGState()
        context.setAlpha(lineExp5)
        context.beginTransparencyLayer(auxiliaryInfo: nil)

        let line5Path = UIBezierPath(rect: CGRect(x: 0, y: 307, width: 371, height: 5))
        context.saveGState()
        context.setShadow(offset: CGSize(width: shadow3.shadowOffset.width * resizedShadowScale, height: shadow3.shadowOffset.height * resizedShadowScale), blur: shadow3.shadowBlurRadius * resizedShadowScale, color: (shadow3.shadowColor as! UIColor).cgColor)
        color3.setFill()
        line5Path.fill()
        context.restoreGState()


        context.endTransparencyLayer()
        context.restoreGState()


        context.saveGState()
        context.setAlpha(lineExp4)
        context.beginTransparencyLayer(auxiliaryInfo: nil)

        let line4Path = UIBezierPath(rect: CGRect(x: 1, y: 183, width: 371, height: 5))
        context.saveGState()
        context.setShadow(offset: CGSize(width: shadow3.shadowOffset.width * resizedShadowScale, height: shadow3.shadowOffset.height * resizedShadowScale), blur: shadow3.shadowBlurRadius * resizedShadowScale, color: (shadow3.shadowColor as! UIColor).cgColor)
        color3.setFill()
        line4Path.fill()
        context.restoreGState()


        context.endTransparencyLayer()
        context.restoreGState()



        context.saveGState()
        context.setAlpha(lineExp3)
        context.beginTransparencyLayer(auxiliaryInfo: nil)

        let line3Path = UIBezierPath(rect: CGRect(x: 0, y: 60, width: 371, height: 5))
        context.saveGState()
        context.setShadow(offset: CGSize(width: shadow3.shadowOffset.width * resizedShadowScale, height: shadow3.shadowOffset.height * resizedShadowScale), blur: shadow3.shadowBlurRadius * resizedShadowScale, color: (shadow3.shadowColor as! UIColor).cgColor)
        color3.setFill()
        line3Path.fill()
        context.restoreGState()


        context.endTransparencyLayer()
        context.restoreGState()



        context.saveGState()
        context.translateBy(x: 308, y: 371)
        context.rotate(by: -90 * CGFloat.pi/180)

        context.saveGState()
        context.setAlpha(lineExp2)
        context.beginTransparencyLayer(auxiliaryInfo: nil)

        let line2Path = UIBezierPath(rect: CGRect(x: 0, y: 0, width: 371, height: 5))
        context.saveGState()
        context.setShadow(offset: CGSize(width: shadow3.shadowOffset.width * resizedShadowScale, height: shadow3.shadowOffset.height * resizedShadowScale), blur: shadow3.shadowBlurRadius * resizedShadowScale, color: (shadow3.shadowColor as! UIColor).cgColor)
        color3.setFill()
        line2Path.fill()
        context.restoreGState()


        context.endTransparencyLayer()
        context.restoreGState()

        context.restoreGState()



        context.saveGState()
        context.translateBy(x: 184, y: 372)
        context.rotate(by: -90 * CGFloat.pi/180)

        context.saveGState()
        context.setAlpha(lineExp1)
        context.beginTransparencyLayer(auxiliaryInfo: nil)

        let line1Path = UIBezierPath(rect: CGRect(x: 0, y: 0, width: 371, height: 5))
        context.saveGState()
        context.setShadow(offset: CGSize(width: shadow3.shadowOffset.width * resizedShadowScale, height: shadow3.shadowOffset.height * resizedShadowScale), blur: shadow3.shadowBlurRadius * resizedShadowScale, color: (shadow3.shadowColor as! UIColor).cgColor)
        color3.setFill()
        line1Path.fill()
        context.restoreGState()


        context.endTransparencyLayer()
        context.restoreGState()

        context.restoreGState()


        context.saveGState()
        context.translateBy(x: 58, y: 371)
        context.rotate(by: -90 * CGFloat.pi/180)

        context.saveGState()
        context.setAlpha(lineExp0)
        context.beginTransparencyLayer(auxiliaryInfo: nil)

        let line0Path = UIBezierPath(rect: CGRect(x: 0, y: 0, width: 371, height: 5))
        context.saveGState()
        context.setShadow(offset: CGSize(width: shadow3.shadowOffset.width * resizedShadowScale, height: shadow3.shadowOffset.height * resizedShadowScale), blur: shadow3.shadowBlurRadius * resizedShadowScale, color: (shadow3.shadowColor as! UIColor).cgColor)
        color3.setFill()
        line0Path.fill()
        context.restoreGState()

        UIColor.black.setStroke()
        line0Path.lineWidth = 1
        line0Path.stroke()

        context.endTransparencyLayer()
        context.restoreGState()

        context.restoreGState()


        context.saveGState()
        context.setAlpha(drawMsgExp)
        context.beginTransparencyLayer(auxiliaryInfo: nil)

        let text10Rect = CGRect(x: 33, y: 144, width: 307, height: 87)
        let text10Path = UIBezierPath(rect: text10Rect)
        color4.setFill()
        text10Path.fill()
        let text10TextContent = "НИЧЬЯ!"
        let text10Style = NSMutableParagraphStyle()
        text10Style.alignment = .center
        let text10FontAttributes = [
            .font: UIFont.systemFont(ofSize: 48),
            .foregroundColor: UIColor.white,
            .paragraphStyle: text10Style,
        ] as [NSAttributedString.Key: Any]

        let text10TextHeight: CGFloat = text10TextContent.boundingRect(with: CGSize(width: text10Rect.width, height: CGFloat.infinity), options: .usesLineFragmentOrigin, attributes: text10FontAttributes, context: nil).height
        context.saveGState()
        context.clip(to: text10Rect)
        text10TextContent.draw(in: CGRect(x: text10Rect.minX, y: text10Rect.minY + (text10Rect.height - text10TextHeight) / 2, width: text10Rect.width, height: text10TextHeight), withAttributes: text10FontAttributes)
        context.restoreGState()

        context.endTransparencyLayer()
        context.restoreGState()


        context.saveGState()
        context.setAlpha(winMsgExp)
        context.beginTransparencyLayer(auxiliaryInfo: nil)

        let text11Rect = CGRect(x: 33, y: 126, width: 307, height: 121)
        let text11Path = UIBezierPath(rect: text11Rect)
        color4.setFill()
        text11Path.fill()
        let text11Style = NSMutableParagraphStyle()
        text11Style.alignment = .center
        let text11FontAttributes = [
            .font: UIFont.systemFont(ofSize: 48),
            .foregroundColor: UIColor.white,
            .paragraphStyle: text11Style,
        ] as [NSAttributedString.Key: Any]

        let text11TextHeight: CGFloat = winMsg.boundingRect(with: CGSize(width: text11Rect.width, height: CGFloat.infinity), options: .usesLineFragmentOrigin, attributes: text11FontAttributes, context: nil).height
        context.saveGState()
        context.clip(to: text11Rect)
        winMsg.draw(in: CGRect(x: text11Rect.minX, y: text11Rect.minY + (text11Rect.height - text11TextHeight) / 2, width: text11Rect.width, height: text11TextHeight), withAttributes: text11FontAttributes)
        context.restoreGState()

        context.endTransparencyLayer()
        context.restoreGState()
        
        context.restoreGState()

    }




    @objc(BoardCGResizingBehavior)
    public enum ResizingBehavior: Int {
        case aspectFit
        case aspectFill
        case stretch
        case center

        public func apply(rect: CGRect, target: CGRect) -> CGRect {
            if rect == target || target == CGRect.zero {
                return rect
            }

            var scales = CGSize.zero
            scales.width = abs(target.width / rect.width)
            scales.height = abs(target.height / rect.height)

            switch self {
                case .aspectFit:
                    scales.width = min(scales.width, scales.height)
                    scales.height = scales.width
                case .aspectFill:
                    scales.width = max(scales.width, scales.height)
                    scales.height = scales.width
                case .stretch:
                    break
                case .center:
                    scales.width = 1
                    scales.height = 1
            }

            var result = rect.standardized
            result.size.width *= scales.width
            result.size.height *= scales.height
            result.origin.x = target.minX + (target.width - result.width) / 2
            result.origin.y = target.minY + (target.height - result.height) / 2
            return result
        }
    }
}
