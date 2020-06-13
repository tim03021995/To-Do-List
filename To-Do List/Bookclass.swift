//
//  Bookclass.swift
//  To-Do List
//
//  Created by Alvin Tseng on 2020/6/12.
//  Copyright © 2020 Alvin Tseng. All rights reserved.
//

import UIKit

class Bookclass: UIViewController {
    let  imagePicker = UIImagePickerController()

    override func viewDidLoad() {
        myPhoto.image  = myTask[reRow!].image ?? UIImage(systemName: "plus.rectangle")
        myPhoto.layer.cornerRadius = myPhoto.frame.height*0.2
        myPhoto.layer.shadowOffset = CGSize(width: 10, height: 10)
        myPhoto.layer.shadowRadius = myPhoto.frame.height*0.2
        myPhoto.layer.shadowColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        myText.text = myTask[reRow!].text ?? "請輸入文字"
        myTitle.text = myTask[reRow!].title
        view.backgroundColor = myTask[reRow!].bgcolor ?? nil
        myText.backgroundColor = myTask[reRow!].bgcolor ?? nil
        super.viewDidLoad()
    //    myPhoto.image = myTask[reRow]
        
        // Do any additional setup after loading the view.
    }
    @IBOutlet weak var myPhoto: UIImageView!
    @IBOutlet weak var myTitle: UITextField!
    @IBOutlet weak var myText: UITextView!
    override func viewDidDisappear(_ animated: Bool) {
        super .viewDidDisappear(true)
        myTask[reRow!].image = myPhoto.image
        myTask[reRow!].text = myText.text
        myTask[reRow!].title = myTitle.text!
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    // MARK: - Navigation

//    // In a storyboard-based application, you will often want to do a little preparation before navigation
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//
//        // Get the new view controller using segue.destination.
//        // Pass the selected object to the new view controller.
//    }

}
extension Bookclass: UIImagePickerControllerDelegate,UINavigationControllerDelegate{
     func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        print("Use photo")
        let image = info[.originalImage] as! UIImage//取得拍下的照片
        myPhoto.image = image
        print("取得照片")
            UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)//將相片存擋
        print("照片存擋")
            dismiss(animated: true, completion: nil)
    }
}
