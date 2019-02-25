//
//  ViewController.swift
//  InStatPlayer
//
//  Created by tularovbeslan@gmail.com on 02/19/2019.
//  Copyright (c) 2019 tularovbeslan@gmail.com. All rights reserved.
//

import UIKit
import InStatPlayer
import AVFoundation

class InStatPlayerViewController: UIViewController {

	var player: InStatPlayerView!
	@IBOutlet weak var segmentedControl: UISegmentedControl!
	open var indicatorView = InStatIndicatorView()

	open override func viewDidLoad() {
		super.viewDidLoad()

		indicatorView.translatesAutoresizingMaskIntoConstraints = false
		indicatorView.startAnimation()
		setupPlayer()
		setupPlayerConstraints()

		view.addSubview(segmentedControl)
	}

	func setupPlayer() {

		let url = URL(string: "https://sample-videos.com/video123/mp4/240/big_buck_bunny_240p_10mb.mp4")!
		let item0 = AVPlayerItem(url: url)
		let item1 = AVPlayerItem(url: url)
		let item2 = AVPlayerItem(url: url)
		let item3 = AVPlayerItem(url: url)

		
		let queue = [[item0],[item1,item2],[item3]]

		let control = CustomInStatControlView(customIndicatorView: indicatorView)
		player = InStatPlayerView(queue, customControlView: control)
		player.translatesAutoresizingMaskIntoConstraints = false
		view.addSubview(player)

	}

	func setupPlayerConstraints() {

		player.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
		player.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
		player.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
		player.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
	}

	@IBAction func changeRatio(_ sender: UISegmentedControl) {

		switch sender.selectedSegmentIndex {
		case 0:
			player.aspectRatio = .resize
		case 1:
			player.aspectRatio = .resizeAspect
		case 2:
			player.aspectRatio = .resizeAspectFill
		case 3:
			player.aspectRatio = .sixteenToNINE
		case 4:
			player.aspectRatio = .fourToTHREE
		default:
			break
		}
	}

}
