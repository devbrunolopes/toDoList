//
//  HomeView.swift
//  toDoList
//
//  Created by Bruno Lopes on 13/08/22.
//

import UIKit

protocol HomeViewDelegate: AnyObject {
    func didTapAddButton()
}

class HomeView: UIView {

    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Todoey"
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.textColor = .white
//        label.textColor = UIColor(red: 55/255, green: 67/255, blue: 91/255, alpha: 1.0)
        return label
    }()
    
    lazy var addButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .clear
        button.clipsToBounds = true
        button.setImage(UIImage(systemName: "plus"), for: .normal)
        button.tintColor = .white
        button.addTarget(self, action: #selector(didTapAddButton), for: .touchUpInside)
        return button
    }()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .white
//        tableView.register(ReportsTableViewCell.self, forCellReuseIdentifier: ReportsTableViewCell.identifier)
        return tableView
    }()
    
    //MARK: - Properties
    
    weak private var delegate: HomeViewDelegate?
    
    //MARK: - Initializers
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configBackGround()
        addElements()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - OBJC Functions
    
    @objc func didTapAddButton() {
        
    }
    
    //MARK: - Public Functions
    
    public func setTableViewProtocols(delegate: UITableViewDelegate, dataSource: UITableViewDataSource) {
        tableView.delegate = delegate
        tableView.dataSource = dataSource
    }
    
    public func setViewDelegate(delegate: HomeViewDelegate?) {
        self.delegate = delegate
    }
    
    //MARK: - Private Functions
    
    private func configBackGround() {
        self.backgroundColor = UIColor(red: 170/255, green: 19/255, blue: 240/255, alpha: 1.0)
    }
    
    private func addElements() {
        addSubview(titleLabel)
        addSubview(addButton)
        addSubview(tableView)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
        
            titleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 10),
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            addButton.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor),
            addButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            addButton.heightAnchor.constraint(equalToConstant: 40),
            addButton.widthAnchor.constraint(equalToConstant: 40),
            
            tableView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
        ])
    }

}
