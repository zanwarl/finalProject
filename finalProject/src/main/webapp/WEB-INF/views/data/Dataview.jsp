<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>


<style>

/* 
 * Project: Donut Chart
 * Description: JavaScript driven donut chart.
 * Version: 0.2.0
 * 
 * 2014 Kris Olszewski | http://www.kolszewski.com/
 *
 * Repo: https://github.com/KrisOlszewski/donut-chart
 */


/**
  * Demo scaffolding
  * --------------------------------------------------
  */
  
 img{
    width: 80%;
    height:80%; 
 } 
.table1
{
    position: relative;

    margin: 0;
   width: 100%;
    background: #434a54;

    text-rendering: optimizeSpeed;
    -webkit-font-smoothing: antialiased;
    -moz-osx-font-smoothing: grayscale;
}  
.table2{
   background-color: white;
   width: 100%;
   height: auto;
   border-color: black;
   text-align: center;
   
}
*,
*:before,
*:after
{
    -webkit-box-sizing: border-box;
       -moz-box-sizing: border-box;
            box-sizing: border-box;
}



.row
{
    display: block;

    width: 300px;
    margin: 50px auto;

    -webkit-animation: fadeIn .4s ease-in .4s both;
            animation: fadeIn .4s ease-in .4s both;
}
.row:before,
.row:after
{
    display: table;

    content: ' ';
}
.row:after
{
    clear: both;
}
@media only screen and (min-width: 600px)
{
    .row
    {
        width: 600px;
    }
}

.column
{
    float: left;

    width: 300px;
    padding: 25px;
}

@-webkit-keyframes fadeIn
{
    0%
    {
        opacity: 0;
    }

    100%
    {
        opacity: 1;
    }
}

@keyframes fadeIn
{
    0%
    {
        opacity: 0;
    }

    100%
    {
        opacity: 1;
    }
}
/**
  * Donut Chart
  * --------------------------------------------------
  */
.donut-chart
{
    font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif;

    position: relative;

    overflow: hidden;

    width: 250px;
    height: 250px;

    border-radius: 50%;
    background-color: #f5f7fa;
    -webkit-box-shadow: 0 0 0 6px rgba(0, 0, 0, .2);
            box-shadow: 0 0 0 6px rgba(0, 0, 0, .2);
}

.outer-circle,
.inner-circle
{
    position: absolute;

    border-radius: 50%;
}

.outer-circle
{
    top: 6%;
    right: 6%;
    bottom: 6%;
    left: 6%;

    background-color: #fff;
    -webkit-box-shadow: inset 0 0 0 6px rgba(0, 0, 0, .2);
            box-shadow: inset 0 0 0 6px rgba(0, 0, 0, .2);
}

.inner-circle
{
    top: 22%;
    right: 22%;
    bottom: 22%;
    left: 22%;

    background-color: #f5f7fa;
    -webkit-box-shadow: 0 0 0 6px rgba(0, 0, 0, .2);
            box-shadow: 0 0 0 6px rgba(0, 0, 0, .2);
}

.inner-circle-label,
.inner-circle-value
{
    position: absolute;
    top: 50%;
    left: 0;

    display: block;

    width: 100%;

    text-align: center;
}

.inner-circle-label
{
    font-size: 18px;
    line-height: 1;

    margin-top: -30px;

    color: #aab2bd;
}

.inner-circle-value
{
    font-size: 42px;
    font-weight: bold;
    line-height: 1;

    margin-top: -12px;

    color: #656d78;
}

.wedge-container,
.wedge,
.wedge-extension,
.wedge-label
{
    position: absolute;
    top: 0;
    left: 0;

    width: 100%;
    height: 100%;

    -webkit-transition: all .4s linear;
            transition: all .4s linear;

    border-radius: 50%;
}

.wedge,
.wedge-extension
{
    -webkit-box-shadow: inset 0 0 0 6px rgba(0, 0, 0, .2);
            box-shadow: inset 0 0 0 6px rgba(0, 0, 0, .2);
}

.wedge-value
{
    font-size: 14px;
    font-weight: bold;
    line-height: 20px;

    position: absolute;
    top: 5%;
    left: 50%;

    display: block;

    width: 30px;
    margin-left: -15px;

    text-align: center;
}

.wedge-extension
{
    z-index: 100;
}

.wedge
{
    z-index: 200;
}

.wedge-label
{
    z-index: 300;
}



</style>
</head>
<body>


<!-- 
 * Project: Donut Chart
 * Description: JavaScript driven donut chart.
 * Version: 0.2.0
 * 
 * 2014 Kris Olszewski | http://www.kolszewski.com/
 *
 * Repo: https://github.com/KrisOlszewski/donut-chart
-->


<table class="table1">
<tr>
<td><img src="img/sdata.png"></td>
<td>
<section class="row">


  <div class="column">
     
    <div class="donut-chart" data-donut-chart="1"></div><div font-color="#FFFFFF" align="center"><font color=white>연령</font></div>
  </div>
  <div class="column">
  
    <div class="donut-chart" data-donut-chart="2"></div><div align="center"><font color=white>금액(단위:만원)</font></div>
  </div>
