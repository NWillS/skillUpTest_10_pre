//
//  ITunesSearchViewController.swift
//  skillUpTest_10_pre
//
//  Created by S N on 2018/03/28.
//  Copyright © 2018年 Seidi Nakamura. All rights reserved.
//

import Alertift
import SVProgressHUD
import UIKit

class ITunesSearchViewController: UIViewController {
    @IBOutlet weak private var musicListTableView: UITableView?
    @IBOutlet weak private var searchBar: UISearchBar?
    
    let dataSource = MusicListTableViewProvider()
    let api = ITunesSearchAPI()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        musicListTableView?.rowHeight = 60
        musicListTableView?.dataSource = dataSource
        searchBar?.delegate = self
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
        SVProgressHUD.setDefaultStyle(.dark)
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
        musicListTableView?.reloadData()
        musicListTableView?.scrollToRow(at: IndexPath(row: 0, section: 0), at: .top, animated: false)
        SVProgressHUD.dismiss()
    }
    
    func offline() {
        SVProgressHUD.dismiss()
        Alertift.alert(title: "警告", message: "通信環境の良い場所で再度お試しください。")
        .action(.default("OK"))
        .show()
    }
}
