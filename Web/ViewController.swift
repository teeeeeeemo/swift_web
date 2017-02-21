//
//  ViewController.swift
//  Web
//
//  Created by Lucia on 2017. 2. 21..
//  Copyright © 2017년 Lucia. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIWebViewDelegate {
    @IBOutlet weak var txtUrl: UITextField!
    @IBOutlet weak var myWebView: UIWebView!
    @IBOutlet weak var myActivityIndicator: UIActivityIndicatorView!
    
    
    // url의 인수를 통해 웹 페이지의 주소를 전달받아 웹 페이지를 보여줌.
    func loadWebPage(_ url: String) {
        let myUrl = URL(string: url) // 상수 myUrl : url값을 받아 URL형으로 선언
        let myRequest = URLRequest(url: myUrl!) // 상수 myRequest : 상수 myUrl을 받아 URLRequest형으로 선언
        myWebView.loadRequest(myRequest) // UIWebView형의 myWebView클래스의 loadRequest메서드 호출.
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        myWebView.delegate = self
        loadWebPage("https://github.com/teeeeeeemo")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func webViewDidStartLoad(_ webView: UIWebView) {
        myActivityIndicator.startAnimating()
    }
    
    func webViewDidFinishLoad(_ webView: UIWebView) {
        myActivityIndicator.stopAnimating()
    }
    
    // "http://" 문자열이 없을 경우 자동 삽입.
    func checkUrl(_ url: String) -> String {
        var strUrl = url
        let flag = strUrl.hasPrefix("http://")
        if !flag {
            strUrl = "http://" + strUrl
        }
        return strUrl
    }
    
    // 텍스트 필드에 적힌 주소로 웹 뷰 로딩
    @IBAction func btnGotoUrl(_ sender: UIButton) {
        let myUrl = checkUrl(txtUrl.text!)
        txtUrl.text = " "
        loadWebPage(myUrl)
    }

    @IBAction func btnGoSite1(_ sender: UIButton) {
        loadWebPage("http://www.daum.net")
    }
    @IBAction func btnGoSite2(_ sender: UIButton) {
        loadWebPage("http://www.naver.com")
    }
    
    // HTML 코드를 변수에 저장하고 [html] 버튼을 클릭하면
    // HTML 문법에 맞게 작성된 문자열 변수를 웹 뷰로 나타냄.
    @IBAction func btnLoadHtmlString(_ sender: UIButton) {
        let htmlString = "<h1> HTML String </h1> <p> String 변수를 이용한 웹 페이지 </p>              <p><a href=\"http://google.net\">Google</a>로 이동</p>"
        myWebView.loadHTMLString(htmlString, baseURL: nil)
    }
    
    // htmlView.html을 웹 뷰로 나타냄.
    @IBAction func btnLoadHtmlFile(_ sender: UIButton) {
        let myHtmlBundle = Bundle.main
        let filePath = myHtmlBundle.path(forResource: "htmlView", ofType: "html")
        loadWebPage(filePath!)
    }
    @IBAction func btnStop(_ sender: UIBarButtonItem) {
        myWebView.stopLoading()
    }
    @IBAction func btnReload(_ sender: UIBarButtonItem) {
        myWebView.reload()
    }
    @IBAction func btnGoBack(_ sender: UIBarButtonItem) {
        myWebView.goBack()
    }
    @IBAction func btnGoForward(_ sender: UIBarButtonItem) {
        myWebView.goForward()
    }

}

