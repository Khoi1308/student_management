import { Controller } from "@hotwired/stimulus";
import "chartkick/chart.js";
// import Chartkick from "chartkick";
// import Chart from "chart.js";
//
// Chartkick.addAdapter(Chart);

// Connects to data-controller="chart"
export default class extends Controller {
  static values = { data: Object };

  connect() {
    console.log(this.dataValue);
    this.createChart();
  }

  createChart() {
    const chartData = this.dataValue;

    new Chartkick.ColumnChart(this.element, chartData, {
      colors: ["#FF5733", "#33FF57", "#3357FF", "#FF33A1"], // 4 colors
      animation: {
        duration: 1500, // Animation duration in milliseconds
        easing: "easeInOutQuad", // Easing function for animation
      },
      xtitle: "Score Ranges",
      ytitle: "Number of Students",
      labels: true,
    });
  }
}
