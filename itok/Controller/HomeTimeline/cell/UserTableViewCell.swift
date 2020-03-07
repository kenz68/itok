//
//  UserTableViewCell.swift
//  itok
//
//  Created by Quoc Le on 3/7/20.
//  Copyright © 2020 IceTeaViet. All rights reserved.
//

import UIKit

@objc protocol userCellDelegate {
    func call(username: String)
    func call(contact: Contact)
}

class UserTableViewCell: UITableViewCell {
    weak var delegate: userCellDelegate?
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var callButton: UIImageView!
    var contact: Contact?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        avatarImageView.rouded()
        self.selectionStyle = .none
        let singleTap = UITapGestureRecognizer(target: self, action: #selector(callButtonPressed(_:)))
        callButton.isUserInteractionEnabled = true
        callButton.addGestureRecognizer(singleTap)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func render(contact: Contact) {
        self.contact = contact
        avatarImageView.image = contact.avatar
        usernameLabel.text = contact.name
    }
    
    @objc func callButtonPressed(_ sender: UIImageView) {
        guard let username = contact?.name else { return }
        self.delegate?.call(username: username)
        
        guard let c = contact else { return }
        self.delegate?.call(contact: c)
    }
    
}
