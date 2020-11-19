//
//  ViewController.swift
//  008_Touch+Photo
//
//  Created by 松島優希 on 2020/11/19.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate,UINavigationControllerDelegate{
    
    var imageNameArray: [String] = ["hana","hoshi","onpu","shitumon"]
    
    var imageIndex: Int = 0
    
    @IBOutlet weak var haikeiImageView: UIImageView!
    
    var imageView: UIImageView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch: UITouch = touches.first!
        let location: CGPoint = touch.location(in: self.view)
        
        if imageIndex != 0{
            imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
            let image: UIImage = UIImage(named: imageNameArray[imageIndex-1])!
            imageView.image = image
            
            imageView.center = CGPoint(x: location.x, y: location.y)
            
            self.view.addSubview(imageView)
        }
        
    }
    
    @IBAction func selectedFirst(_ sender: Any) {
        imageIndex = 1
    }
    
    @IBAction func selectedSecond(_ sender: Any) {
        imageIndex = 2
    }
    
    @IBAction func selectedThird(_ sender: Any) {
        imageIndex = 3
    }
    
    @IBAction func selectedFourth(_ sender: Any) {
        imageIndex = 4
    }
    
    @IBAction func back(_ sender: Any) {
        self.imageView.removeFromSuperview()
    }
    
    @IBAction func selectBackground(_ sender: Any) {
        //インスタンス作成
        let imagePickerController: UIImagePickerController = UIImagePickerController()
        //使用設定
        imagePickerController.sourceType = UIImagePickerController.SourceType.photoLibrary
        imagePickerController.delegate = self
        imagePickerController.allowsEditing = true
        //呼び出し
        self.present(imagePickerController, animated:  true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[.originalImage] as? UIImage
        
        haikeiImageView.image = image
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func save(){
        //画面上のスクリーンショット
        let rect:CGRect = CGRect(x: 0, y: 30, width: 320, height: 380)
        UIGraphicsBeginImageContext(rect.size)
        self.view.layer.render(in: UIGraphicsGetCurrentContext()!)
        let capture = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        //フォトライブラリに保存
        UIImageWriteToSavedPhotosAlbum(capture!, nil, nil, nil)
    }
    
    


}

