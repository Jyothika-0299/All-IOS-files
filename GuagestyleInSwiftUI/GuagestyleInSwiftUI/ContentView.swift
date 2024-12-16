//
//  ContentView.swift
//  GuagestyleInSwiftUI
//
//  Created by FCI on 06/12/24.
//

import SwiftUI

/// Gauge
/// A view that shows a value within a range
///
/// /// .gaugeStyle(_:)
/// Sets the style for gauges within this view.
///
/// https://developer.apple.com/documentation/swiftui/view/gaugestyle(_:)

struct ContentView: View {
    
    // simple Guage
    
    @State private var batteryLevel = 0.8
    
    // Labeled Guage
    @State private var current = 60.0
    @State private var minValue = 0.0
    @State private var maxValue = 100.0
    
    // Circular Guage
    let gradient = Gradient(
        colors: [.red, .orange, .yellow, .green, .blue, .indigo, .purple]
    )
    
    var body: some View {
        
        Gauge(value: batteryLevel) {
            Text("Battery Level")
        }
        
        // Labeled Guage
        
        Gauge(value: current, in: minValue...maxValue) {
            Text("Volume")
        } currentValueLabel: {
            Text("\(Int(current))")
        } minimumValueLabel: {
            Text("\(Int(minValue))")
        } maximumValueLabel: {
            Text("\(Int(maxValue))")
        }
        
        // circular guage
        VStack {
            HStack {
                circularGauge
                circularGaugeColorful
                circularGaugeColorfulTintGradient
            }
            HStack {
                circularCapacityGauge
                circularCapacityGaugeColorful
                circularCapacityGaugeColorfulTintGradient
            }
       
    }
}
    
    @ViewBuilder
    private var circularGauge: some View {
        Gauge(value: current, in: minValue...maxValue) {
            Text("Volume")
        } currentValueLabel: {
            Text("\(Int(current))")
        } minimumValueLabel: {
            Text("\(Int(minValue))")
        } maximumValueLabel: {
            Text("\(Int(maxValue))")
        }
        .gaugeStyle(.accessoryCircular)
    }
    
    @ViewBuilder
    private var circularGaugeColorful: some View {
        Gauge(value: current, in: minValue...maxValue) {
            Image(systemName: "heart.fill")
                .foregroundStyle(.red)
        } currentValueLabel: {
            Text("\(Int(current))")
                .foregroundStyle(.green)
        } minimumValueLabel: {
            Text("\(Int(minValue))")
                .foregroundStyle(.green)
        } maximumValueLabel: {
            Text("\(Int(maxValue))")
                .foregroundStyle(.red)
        }
        .gaugeStyle(.accessoryCircular)
    }
    
    @ViewBuilder
    private var circularGaugeColorfulTintGradient: some View {
        Gauge(value: current, in: minValue...maxValue) {
            Image(systemName: "heart.fill")
                .foregroundStyle(.red)
        } currentValueLabel: {
            Text("\(Int(current))")
                .foregroundStyle(.green)
        } minimumValueLabel: {
            Text("\(Int(minValue))")
                .foregroundStyle(.green)
        } maximumValueLabel: {
            Text("\(Int(maxValue))")
                .foregroundStyle(.red)
        }
        .gaugeStyle(.accessoryCircular)
        .tint(gradient)
    }
    
    @ViewBuilder
    private var circularCapacityGauge: some View {
        Gauge(value: current, in: minValue...maxValue) {
            Text("Volume")
        } currentValueLabel: {
            Text("\(Int(current))")
        } minimumValueLabel: {
            Text("\(Int(minValue))")
        } maximumValueLabel: {
            Text("\(Int(maxValue))")
        }
        .gaugeStyle(.accessoryCircularCapacity)
    }
    
    @ViewBuilder
    private var circularCapacityGaugeColorful: some View {
        Gauge(value: current, in: minValue...maxValue) {
            Image(systemName: "heart.fill")
                .foregroundStyle(.red)
        } currentValueLabel: {
            Text("\(Int(current))")
                .foregroundStyle(.green)
        } minimumValueLabel: {
            Text("\(Int(minValue))")
                .foregroundStyle(.green)
        } maximumValueLabel: {
            Text("\(Int(maxValue))")
                .foregroundStyle(.red)
        }
        .gaugeStyle(.accessoryCircularCapacity)
    }

    @ViewBuilder
    private var circularCapacityGaugeColorfulTintGradient: some View {
        Gauge(value: current, in: minValue...maxValue) {
            Image(systemName: "heart.fill")
                .foregroundStyle(.red)
        } currentValueLabel: {
            Text("\(Int(current))")
                .foregroundStyle(.green)
        } minimumValueLabel: {
            Text("\(Int(minValue))")
                .foregroundStyle(.green)
        } maximumValueLabel: {
            Text("\(Int(maxValue))")
                .foregroundStyle(.red)
        }
        .gaugeStyle(.accessoryCircularCapacity)
        .tint(gradient)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
