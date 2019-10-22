//
//  ProfileViewController.swift
//  Home Chore Tracker
//
//  Created by Isaac Lyons on 10/21/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit
import Photos

class ProfileViewController: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var choosePictureButton: UIButton!
    @IBOutlet private weak var nameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBarItem.selectedImage = tabBarItem.selectedImage?.withRenderingMode(.alwaysOriginal)
        updateViews()
    }
    
    // MARK: - Actions
    
    @IBAction func choosePictureTapped(_ sender: UIButton) {
        
        let authorizationStatus = PHPhotoLibrary.authorizationStatus()
        
        switch authorizationStatus {
        case .authorized:
            presentImagePickerController()
        case .notDetermined:
            PHPhotoLibrary.requestAuthorization { status in
                
                guard status == .authorized else {
                    NSLog("User did not authorize access to the photo library")
                    return
                }
                self.presentImagePickerController()
            }
        default:
            break
        }
    }
    
    // MARK: - Private
    
    private func presentImagePickerController() {
        guard UIImagePickerController.isSourceTypeAvailable(.photoLibrary) else { return }
        
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = self
        
        present(imagePicker, animated: true, completion: nil)
    }
    
    private func updateViews() {
        let highlightColor = UIColor(red: 0.02, green: 0.69, blue: 0.31, alpha: 1.0)
        let textColor = UIColor(red: 0.02, green: 0.33, blue: 0.59, alpha: 1.0)
        
        nameLabel.textColor = textColor

        if imageView.image != nil {
            imageView.layer.borderColor = highlightColor.cgColor
            imageView.layer.borderWidth = 4
            imageView.layer.cornerRadius = 10
        }
        
        choosePictureButton.setTitleColor(.white, for: .normal)
        choosePictureButton.layer.backgroundColor = highlightColor.cgColor
        choosePictureButton.layer.cornerRadius = 5
    }
}

// MARK: - Image Picker Controller Delegate

extension ProfileViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
        
        picker.dismiss(animated: true, completion: nil)
        
        guard let image = info[.originalImage] as? UIImage else { return }
        
        imageView.image = image
        updateViews()
    }
}
