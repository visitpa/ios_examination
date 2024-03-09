//
//  LandingViewController.swift
//  ios_examination
//
//  Created by Visit Patcharapanyapong on 9/3/2567 BE.
//

import UIKit

protocol LandingViewControllerDisplayLogic {
    func displayContent(viewModel: LandingModels.Content.ViewModel)
    func displayLoading(loading: Bool)

}

class LandingViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    @IBOutlet weak var errorStackView: UIStackView!
    @IBOutlet weak var errorTitle: UILabel!
    var interactor: LandingInteractorBusinessLogic!
    var datas: [LandingModels.CellType] = []
    
    override func awakeFromNib() {
        super.awakeFromNib()
        let presenter = LandingPresenter()
        interactor = LandingInteractor()
        interactor.presenter = presenter
        presenter.vc = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableViewCell()
        interactor.getContent()
    }

    private func setupTableViewCell() {
        tableView.dataSource = self
        let bannerNib = UINib(nibName: "BannerTableViewCell", bundle: nil)
        let headerNib = UINib(nibName: "HeaderTableViewCell", bundle: nil)
        let listNib = UINib(nibName: "ListTableViewCell", bundle: nil)
        let detailNib = UINib(nibName: "DetailTableViewCell", bundle: nil)
        tableView.register(bannerNib, forCellReuseIdentifier: "BannerTableViewCell")
        tableView.register(headerNib, forCellReuseIdentifier: "HeaderTableViewCell")
        tableView.register(listNib, forCellReuseIdentifier: "ListTableViewCell")
        tableView.register(detailNib, forCellReuseIdentifier: "DetailTableViewCell")
    }
    
    @IBAction func retryPressed() {
        
    }
}

extension LandingViewController: LandingViewControllerDisplayLogic {
    func displayContent(viewModel: LandingModels.Content.ViewModel) {
        datas = viewModel.datas
        tableView.isHidden = false
        tableView.reloadData()
    }
    
    func displayLoading(loading: Bool) {
        indicator.isHidden = !loading
    }
}

extension LandingViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let element = datas[indexPath.row]
        switch element {
        case .banner(let model): 
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "BannerTableViewCell", for: indexPath) as? BannerTableViewCell else { return UITableViewCell() }
            cell.setCell(model: model)
            return cell
        case .detail(let model):
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "DetailTableViewCell", for: indexPath) as? DetailTableViewCell else { return UITableViewCell() }
            cell.setCell(model: model)
            return cell
        case .header(let model):
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "HeaderTableViewCell", for: indexPath) as? HeaderTableViewCell else { return UITableViewCell() }
            cell.setCell(model: model)
            return cell
        case .list(let model):
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "ListTableViewCell", for: indexPath) as? ListTableViewCell else { return UITableViewCell() }
            cell.setCell(model: model)
            return cell
        }      
    }
}
