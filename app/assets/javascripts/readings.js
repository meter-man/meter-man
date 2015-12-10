(function(){
var create_line_plot = function() {
  var margin = {top: 20, right: 20, bottom: 30, left: 50},
      width = 480 - margin.left - margin.right,
      height = 300 - margin.top - margin.bottom;

  var parseDate = d3.time.format("%Y-%m-%d").parse;

  var x = d3.time.scale()
      .range([0, width]);

  var y = d3.scale.linear()
      .range([height, 0]);

  var xAxis = d3.svg.axis()
      .ticks(d3.time.months, 1)
      .tickFormat(d3.time.format("%b"))
      .scale(x)
      .orient("bottom");

  var yAxis = d3.svg.axis()
      .scale(y)
      .orient("left");

  var line = d3.svg.line()
      .x(function(d) { return x(d.reading_date); })
      .y(function(d) { return y(d.reading); });

  var svg = d3.select("#line-plot")
      .attr("width", width + margin.left + margin.right)
      .attr("height", height + margin.top + margin.bottom)
    .append("g")
      .attr("transform", "translate(" + margin.left + "," + margin.top + ")");

  d3.json("readings/data.json", function(error, data) {
    if (error) throw error;

    data.forEach(function(d) {
      d.reading_date = parseDate(d.reading_date);
      d.reading = +d.reading;
    });

    x.domain(d3.extent(data, function(d) { return d.reading_date; }));
    y.domain(d3.extent(data, function(d) { return d.reading; }));

    svg.append("g")
        .attr("class", "x axis")
        .attr("transform", "translate(0," + height + ")")
        .call(xAxis);

    svg.append("g")
        .attr("class", "y axis")
        .call(yAxis)
      .append("text")
        .attr("transform", "rotate(-90)")
        .attr("y", 6)
        .attr("dy", ".71em")
        .style("text-anchor", "end")
        .text("Usage (kWh)");

    svg.append("path")
        .datum(data)
        .attr("class", "line")
        .attr("d", line);
  });
}

$(document).ready(create_line_plot);
$(document).on('page:load', create_line_plot)
})();