</section>
<td>
<td><img src="img/mdata.png"></td>
</tr>
</table>

<section>
<div  id="contents">
   <table class="table2">
      
      
      
      
   <thead>
      <tr>
      
         <th>
      예약자
      </th>
      <th>숙소번호</th>
      <th>인원수</th>
      <th>예약날짜</th>
      <th>체크인</th>
      <th>체크아웃</th>
      <th>숙박요금</th>
      
      </tr>
   </thead> 
      
   
   <tbody>
      
      <c:if test="${empty listt }">
      
         <tr>
            <td>예약내역이 없습니다 </td>
         </tr>
      </c:if>
         <c:forEach var ="dto" items ="${listt }">
            <tr>
            <%-- 
               <td><c:out value="${dto.roomidx }"></c:out></td>
               <td><c:out value="${dto.roomname }"></c:out></td> --%>
            
            
               <td>${dto.userid}</td>
      <td>${dto.roomidx}</td>
      <td>${dto.count}</td>
      <td>${dto.reqDate}</td>
      <td>${dto.checkindate}</td>
      <td>${dto.checkoutdate}</td>
      <td>${dto.total_pay}</td> 
            
            

            </tr>
            
         </c:forEach>
      
   </tbody>   
      
   
   
   </table>
   </div>
</section>







<script>

/* 
 * Project: Donut Chart
 * Description: JavaScript driven donut chart.
 * Version: 0.2.0
 * 
 * 2014 Kris Olszewski | http://www.kolszewski.com/
 *
 * Repo: https://github.com/KrisOlszewski/donut-chart
 */

/**
  * Donut Chart
  * --------------------------------------------------
  */


;(function(window, document, undefined) {

  'use strict';

  var DonutChart = DonutChart || {

    /**
      * Initialize Chart
      */

    init: function(options) {

      this.settings(options);
      this.createChartStructre();
      this.setChartMeta();
      this.build();

    }, // init()

    /**
      * Update Chart
      */

    update: function(options) {

      this.settings(options);
      this.setChartMeta();
      this.build();

    }, // update()

    /**
      * Chart Settings
      */

    settings: function(options) {

      this.config = {
        container: options.container ? options.container : this.config.container,
        data: options.data ? options.data : this.config.data,
        label: options.label ? this.label : 'Total',
        offset: options.offset ? options.offset : 0
      };

    }, // settings()

    /**
      * Build chart
      */

    build: function() {

      var container = this.config.container.querySelector('.outer-circle');
      var wedges = container.querySelectorAll('[data-wedge-id]');
      var wedgesIdArray = [];

      for (var i = 0; i < wedges.length; i++) {
        wedgesIdArray.push(wedges[i].dataset.wedgeId);
      }

      for (var j = 0; j < this.config.data.wedges.length; j++) {
        if (wedgesIdArray.indexOf(this.config.data.wedges[j].id) == -1) {
          var wedge = this.createWedge(this.config.data.wedges[j]);
          container.appendChild(wedge);
        }
        this.setWedge(this.config.data.wedges[j]);
      }

    }, // createWedges()

    /**
      * Create chart structure
      */

    createChartStructre: function() {

      var outer = document.createElement('div');
      var inner = document.createElement('div');
      var label = document.createElement('span');
      var value = document.createElement('span');

      outer.className = 'outer-circle';
      inner.className = 'inner-circle';
      label.className = 'inner-circle-label';
      value.className = 'inner-circle-value';

      this.config.container.appendChild(outer);
      this.config.container.appendChild(inner);
      inner.appendChild(label);
      inner.appendChild(value);

    }, // createChartStructre()

    /**
      * Set chart meta
      */

    setChartMeta: function() {

      var label = this.config.container.querySelector('.inner-circle-label');
      var value = this.config.container.querySelector('.inner-circle-value');

      label.innerHTML = this.config.label;
      value.innerHTML = this.config.data.total;

    }, // setChartMeta()

    /**
      * Create wedge
      */

    createWedge: function(data) {

      var container = document.createElement('div');
      var wedge = document.createElement('div');
      var extension = document.createElement('div');
      var label = document.createElement('div');
      var value = document.createElement('span');

      container.setAttribute('data-wedge-id', data.id);

      container.className = 'wedge-container';
      wedge.className = 'wedge';
      extension.className = 'wedge-extension';
      label.className = 'wedge-label';
      value.className = 'wedge-value';

      container.appendChild(wedge);
      container.appendChild(extension);
      container.appendChild(label);
      label.appendChild(value);

      return container;

    }, // createWedge()

    /**
      * Set wedge
      */

    setWedge: function(data) {

      var container = this.config.container.querySelector('[data-wedge-id="' + data.id + '"]');
      var wedge = container.querySelector('.wedge');
      var extension = container.querySelector('.wedge-extension');
      var label = container.querySelector('.wedge-label');
      var value = container.querySelector('.wedge-value');

      var wedgeDegrees = (360 * data.value) / this.config.data.total;
      var labelDegrees = wedgeDegrees / 2;
      var w = container.offsetWidth;

      container.style.transform = 'rotate(' + this.config.offset + 'deg)';
      container.style.webkitTransform = 'rotate(' + this.config.offset + 'deg)';
      container.style.clip = wedgeDegrees > 180 ? 'auto' : 'rect(0, ' + w + 'px, ' + w +'px, ' + (w / 2) + 'px)';

      wedge.style.transform = 'rotate(' + wedgeDegrees + 'deg)';
      wedge.style.webkitTransform = 'rotate(' + wedgeDegrees + 'deg)';
      wedge.style.backgroundColor = this.color(data.color, 5);
      wedge.style.clip = 'rect(0, ' + (w / 2) + 'px, ' + w +'px, 0)';

      if (wedgeDegrees > 180) {
        extension.style.opacity = 1;
        extension.style.transform = 'rotate(' + 180 + 'deg)';
        extension.style.webkitTransform = 'rotate(' + 180 + 'deg)';
        extension.style.backgroundColor = this.color(data.color, 5);
        extension.style.clip = 'rect(0, ' + (w / 2) + 'px, ' + w +'px, 0)';
      } else {
        extension.style.opacity = 0;
      }

      label.style.transform = 'rotate(' + labelDegrees + 'deg)';
      label.style.webkitTransform = 'rotate(' + labelDegrees + 'deg)';
      label.style.color = this.color(data.color, -30);

      value.innerHTML = data.value;

      this.config.offset += wedgeDegrees;

    }, // setWedge()

    /**
      * Color Utility
      */

    color: function( color, percent ) {

      var num = parseInt(color.slice(1), 16);
      var amt = Math.round(2.55 * percent);
      var R = (num >> 16) + amt;
      var B = (num >> 8 & 0x00FF) + amt;
      var G = (num & 0x0000FF) + amt;

      return "#" + (0x1000000 + (R < 255 ? R < 1 ? 0 : R : 255) * 0x10000 + (B < 255 ? B < 1 ? 0 : B : 255) * 0x100 + (G < 255 ? G < 1 ? 0 : G : 255)).toString(16).slice(1);

    } // color()

  }; // DonutChart

  window.DonutChart = DonutChart;

})(window, document);


