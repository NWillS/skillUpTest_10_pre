//
//  ITunesSearchViewController.swift
//  skillUpTest_10_pre
//
//  Created by S N on 2018/03/28.
//  Copyright © 2018年 Seidi Nakamura. All rights reserved.
//

import UIKit
import SVProgressHUD

class ITunesSearchViewController: UIViewController {
    @IBOutlet weak var musicListTableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    let dataSource = MusicListTableViewProvider()
    let api = ITunesSearchAPI()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        musicListTableView.rowHeight = 70
        musicListTableView.dataSource = dataSource
        searchBar.delegate = self
        api.delegate = self
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension ITunesSearchViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let term = searchBar.text else {
            return
        }
        SVProgressHUD.show()
        api.search(term: term)
        //キーボードを閉じる
        self.view.endEditing(true)
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
}

extension ITunesSearchViewController: ITunesSearchAPIDelegate {
    func received(trackList: TrackList) {
        dataSource.set(musicList: trackList)
        musicListTableView.reloadData()
        SVProgressHUD.dismiss()
    }
}
