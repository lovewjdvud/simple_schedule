//
//  ViewController.swift
//  simple_schedule
//
//  Created by Songjeongpyeong on 2022/03/14.
//

import UIKit
import RxCocoa
import RxViewController
import RxSwift
import FSCalendar
import MaterialComponents.MaterialBottomSheet
import Firebase
import FirebaseFirestore

class ViewController: UIViewController {
    let db = Firestore.firestore()
    @IBOutlet weak var Calender: FSCalendar!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Setting()
//
//        db.collection("Test2").document("ExampleDocument1").setData([:]) { err in
//            if let err = err {
//                print(err) }
//            else {
//                print("Success") } }

//        // Array 추가하기
//        let path = db.collection("Test2").document("ExampleDocument1");
//        path.updateData(["Array": []])

     
        let test = db.collection("Test2").document("ExampleDocument1")
       // test.updateData(["Array": []])
      //  test.updateData(["Map": [:]])
       // test.updateData(["Map" : ["Key1" : "Value1", "Key2" : "Value2"]])
        test.getDocument {document , error in
       

            if (error as NSError?) != nil {
                // self.errorMessage = "Error getting document: \(error.localizedDescription)"
               }
               else {
                 if let document = document {
                   let id = document.documentID
                   let data = document.data()
                    let title = data?["Map"] as? String ?? ""
                   

                    print("id \(id) , data \(String(describing: data!)) , title = (\(title)")
                 //  self.book = Book(id:id, title: title, numberOfPages: numberOfPages, author: author)
                 }
               }
             }

        

    }

    @IBAction func testbtn(_ sender: Any) {
    }
    
    func Setting()  {
        
        Calender.delegate = self
        Calender.dataSource = self
        
        // 달력의 년월 글자 바꾸기
        Calender.appearance.headerDateFormat = "YYYY년 M월"
        Calender.appearance.headerTitleFont = UIFont.systemFont(ofSize: 24)
        
        //  선택 날짜
        Calender.appearance.selectionColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
       // Calender.appearance.headerMinimumDissolvedAlpha = 0.0
        Calender.appearance.todayColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)

        Calender.appearance.selectionColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)



       
        
        
        // 달력의 요일 글자 바꾸는 방법 1
        Calender.locale = Locale(identifier: "ko_KR")
        
        
        Calender.calendarWeekdayView.weekdayLabels[0].text = "일"
        Calender.calendarWeekdayView.weekdayLabels[1].text = "월"
        Calender.calendarWeekdayView.weekdayLabels[2].text = "화"
        Calender.calendarWeekdayView.weekdayLabels[3].text = "수"
        Calender.calendarWeekdayView.weekdayLabels[4].text = "목"
        Calender.calendarWeekdayView.weekdayLabels[5].text = "금"
        Calender.calendarWeekdayView.weekdayLabels[6].text = "토"
        
        // 타이틀 컬러
        Calender.appearance.titleSelectionColor = .black
        // 서브 타이틀 컬러
        Calender.appearance.subtitleSelectionColor = .black
        
        // 달력의 토,일 날짜 색깔
        //Calender.appearance.titleWeekendColor = .red

    }
    
    
}


extension ViewController : FSCalendarDelegate, FSCalendarDataSource, FSCalendarDelegateAppearance {
    
    // 날짜 선택 시 콜백 메소드
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        
        
//        guard let pushVC = self.storyboard?.instantiateViewController(withIdentifier: "TableViewController") as? TableViewController else {return}
//       let bottomSheet: MDCBottomSheetController = MDCBottomSheetController(contentViewController: pushVC)
//               bottomSheet.mdc_bottomSheetPresentationController?.preferredSheetHeight = 400
//                bottomSheet.scrimColor = UIColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)).withAlphaComponent(0)
//        present(bottomSheet, animated: true, completion: nil)
        
    }
    
    
    
}

