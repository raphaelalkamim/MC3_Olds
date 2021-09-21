//
//  ViewController.swift
//  olds
//
//  Created by Raphael Alkamim on 15/09/21.
//

import UIKit

protocol AlbumViewControllerDelegate: AnyObject { // protocolo para atualizar a pagina se houver edições
    func didRegister()
}

class AlbumViewController: UIViewController {
    var album: Album?
    weak var delegate: NewAlbumViewControllerDelegate?
    @IBOutlet weak var albunsButton: UIBarButtonItem!
    
    @IBOutlet weak var editButton: UIButton!
    @IBOutlet weak var albumCover: UIImageView!
    @IBOutlet weak var newPageButton: UIButton!
    @IBOutlet weak var nextPageButton: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        title = album?.albumTitle //settando titulo do album
        albumCover.contentMode = .scaleAspectFit
        changeCover()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        title = album?.albumTitle 
        albumCover.contentMode = .scaleAspectFit
        changeCover()
    }
    
    
    func changeCover() {
        let coverName: String? = String?((album?.albumType)!)
        if (coverName == "person") {
            albumCover.image = UIImage(named: "blueAlbum")
        }
        else if (coverName == "travel") {
            albumCover.image = UIImage(named: "brownAlbum")
        }
        else if (coverName == "event") {
            albumCover.image = UIImage(named: "greenAlbum")
        }
        else {
            albumCover.image = UIImage(named: "redAlbum")
        }
    }

    func changeAlbum(album: Album?) {
        self.album = album
    }
    
    @IBAction func edit(_ sender: Any) {
        if let vc = storyboard?.instantiateViewController(identifier: "EditView") as? NewAlbumViewController{
            vc.changeAlbum(album: album)
            navigationController?.pushViewController(vc, animated: true)
        
    }

}
}
