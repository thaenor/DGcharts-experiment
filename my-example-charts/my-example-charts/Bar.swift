//
//  Bar.swift
//  my-example-charts
//
//  Created by Francisco Santos on 16/09/2022.
//

import Foundation
import Charts
import SwiftUI

// NOTE: if there are issues with new Swift Charts on iOS 16
// https://github.com/danielgindi/Charts/issues/4897#issuecomment-1240652977

struct Bar : UIViewRepresentable {
    //Bar chart accepts data as array of BarChartDataEntry objects
    var entries : [BarChartDataEntry]
    // this func is required to conform to UIViewRepresentable protocol
    func makeUIView(context: Context) -> BarChartView {
        //crate new chart
        let chart = BarChartView()
        //it is convenient to form chart data in a separate func
        chart.data = addData()
        return chart
    }

    // this func is required to conform to UIViewRepresentable protocol
    func updateUIView(_ uiView: BarChartView, context: Context) {
        //when data changes chartd.data update is required
        uiView.data = addData()
    }

    func addData() -> BarChartData{
        let data = BarChartData()
        //BarChartDataSet is an object that contains information about your data, styling and more
        let dataSet = BarChartDataSet(entries: entries)
        // change bars color to green
        dataSet.colors = [NSUIColor.green]
        //change data label
        dataSet.label = "My Data"
        data.append(dataSet)
        return data
    }

    typealias UIViewType = BarChartView
}

struct Bar_Previews: PreviewProvider {
    static var previews: some View {
        Bar(entries: [
            //x - position of a bar, y - height of a bar
            BarChartDataEntry(x: 1, y: 1),
            BarChartDataEntry(x: 2, y: 2),
            BarChartDataEntry(x: 3, y: 3),
            BarChartDataEntry(x: 4, y: 4),
            BarChartDataEntry(x: 5, y: 5)

        ])
    }
}