/**
  * Demo
  * --------------------------------------------------
  */

// Object.create() polyfill
if (typeof Object.create !== 'function') {
  Object.create = function(obj) {
    function F() {}
    F.prototype = obj;
    return new F();
  };
}

// Select containers
var chartContainer1 = document.querySelector('[data-donut-chart="1"]');
var chartContainer2 = document.querySelector('[data-donut-chart="2"]');

// Data




// 남자꺼
var chartData1a = {
  total:  ${map.mantotal},
  wedges: [
    { id: 'a', color: '#006600', value: ${map.man0} },
    { id: 'b', color: '#00cc66', value: ${map.man1} },
    { id: 'c', color: '#00ffff', value: ${map.man2} },
    { id: 'd', color: '#66ffff', value: ${map.man3} }
  ]
};


//여자꺼
var chartData1b = {
  total: Number(${map.womantotal}),
  wedges: [
    { id: 'a', color: '#cc0000', value:${map.woman0} },
    { id: 'b', color: '#ff0000', value: ${map.woman1} },
    { id: 'c', color: '#ff6600', value: ${map.woman2} },
    { id: 'd', color: '#ffff00', value: ${map.woman3} }
  ]
};
//월별매출
var chartData2a = {
  total: ${map.monthtotal} ,
  wedges: [
    { id: 'a', color: '#4FC1E9', value: ${map.month1} },
    { id: 'b', color: '#cc9900', value:  ${map.month2} },
    { id: 'c', color: '#cc3300', value:  ${map.month3} },
    { id: 'd', color: '#993300', value:  ${map.month4} },
    { id: 'e', color: '#999900', value:  ${map.month5} },
    { id: 'f', color: '#99ff00', value:  ${map.month6} },
    { id: 'g', color: '#00ff00', value:  ${map.month7} },
    { id: 'h', color: '#00cc00', value:  ${map.month8} },
    { id: 'i', color: '#003300', value:  ${map.month9} },
    { id: 'j', color: '#00ccff', value:  ${map.month10} },
    { id: 'k', color: '#333300', value:  ${map.month11} },
    { id: 'l', color: '#ccffff', value:  ${map.month12} },
  ]
};




// Create new chart objects
var Chart1 = Object.create(DonutChart);
var Chart2 = Object.create(DonutChart);

Chart1.init({
  container: chartContainer1,
  data: chartData1a
});

Chart2.init({
  container: chartContainer2,
  data: chartData2a
});

setTimeout(function() {
  setInterval(function() {
   
    Chart1.update({
      data: chartData1a
    });

    Chart2.update({
      data: chartData2a
    });

  }, 4000);
}, 2000);

setInterval(function() {

  Chart1.update({
    data: chartData1b
  });

  Chart2.update({
    data: chartData2b
  });

}, 4000);





</script>

</body>


</html>