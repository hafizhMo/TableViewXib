//
//  ViewController.swift
//  TableViewXib
//
//  Created by Hafizh Mo on 06/06/22.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    let gen1: [Member] = [
        Member(name: "Uemura Rina", zodiac: "January 4, 1997 (age 25)", image: "uemura"),
        Member(name: "Ozeki Rika", zodiac: "October 7, 1997 (age 24)", image: "ozeki"),
        Member(name: "Koike Minami", zodiac: "November 14, 1998 (age 23)", image: "koike"),
        Member(name: "Kobayashi Yui", zodiac: "October 23, 1999 (age 22)", image: "kobayashi"),
        Member(name: "Saito Fuyuka", zodiac: "February 15, 1998 (age 24)", image: "saito"),
        Member(name: "Sugai Yuuka", zodiac: "November 29, 1995 (age 26)", image: "sugai"),
        Member(name: "Habu Mizuho", zodiac: "July 7, 1997 (age 24)", image: "habu"),
        Member(name: "Harada Aoi", zodiac: "May 7, 2000 (age 22)", image: "harada")
    ]
    
    let gen2: [Member] = [
        Member(name: "Inoue Rina", zodiac: "January 29, 2001 (age 21)", image: "inoue"),
        Member(name: "Endo Hikari", zodiac: "April 17, 1999 (age 23)", image: "endo"),
        Member(name: "Ozono Rei", zodiac: "April 18, 2000 (age 22)", image: "ozono"),
        Member(name: "Onuma Akiho", zodiac: "October 12, 1999 (age 22)", image: "onuma"),
        Member(name: "Kosaka Mirano", zodiac: "December 19, 2002 (age 19)", image: "kosaka"),
        Member(name: "Seki Yumiko", zodiac: "June 29, 1998 (age 23)", image: "yumiko"),
        Member(name: "Takemoto Yui", zodiac: "March 23, 2002 (age 20)", image: "takemoto"),
        Member(name: "Tamura Hono", zodiac: "October 21, 1998 (age 23)", image: "hono"),
        Member(name: "Fujiyoshi Karin", zodiac: "August 29, 2001 (age 20)", image: "karin"),
        Member(name: "Masumoto Kira", zodiac: "January 12, 2002 (age 20)", image: "matsumoto"),
        Member(name: "Matsuda Rina", zodiac: "October 13, 1999 (age 22)", image: "matsuda"),
        Member(name: "Morita Hikaru", zodiac: "July 10, 2001 (age 20)", image: "hikaru"),
        Member(name: "Moriya Rena", zodiac: "January 2, 2000 (age 22)", image: "rena"),
        Member(name: "Yamasaki Ten", zodiac: "September 28, 2005 (age 16)", image: "ten")
    ]
    
    var data: [MemberSection] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.prefersLargeTitles = true
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "MemberTableCell", bundle: nil), forCellReuseIdentifier: "MemberTableCell")
        
        data.append(MemberSection(title: MemberGen.first.rawValue, list: gen1))
        data.append(MemberSection(title: MemberGen.second.rawValue, list: gen2))
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if let index = self.tableView.indexPathForSelectedRow{
            self.tableView.deselectRow(at: index, animated: true)
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data[section].list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = (tableView.dequeueReusableCell(withIdentifier: "MemberTableCell", for: indexPath) as? MemberTableCell)!
        
        let section = indexPath.section
        let member = data[section].list[indexPath.row]
        
        cell.selectionStyle = .default
        cell.nameLabel.text = member.name
        cell.zodiacLabel.text = member.zodiac
        cell.profileImage.image = UIImage(named: member.image)?
            .resizeTopAlignedToFill(newWidth: cell.profileImage.frame.width)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 168
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let member = data[indexPath.section].list[indexPath.row]
        
        if let detail = storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController {
            detail.name = member.name
            detail.birthday = member.zodiac
            detail.photo = UIImage(named: member.image)!
            self.navigationController?.pushViewController(detail, animated: true)
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let cell = HeaderSectionCell()
        cell.titleSectionLabel.text = data[section].title.uppercased()
        return cell
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 45
    }
}

