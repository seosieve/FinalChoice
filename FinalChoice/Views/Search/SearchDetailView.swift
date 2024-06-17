//
//  SearchDetailView.swift
//  FinalChoice
//
//  Created by 서충원 on 6/17/24.
//

import UIKit
import WebKit
import Toast

class SearchDetailView: BaseView {
    
    private let divider = BaseDivider()
    
    let webView = WKWebView()
  
    override func configureSubviews() {
        self.addSubview(divider)
        self.addSubview(webView)
    }
    
    override func setViews() {
        super.setViews()
        webView.navigationDelegate = self
    }
    
    override func configureConstraints() {
        divider.snp.makeConstraints { make in
            make.top.horizontalEdges.equalTo(self.safeAreaLayoutGuide)
        }
        
        webView.snp.makeConstraints { make in
            make.top.equalTo(divider.snp.bottom)
            make.horizontalEdges.bottom.equalTo(self.safeAreaLayoutGuide)
        }
    }
    
    func configureWebView(link: String) {
        guard let url = URL(string: link) else { return }
        let request = URLRequest(url: url)
        self.makeToastActivity(.center)
        webView.load(request)
    }
}

//MARK: - WKNavigationDelegate
extension SearchDetailView: WKNavigationDelegate {
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        self.hideToastActivity()
    }
}
