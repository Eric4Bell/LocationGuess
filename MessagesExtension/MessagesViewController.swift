//
//  MessagesViewController.swift
//  MessagesExtension
//
//  Created by Eric Bell on 3/20/17.
//  Copyright © 2017 Eric Bell. All rights reserved.
//

import UIKit
import Messages

class MessagesViewController: MSMessagesAppViewController, UINavigationControllerDelegate {
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Conversation Handling
    
    override func willBecomeActive(with conversation: MSConversation) {
        // Called when the extension is about to move from the inactive to active state.
        // This will happen when the extension is about to present UI.
        
        // Use this method to configure the extension and restore previously stored state.
    }
    
    override func didResignActive(with conversation: MSConversation) {
        // Called when the extension is about to move from the active to inactive state.
        // This will happen when the user dissmises the extension, changes to a different
        // conversation or quits Messages.
        
        // Use this method to release shared resources, save user data, invalidate timers,
        // and store enough state information to restore your extension to its current state
        // in case it is terminated later.
    }
   
    override func didReceive(_ message: MSMessage, conversation: MSConversation) {
        // Called when a message arrives that was generated by another instance of this
        // extension on a remote device.
        
        // Use this method to trigger UI updates in response to the message.
    }
    
    override func didStartSending(_ message: MSMessage, conversation: MSConversation) {
        // Called when the user taps the send button.
    }
    
    override func didCancelSending(_ message: MSMessage, conversation: MSConversation) {
        // Called when the user deletes the message without sending it.
    
        // Use this to clean up state related to the deleted message.
    }
    
    override func willTransition(to presentationStyle: MSMessagesAppPresentationStyle) {
        // Called before the extension transitions to a new presentation style.
    
        // Use this method to prepare for the change in presentation style.
    }
    
    override func didTransition(to presentationStyle: MSMessagesAppPresentationStyle) {
        // Called after the extension transitions to a new presentation style.
    
        // Use this method to finalize any behaviors associated with the change in presentation style.
    }
    
    
    
    
    
    
    @IBAction func takePicture(_ sender: Any) {
        requestPresentationStyle(.expanded)
        
        let sourceType = UIImagePickerControllerSourceType.camera
        
        if UIImagePickerController.isSourceTypeAvailable(sourceType) {
            let picker = UIImagePickerController()
            picker.delegate = self
            picker.sourceType = sourceType
            addChildViewController(picker)
            let insetTop: CGFloat = 20.0
            let insetBottom: CGFloat = 20.0
            let height = self.view.bounds.size.height - (insetTop + insetBottom)
            picker.view.frame = CGRect(x: 0.0, y: insetTop, width: self.view.bounds.size.width, height: height)
            view.addSubview(picker.view)
            picker.didMove(toParentViewController: self)
        }
    }
    
    

}

extension MessagesViewController: UIImagePickerControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        let vc = self.childViewControllers.last
        vc?.view.removeFromSuperview()
        vc?.removeFromParentViewController()
        
        if let photo = info[UIImagePickerControllerOriginalImage] as? UIImage {
            imageView.image = photo
        }
    }
}
