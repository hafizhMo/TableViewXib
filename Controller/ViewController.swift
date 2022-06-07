//
//  ViewController.swift
//  TableViewXib
//
//  Created by Hafizh Mo on 06/06/22.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    let data: [Member] = [
        Member(name: "Uemura Rina", zodiac: "January 4, 1997 (age 25)", image: "uemura"),
        Member(name: "Ozeki Rika", zodiac: "October 7, 1997 (age 24)", image: "ozeki"),
        Member(name: "Koike Minami", zodiac: "November 14, 1998 (age 23)", image: "koike"),
        Member(name: "Kobayashi Yui", zodiac: "October 23, 1999 (age 22)", image: "kobayashi"),
        Member(name: "Saito Fuyuka", zodiac: "February 15, 1998 (age 24)", image: "saito"),
        Member(name: "Sugai Yuuka", zodiac: "November 29, 1995 (age 26)", image: "sugai"),
        Member(name: "Habu Mizuho", zodiac: "July 7, 1997 (age 24)", image: "habu"),
        Member(name: "Harada Aoi", zodiac: "May 7, 2000 (age 22)", image: "harada"),
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "MemberTableCell", bundle: nil), forCellReuseIdentifier: "MemberTableCell")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = (tableView.dequeueReusableCell(withIdentifier: "MemberTableCell", for: indexPath) as? MemberTableCell)!
        
        let member = data[indexPath.row]
        cell.nameLabel.text = member.name
        cell.zodiacLabel.text = member.zodiac
        cell.profileImage.image = UIImage(named: member.image)?.resizeTopAlignedToFill(newWidth: cell.profileImage.frame.width)
        
        return cell
    }
}

