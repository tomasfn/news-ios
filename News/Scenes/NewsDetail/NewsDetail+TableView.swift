//
//  NewsDetail+TableView.swift
//  News
//
//  Created by Tomas Fernandez Velazco on 20/3/22.
//

import UIKit
import SafariServices

//MARK: - UITableViewDelegate, UITableViewDataSource

extension NewsDetailViewController: UITableViewDelegate, UITableViewDataSource {
    
    func setUpTable() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: NewsDetailTableViewCell.nameOfClass, bundle: nil), forCellReuseIdentifier: NewsDetailTableViewCell.nameOfClass)
        setTableFooter()
    }
    
    func setTableFooter() {
        let footerView = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 65))
        footerView.backgroundColor = UIColor.systemBlue
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 65))
        button.setTitle("Ver en el navegador", for: .normal)
        button.addTarget(self, action: #selector(seeLinkInWeb), for: .touchUpInside)
        footerView.addSubview(button)
        tableView.tableFooterView = footerView
    }
    
    @objc func seeLinkInWeb() {
        guard let urlToOpen = viewModel?.selectedNews?.url, let url = URL(string: urlToOpen) else { return }
        let vc = SFSafariViewController(url: url)
        present(vc, animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.populateTableViewDetail().count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: NewsDetailTableViewCell.nameOfClass, for: indexPath) as? NewsDetailTableViewCell else { return UITableViewCell() }
        viewModel?.configure(cell: cell, for: indexPath.row)
        return cell
    }
    
    private func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }

    private func tableView(tableView: UITableView, estimatedHeightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}


