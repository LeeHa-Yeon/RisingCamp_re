//
//  RankViewController + TableView.swift
//  ThreadGame
//
//  Created by 이하연 on 2021/12/03.
//

import UIKit

extension RankViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rankDict.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: RankCell.identifier, for: indexPath) as? RankCell else {
            return UITableViewCell()
        }
        let sortedDitionary = tempDict.sorted{ $0.1 > $1.1}
        
        cell.setUI()
        if indexPath.row >= 0 && indexPath.row <= 2 {
            cell.backgroundColor = #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1)
            cell.rankNum.textColor = .red
        }
        cell.rankNum.text = "\(indexPath.row+1)위"
        cell.nameLabel.text = sortedDitionary[indexPath.row].key
        cell.scoreLabel.text = "\(sortedDitionary[indexPath.row].value)점"
        
        if sortedDitionary[indexPath.row].key == currentUserNicName {
            cell.checkIng.image = UIImage(named: "체크")
        }
        
        return cell
    }
    
}
