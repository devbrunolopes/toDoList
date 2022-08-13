//
//  ViewController.swift
//  toDoList
//
//  Created by Bruno Lopes on 13/08/22.
//

import UIKit

class HomeViewController: UIViewController {

    var homeView: HomeView?
    
    override func loadView() {
        homeView = HomeView()
        view = homeView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        homeView?.setViewDelegate(delegate: self)
        homeView?.setTableViewProtocols(delegate: self, dataSource: self)
    }

    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
}

//MARK: - UITableViewDelegate, UITableViewDataSource

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 30
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}

//MARK: - HomeViewDelegate

extension HomeViewController: HomeViewDelegate {
    func didTapAddButton() {
        print("ADD")
    }
}
