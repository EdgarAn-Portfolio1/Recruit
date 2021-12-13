<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>지역별 취업공고</title>
<jsp:include page="/WEB-INF/views/modules/common-css.jsp" />

</head>
<body>
	<jsp:include page="/WEB-INF/views/modules/topbar.jsp" />
	<jsp:include page="/WEB-INF/views/modules/sidebar.jsp" />
	 <div class="content-body">
		<div class="container-fluid">
			<div class="row">
                
                <div class="col-lg-12">
                        <div class="card">
                            <div class="card-body"><div class="chartjs-size-monitor" style="position: absolute; inset: 0px; overflow: hidden; pointer-events: none; visibility: hidden; z-index: -1;"><div class="chartjs-size-monitor-expand" style="position:absolute;left:0;top:0;right:0;bottom:0;overflow:hidden;pointer-events:none;visibility:hidden;z-index:-1;"><div style="position:absolute;width:1000000px;height:1000000px;left:0;top:0"></div></div><div class="chartjs-size-monitor-shrink" style="position:absolute;left:0;top:0;right:0;bottom:0;overflow:hidden;pointer-events:none;visibility:hidden;z-index:-1;"><div style="position:absolute;width:200%;height:200%;left:0; top:0"></div></div></div>
                                <h4 class="card-title">전국 시도 및 해외 채용공고 갯수 현황</h4>
                                <canvas id="workplace-chart" width="671" height="201" style="display: block; height: 161px; width: 537px;" class="chartjs-render-monitor"></canvas>
                            </div>
                        </div>
                    </div>
                    
                <div class="col-lg-12">
                        <div class="card">
                            <div class="card-body"><div class="chartjs-size-monitor" style="position: absolute; inset: 0px; overflow: hidden; pointer-events: none; visibility: hidden; z-index: -1;"><div class="chartjs-size-monitor-expand" style="position:absolute;left:0;top:0;right:0;bottom:0;overflow:hidden;pointer-events:none;visibility:hidden;z-index:-1;"><div style="position:absolute;width:1000000px;height:1000000px;left:0;top:0"></div></div><div class="chartjs-size-monitor-shrink" style="position:absolute;left:0;top:0;right:0;bottom:0;overflow:hidden;pointer-events:none;visibility:hidden;z-index:-1;"><div style="position:absolute;width:200%;height:200%;left:0; top:0"></div></div></div>
                                <h4 class="card-title">학력별 채용공고 갯수 현황</h4>
                                <canvas id="degree-chart" width="671" height="201" style="display: block; height: 161px; width: 537px;" class="chartjs-render-monitor"></canvas>
                            </div>
                        </div>
                    </div>
                
                <div class="col-lg-12">
                        <div class="card">
                            <div class="card-body"><div class="chartjs-size-monitor" style="position: absolute; inset: 0px; overflow: hidden; pointer-events: none; visibility: hidden; z-index: -1;"><div class="chartjs-size-monitor-expand" style="position:absolute;left:0;top:0;right:0;bottom:0;overflow:hidden;pointer-events:none;visibility:hidden;z-index:-1;"><div style="position:absolute;width:1000000px;height:1000000px;left:0;top:0"></div></div><div class="chartjs-size-monitor-shrink" style="position:absolute;left:0;top:0;right:0;bottom:0;overflow:hidden;pointer-events:none;visibility:hidden;z-index:-1;"><div style="position:absolute;width:200%;height:200%;left:0; top:0"></div></div></div>
                                <h4 class="card-title">고용형태별 채용공고 갯수 현황</h4>
                                <canvas id="work-type-chart" width="671" height="201" style="display: block; height: 161px; width: 537px;" class="chartjs-render-monitor"></canvas>
                            </div>
                        </div>
                    </div>

				<div class="col-lg-12">
                        <div class="card">
                            <div class="card-body"><div class="chartjs-size-monitor" style="position: absolute; inset: 0px; overflow: hidden; pointer-events: none; visibility: hidden; z-index: -1;"><div class="chartjs-size-monitor-expand" style="position:absolute;left:0;top:0;right:0;bottom:0;overflow:hidden;pointer-events:none;visibility:hidden;z-index:-1;"><div style="position:absolute;width:1000000px;height:1000000px;left:0;top:0"></div></div><div class="chartjs-size-monitor-shrink" style="position:absolute;left:0;top:0;right:0;bottom:0;overflow:hidden;pointer-events:none;visibility:hidden;z-index:-1;"><div style="position:absolute;width:200%;height:200%;left:0; top:0"></div></div></div>
                                <h4 class="card-title">2005 ~ 2018년직업별 연봉 TOP 10</h4>
                                <canvas id="income-comparison-chart" width="671" height="201" style="display: block; height: 161px; width: 537px;" class="chartjs-render-monitor"></canvas>
                            </div>
                        </div>
                    </div>       
                    
                    
            </div> <!-- /# row -->
		</div><!-- #/ container -->
		
           
           
            
       </div>
   
	<jsp:include page="/WEB-INF/views/modules/common-js.jsp" />
	<script type = "text/javascript">
	
	$(function(){
		
	
		
	
		
		// single bar chart
	    var one = $('#workplace-chart');
	    var workplace = []; //근무지
	    var workplaceCount = []; //카운트
	   
	    <c:forEach var = "recruitCountByWorkplace" items="${ recruitCountByWorkplace }">
	    	workplace.push('${ recruitCountByWorkplace.work_place }');
	    	workplaceCount.push (${ recruitCountByWorkplace.cnt } );
	    </c:forEach>
	    console.log(workplace)
	    var workplaceChart = new Chart(one, {
	        type: 'bar',
	        data: { // 차트에 들어갈 데이터
	            labels: workplace,
	            datasets: [
	                {
	                    label: "근무지역별 채용 공고",
	                    data: workplaceCount,
	                    borderColor: "rgba(117, 113, 249, 0.9)",
	                    borderWidth: "0",
	                    backgroundColor: "rgba(117, 113, 249, 0.5)"
	                }
	            ]
	        },
	        options: {
	            scales: {
	                yAxes: [{
	                    ticks: {
	                        beginAtZero: true
	                    }
	                }]
	            }
	        }
	    });

		

	
	// single bar chart
    var two = $('#degree-chart');
    var degree = []; //근무지
    var degreeCount = []; //카운트
   
    <c:forEach var = "degree" items="${ degree }">
    console.log(degree)
    	degree.push('${ degree.degree }');
    	degreeCount.push ( '${ degree.cnt }' );
    </c:forEach>
    
    var degreeChart = new Chart(two, {
        type: 'bar',
        data: { // 차트에 들어갈 데이터
            labels: degree,
            datasets: [
                {
                    label: "학력별 채용 공고",
                    data: degreeCount,
                    borderColor: "rgba(117, 113, 249, 0.9)",
                    borderWidth: "0",
                    backgroundColor: "rgba(117, 113, 249, 0.5)"
                }
            ]
        },
        options: {
            scales: {
                yAxes: [{
                    ticks: {
                        beginAtZero: true
                    }
                }]
            }
        }
    });
    
    
 // single bar chart
    var three = $('#work-type-chart');
    var worktype = []; //고용형태
    var worktypeCount = []; //카운트
   
    <c:forEach var = "recruitCountByWorkType" items="${ recruitCountByWorkType }">
    console.log(worktype)
    	worktype.push('${ recruitCountByWorkType.work_type }');
    	worktypeCount.push ( ${ recruitCountByWorkType.cnt } );
    </c:forEach>
    
    var worktypeChart = new Chart(three, {
        type: 'bar',
        data: { // 차트에 들어갈 데이터
            labels: worktype,
            datasets: [
                {
                    label: "고용형태별 채용 공고",
                    data: worktypeCount,
                    borderColor: "rgba(117, 113, 249, 0.9)",
                    borderWidth: "0",
                    backgroundColor: "rgba(117, 113, 249, 0.5)"
                }
            ]
        },
        options: {
            scales: {
                yAxes: [{
                    ticks: {
                        beginAtZero: true
                    }
                }]
            }
        }
    });
    
    
 // single bar chart
    var four = $('#income-comparison-chart');
    var job_title = []; //고용형태
    var income = []; //카운트
   
    <c:forEach var = "incomeComparison" items="${ incomeComparison }">
    console.log(job_title)
    	job_title.push('${ incomeComparison.job_title }');
    	income.push ( ${ incomeComparison.income } );
    </c:forEach>
    
    var incomeComparisonChart = new Chart(four, {
        type: 'bar',
        data: { // 차트에 들어갈 데이터
            labels: job_title,
            datasets: [
                {
                    label: "2005 ~ 2018 직업별 연봉 TOP 10",
                    data: income,
                    borderColor: "rgba(117, 113, 249, 0.9)",
                    borderWidth: "0",
                    backgroundColor: ["rgba(117, 113, 249, 0.5)","rgba(117, 113, 249, 0.5)","rgba(117, 113, 249, 0.5)","rgba(255, 0, 0, 0.5)","rgba(117, 113, 249, 0.5)","rgba(117, 113, 249, 0.5)","rgba(117, 113, 249, 0.5)","rgba(255, 0, 0, 0.5)","rgba(117, 113, 249, 0.5)","rgba(117, 113, 249, 0.5)"]
                }
            ]
        },
        options: {
            scales: {
                yAxes: [{
                    ticks: {
                        beginAtZero: true
                    }
                }]
            }
        }
    });
    
    
    

}); // function 
	
	
	
	
	
	</script>
</body>
</html>