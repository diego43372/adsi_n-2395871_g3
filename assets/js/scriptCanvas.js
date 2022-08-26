window.onload = ejemplo1();
window.onload = ejemplo2();
window.onload = ejemplo3();

function ejemplo1(){
	var chart1 = new CanvasJS.Chart("example1", {
		exportEnabled: true,
		animationEnabled: true,
		title:{
			text: "State Operating Funds"
		},
		legend:{
			cursor: "pointer",
			itemclick: explodePie
		},
		data: [{
			type: "pie",
			showInLegend: true,
			toolTipContent: "{name}: <strong>{y}%</strong>",
			indexLabel: "{name} - {y}%",
			dataPoints: [
			{ y: 26, name: "School Aid", exploded: true },
			{ y: 20, name: "Medical Aid" },
			{ y: 5, name: "Debt/Capital" },
			{ y: 3, name: "Elected Officials" },
			{ y: 7, name: "University" },
			{ y: 17, name: "Executive" },
			{ y: 22, name: "Other Local Assistance"}
			]
		}]
	});
	chart1.render();
	function explodePie (e) {
		if(typeof (e.dataSeries.dataPoints[e.dataPointIndex].exploded) === "undefined" || !e.dataSeries.dataPoints[e.dataPointIndex].exploded) {
			e.dataSeries.dataPoints[e.dataPointIndex].exploded = true;
		} else {
			e.dataSeries.dataPoints[e.dataPointIndex].exploded = false;
		}
		e.chart1.render();
	}
}
function ejemplo2(){
	var chart2 = new CanvasJS.Chart("example2", {
		exportEnabled: true,
		animationEnabled: true,
		theme: "light2", // "light1", "light2", "dark1", "dark2"
		title:{
			text: "Top Oil Reserves"
		},
		axisY: {
			title: "Reserves(MMbbl)"
		},
		data: [{        
			type: "column",  
			showInLegend: true, 
			legendMarkerColor: "grey",
			legendText: "MMbbl = one million barrels",
			dataPoints: [      
			{ y: 300878, label: "Venezuela" },
			{ y: 266455,  label: "Saudi" },
			{ y: 169709,  label: "Canada" },
			{ y: 158400,  label: "Iran" },
			{ y: 142503,  label: "Iraq" },
			{ y: 101500, label: "Kuwait" },
			{ y: 97800,  label: "UAE" },
			{ y: 80000,  label: "Russia" }
			]
		}]
	});
	chart2.render();
}
function ejemplo3(){
	var dataPoints1 = [];
	var dataPoints2 = [];

	var chart = new CanvasJS.Chart("example3", {
		exportEnabled: true,
		zoomEnabled: true,
		title: {
			text: "Share Value of Two Companies"
		},
		axisX: {
			title: "chart updates every 3 secs"
		},
		axisY:{
			prefix: "$"
		}, 
		toolTip: {
			shared: true
		},
		legend: {
			cursor:"pointer",
			verticalAlign: "top",
			fontSize: 22,
			fontColor: "dimGrey",
			itemclick : toggleDataSeries
		},
		data: [{ 
			type: "line",
			xValueType: "dateTime",
			yValueFormatString: "$####.00",
			xValueFormatString: "hh:mm:ss TT",
			showInLegend: true,
			name: "Company A",
			dataPoints: dataPoints1
			},
			{				
				type: "line",
				xValueType: "dateTime",
				yValueFormatString: "$####.00",
				showInLegend: true,
				name: "Company B" ,
				dataPoints: dataPoints2
		}]
	});

	function toggleDataSeries(e) {
		if (typeof(e.dataSeries.visible) === "undefined" || e.dataSeries.visible) {
			e.dataSeries.visible = false;
		}
		else {
			e.dataSeries.visible = true;
		}
		chart.render();
	}

	var updateInterval = 3000;
	// initial value
	var yValue1 = 600; 
	var yValue2 = 605;

	var time = new Date;
	// starting at 9.30 am
	time.setHours(9);
	time.setMinutes(30);
	time.setSeconds(00);
	time.setMilliseconds(00);

	function updateChart(count) {
		count = count || 1;
		var deltaY1, deltaY2;
		for (var i = 0; i < count; i++) {
			time.setTime(time.getTime()+ updateInterval);
			deltaY1 = .5 + Math.random() *(-.5-.5);
			deltaY2 = .5 + Math.random() *(-.5-.5);

		// adding random value and rounding it to two digits. 
		yValue1 = Math.round((yValue1 + deltaY1)*100)/100;
		yValue2 = Math.round((yValue2 + deltaY2)*100)/100;

		// pushing the new values
		dataPoints1.push({
			x: time.getTime(),
			y: yValue1
		});
		dataPoints2.push({
			x: time.getTime(),
			y: yValue2
		});
		}

		// updating legend text with  updated with y Value 
		chart.options.data[0].legendText = " Company A  $" + yValue1;
		chart.options.data[1].legendText = " Company B  $" + yValue2; 
		chart.render();
	}
	// generates first set of dataPoints 
	updateChart(100);	
	setInterval(function(){updateChart()}, updateInterval);
}