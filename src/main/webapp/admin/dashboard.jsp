<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ taglib uri="jakarta.tags.fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="vi">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>Trang tổng quan - COZA Việt Nam</title>
  <meta content="Trang tổng quan hệ thống quản lý COZA Việt Nam" name="description">
  <meta content="thời trang, quản lý, báo cáo, doanh thu" name="keywords">

  <!-- Favicons -->
  <link href="images/icons/favicon.png" rel="icon">
  <link href="admin/assets/img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Google Fonts -->
  <link href="https://fonts.gstatic.com" rel="preconnect">
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

  <!-- Vendor CSS Files -->
  <link href="admin/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="admin/assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="admin/assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
  <link href="admin/assets/vendor/quill/quill.snow.css" rel="stylesheet">
  <link href="admin/assets/vendor/quill/quill.bubble.css" rel="stylesheet">
  <link href="admin/assets/vendor/remixicon/remixicon.css" rel="stylesheet">
  <link href="admin/assets/vendor/simple-datatables/style.css" rel="stylesheet">

  <!-- Template Main CSS File -->
  <link href="admin/assets/css/style.css?v1.4" rel="stylesheet">
</head>

<body>

	<c:import url="/admin-header" />
  <jsp:include page="sidebar.jsp"></jsp:include>

  <main id="main" class="main">

    <div class="pagetitle">
      <h1 class="pb-2">Tổng quan</h1>
      <nav>
        <ol class="breadcrumb">
          <li class="breadcrumb-item"><a href="dashboard">Trang chủ</a></li>
          <li class="breadcrumb-item active">Tổng quan</li>
        </ol>
      </nav>
    </div><!-- End Page Title -->

    <section class="section dashboard">
      <div class="row">

        <!-- Left side columns -->
        <div class="col-lg-12">
          <div class="row">

            <!-- Sales Card -->
            <div class="col-xxl-4 col-md-4">
              <div class="card info-card sales-card">
                <div class="card-body">
                  <h5 class="card-title">Đã bán</h5>

                  <div class="d-flex align-items-center">
                    <div class="card-icon rounded-circle d-flex align-items-center justify-content-center">
                      <i class="bi bi-cart"></i>
                    </div>
                    <div class="ps-3">
                      <h6>${report.totalQuantity}</h6>
                    </div>
                  </div>
                </div>

              </div>
            </div><!-- End Sales Card -->

            <!-- Revenue Card -->
            <div class="col-xxl-4 col-md-4">
              <div class="card info-card revenue-card">
                <div class="card-body">
                  <h5 class="card-title">Doanh thu</h5>

                  <div class="d-flex align-items-center">
                    <div class="card-icon rounded-circle d-flex align-items-center justify-content-center">
                      <i class="bi bi-currency-dollar"></i>
                    </div>
                    <div class="ps-3">
                      <h6><fmt:formatNumber value="${report.totalRevenue}" pattern="#,##0" />₫</h6>
                    </div>
                  </div>
                </div>

              </div>
            </div><!-- End Revenue Card -->

            <!-- Customers Card -->
            <div class="col-xxl-4 col-md-4">

              <div class="card info-card customers-card">
                <div class="card-body">
                  <h5 class="card-title">Khách hàng</h5>

                  <div class="d-flex align-items-center">
                    <div class="card-icon rounded-circle d-flex align-items-center justify-content-center">
                      <i class="bi bi-people"></i>
                    </div>
                    <div class="ps-3">
                      <h6>${customerCount}</h6>
                    </div>
                  </div>

                </div>
              </div>

            </div><!-- End Customers Card -->
            
        </div><!-- End Left side columns -->
	<div class="col-12">
  <div class="card">

    <div class="filter">
      <a class="icon" href="#" data-bs-toggle="dropdown"><i class="bi bi-three-dots"></i></a>
      <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow">
        <li class="dropdown-header text-start">
          <h6>Xuất file</h6>
        </li>
        <li><form action="export-excel" method="post">
			  <input type="hidden" name="type" value="Bao_Cao_Doanh_Thu" />
			  <button type="submit" class="dropdown-item">Excel</button>
			</form></li>
      </ul>
    </div>

    <div class="card-body">
      <h5 class="card-title">Doanh Thu Theo Ngày</h5>

      <!-- Line Chart -->
      <div id="reportsChart" style="min-height: 500px;"></div>
      <!-- End Line Chart -->

    </div>

  </div>
</div>

<!-- Script nên để ngoài thẻ div để chắc chắn ApexCharts vẽ đúng -->
<script>
  document.addEventListener("DOMContentLoaded", () => {
    new ApexCharts(document.querySelector("#reportsChart"), {
      series: [{
        name: 'Doanh thu (VNĐ)',
        data: [
          <c:forEach var="item" items="${data2}" varStatus="loop">
            ${item.revenue}<c:if test="${!loop.last}">,</c:if>
          </c:forEach>
        ],
        yAxisIndex: 0 // Trục trái
      }, {
        name: 'Đã bán',
        data: [
          <c:forEach var="item" items="${data2}" varStatus="loop">
            ${item.count}<c:if test="${!loop.last}">,</c:if>
          </c:forEach>
        ],
        yAxisIndex: 1 // Trục phải
      }],
      chart: {
        height: 350,
        type: 'area',
        toolbar: { show: false }
      },
      markers: { size: 4 },
      colors: ['#2eca6a', '#4154f1'], // Doanh thu xanh lá, đã bán xanh dương
      fill: {
        type: "gradient",
        gradient: {
          shadeIntensity: 1,
          opacityFrom: 0.3,
          opacityTo: 0.4,
          stops: [0, 90, 100]
        }
      },
      dataLabels: { enabled: false },
      stroke: { curve: 'smooth', width: 2 },
      xaxis: {
        type: 'datetime',
        categories: [
          <c:forEach var="item" items="${data2}" varStatus="loop">
            '${item.date}'<c:if test="${!loop.last}">,</c:if>
          </c:forEach>
        ]
      },
      tooltip: {
        x: {
          format: 'dd/MM/yyyy'
        },
        y: {
          formatter: function (val, opts) {
            if (opts.seriesIndex === 0) {
              return val.toLocaleString('en-US') + 'đ'; // Doanh thu
            } else {
              return val.toLocaleString('en-US'); // Đã bán
            }
          }
        }
      },
      yaxis: [{
        labels: {
          formatter: function (val) {
            return val.toLocaleString('en-US') + 'đ';
          }
        }
      }, {
        opposite: true,
        labels: {
          formatter: function (val) {
            return val.toLocaleString('en-US');
          }
        }
      }]
    }).render();
  });
</script>


            
			<div class="row">
            <div class="col-6">
          <div class="card">
          <div class="filter">
      <a class="icon" href="#" data-bs-toggle="dropdown"><i class="bi bi-three-dots"></i></a>
      <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow">
        <li class="dropdown-header text-start">
          <h6>Xuất file</h6>
        </li>
        <li><form action="export-excel" method="post">
			  <input type="hidden" name="type" value="Doanh_Thu_Theo_Tung_Muc" />
			  <button type="submit" class="dropdown-item">Excel</button>
			</form></li>
      </ul>
    </div>
            <div class="card-body">
              <h5 class="card-title">thống kê doanh thu theo danh mục</h5>

              <!-- Pie Chart -->
              <div id="pieChart" style="min-height: 400px; user-select: none; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); position: relative;" class="echart" _echarts_instance_="ec_1747576415312"><div style="position: relative; width: 444px; height: 400px; padding: 0px; margin: 0px; border-width: 0px; cursor: default;"><canvas data-zr-dom-id="zr_0" width="444" height="400" style="position: absolute; left: 0px; top: 0px; width: 444px; height: 400px; user-select: none; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 0px; margin: 0px; border-width: 0px;"></canvas></div><div class="" style="position: absolute; display: block; border-style: solid; white-space: nowrap; z-index: 9999999; box-shadow: rgba(0, 0, 0, 0.2) 1px 2px 10px; transition: opacity 0.2s cubic-bezier(0.23, 1, 0.32, 1), visibility 0.2s cubic-bezier(0.23, 1, 0.32, 1), transform 0.4s cubic-bezier(0.23, 1, 0.32, 1); background-color: rgb(255, 255, 255); border-width: 1px; border-radius: 4px; color: rgb(102, 102, 102); font: 14px / 21px &quot;Microsoft YaHei&quot;; padding: 10px; top: 0px; left: 0px; transform: translate3d(169px, 168px, 0px); border-color: rgb(84, 112, 198); pointer-events: none; visibility: hidden; opacity: 0;"><div style="margin: 0px 0 0;line-height:1;"><div style="font-size:14px;color:#666;font-weight:400;line-height:1;">Access From</div><div style="margin: 10px 0 0;line-height:1;"><div style="margin: 0px 0 0;line-height:1;"><span style="display:inline-block;margin-right:4px;border-radius:10px;width:10px;height:10px;background-color:#5470c6;"></span><span style="font-size:14px;color:#666;font-weight:400;margin-left:2px">Search Engine</span><span style="float:right;margin-left:20px;font-size:14px;color:#666;font-weight:900">1,048</span><div style="clear:both"></div></div><div style="clear:both"></div></div><div style="clear:both"></div></div></div></div>

              <script>
                document.addEventListener("DOMContentLoaded", () => {
                  echarts.init(document.querySelector("#pieChart")).setOption({
                    title: {
                      text: '',
                      subtext: '',
                      left: 'center'
                    },
                    tooltip: {
                      trigger: 'item'
                    },
                    legend: {
                      orient: 'vertical',
                      left: 'left'
                    },
                    series: [{
                      name: 'Doanh thu',
                      type: 'pie',
                      radius: '50%',
                      data: [
                    	  <c:forEach var="item" items="${data1}" varStatus="loop">
                      {value: ${item.revenue}, name: '${item.cname}'}<c:if test="${!loop.last}">,</c:if>
                      </c:forEach>
                      ],
                      emphasis: {
                        itemStyle: {
                          shadowBlur: 10,
                          shadowOffsetX: 0,
                          shadowColor: 'rgba(0, 0, 0, 0.5)'
                        }
                      }
                    }]
                  });
                });
              </script>
              <!-- End Pie Chart -->

            </div>
          </div>
        </div>
        
        <div class="col-6">
          <div class="card">
          <div class="filter">
      <a class="icon" href="#" data-bs-toggle="dropdown"><i class="bi bi-three-dots"></i></a>
      <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow">
        <li class="dropdown-header text-start">
          <h6>Xuất file</h6>
        </li>
        <li><form action="export-excel" method="post">
			  <input type="hidden" name="type" value="San_Pham_Ban_Ra" />
			  <button type="submit" class="dropdown-item">Excel</button>
			</form></li>
      </ul>
    </div>
            <div class="card-body">
              <h5 class="card-title">Sản phẩm đã bán</h5>

              <!-- Donut Chart -->
              <div id="donutChart" style="min-height: 400px; user-select: none; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); position: relative;" class="echart" _echarts_instance_="ec_1747577107907"><div style="position: relative; width: 444px; height: 400px; padding: 0px; margin: 0px; border-width: 0px; cursor: default;"><canvas data-zr-dom-id="zr_0" width="444" height="400" style="position: absolute; left: 0px; top: 0px; width: 444px; height: 400px; user-select: none; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 0px; margin: 0px; border-width: 0px;"></canvas></div><div class="" style="position: absolute; display: block; border-style: solid; white-space: nowrap; z-index: 9999999; box-shadow: rgba(0, 0, 0, 0.2) 1px 2px 10px; transition: opacity 0.2s cubic-bezier(0.23, 1, 0.32, 1), visibility 0.2s cubic-bezier(0.23, 1, 0.32, 1), transform 0.4s cubic-bezier(0.23, 1, 0.32, 1); background-color: rgb(255, 255, 255); border-width: 1px; border-radius: 4px; color: rgb(102, 102, 102); font: 14px / 21px &quot;Microsoft YaHei&quot;; padding: 10px; top: 0px; left: 0px; transform: translate3d(101px, 220px, 0px); border-color: rgb(250, 200, 88); pointer-events: none; visibility: hidden; opacity: 0;"><div style="margin: 0px 0 0;line-height:1;"><div style="font-size:14px;color:#666;font-weight:400;line-height:1;">Access From</div><div style="margin: 10px 0 0;line-height:1;"><div style="margin: 0px 0 0;line-height:1;"><span style="display:inline-block;margin-right:4px;border-radius:10px;width:10px;height:10px;background-color:#fac858;"></span><span style="font-size:14px;color:#666;font-weight:400;margin-left:2px">Email</span><span style="float:right;margin-left:20px;font-size:14px;color:#666;font-weight:900">580</span><div style="clear:both"></div></div><div style="clear:both"></div></div><div style="clear:both"></div></div></div></div>

              <script>
                document.addEventListener("DOMContentLoaded", () => {
                  echarts.init(document.querySelector("#donutChart")).setOption({
                    tooltip: {
                      trigger: 'item'
                    },
                    legend: {
                      top: '5%',
                      left: 'center'
                    },
                    series: [{
                      name: 'Sản phẩm',
                      type: 'pie',
                      radius: ['40%', '70%'],
                      avoidLabelOverlap: false,
                      label: {
                        show: false,
                        position: 'center'
                      },
                      emphasis: {
                        label: {
                          show: true,
                          fontSize: '18',
                          fontWeight: 'bold'
                        }
                      },
                      labelLine: {
                        show: false
                      },
                      data: [
                    	<c:forEach var="item" items="${data}" varStatus="loop">
                      {value: ${item.count}, name: '${item.cname}'}<c:if test="${!loop.last}">,</c:if>
                      </c:forEach>
                      ]
                    }]
                  });
                });
              </script>
              <!-- End Donut Chart -->

            </div>
          </div>
        </div>
        </div>
            
            <!-- Top Selling -->
            <div class="col-12">
              <div class="card top-selling overflow-auto">

                <div class="filter">
      <a class="icon" href="#" data-bs-toggle="dropdown"><i class="bi bi-three-dots"></i></a>
      <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow">
        <li class="dropdown-header text-start">
          <h6>Xuất file</h6>
        </li>
        <li><form action="export-excel" method="post">
			  <input type="hidden" name="type" value="" />
			  <button type="submit" class="dropdown-item">Excel</button>
			</form></li>
      </ul>
    </div>

                <div class="card-body pb-0">
                  <h5 class="card-title">Hàng bán chạy</h5>

                  <table class="table table-borderless">
                    <thead>
                      <tr>
                        <th class="col-1 text-center">Ảnh</th>
                        <th class="col-6 text-center">Sản phẩm</th>
                        <th class="col-2 text-center">Giá tiền</th>
                        <th class="col-1 text-center">Đã bán</th>
                        <th class="col-2 text-center">Doanh thu</th>
                      </tr>
                    </thead>
                    <tbody>
                     <c:forEach var="p" items="${bestSellers}">
                      <tr>
                        <th class="text-center" scope="row"><a href="detail?pid=${p.pid}"><img src="${p.img}" alt="${p.pname}"></a></th>
                        <td scope="row"><a href="detail?pid=${p.pid}" class="title-link ps-4">${p.pname}</a></td>
                        <td class="text-center" scope="row"><fmt:formatNumber value="${p.price}" pattern="#,##0" />₫</td>
                        <td class="text-center fw-bold" scope="row">${p.sold}</td>
                        <td class="text-center" scope="row"><fmt:formatNumber value="${p.revenue}" pattern="#,##0" />₫</td>
                      </tr>
                      </c:forEach>
                    </tbody>
                  </table>

                </div>

              </div>
            </div><!-- End Top Selling -->

            <!-- Recent Sales -->
            <div class="col-12">
              <div class="card recent-sales overflow-auto">

                <div class="filter">
                  <a class="icon" href="#" data-bs-toggle="dropdown"><i class="bi bi-three-dots"></i></a>
                  <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow">
                    <li class="dropdown-header text-start">
                      <h6>Filter</h6>
                    </li>

                    <li><a class="dropdown-item" href="#">Today</a></li>
                    <li><a class="dropdown-item" href="#">This Month</a></li>
                    <li><a class="dropdown-item" href="#">This Year</a></li>
                  </ul>
                </div>

                <div class="card-body">
                  <h5 class="card-title">Đơn hàng gần đây</h5>

                  <table class="table table-borderless">
                    <thead>
                      <tr>
                        <th class="col-2">Mã đơn</th>
                        <th class="col-3">Ngày</th>
                        <th class="col-3">Khách hàng</th>
                        <th class="col-3">Số tiển</th>
                        <th class="col-2 text-center">Trạng thái</th>
                      </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="item" items="${orders}">
                      <tr>
                        <td scope="row">DH-${item.orderid}</td>
                        <td scope="row"><fmt:formatDate value="${item.orderdate}" pattern="yyyy-MM-dd" /></td>
                        <td scope="row">${item.fullName}</td>
                        <td scope="row"><fmt:formatNumber value="${item.total}" pattern="#,##0" />₫</td>
                        <td class="text-center" scope="row"><span class="status">${item.status}</span></td>
                      </tr>
                      </c:forEach>
                    </tbody>
                  </table>
                </div>

              </div>
            </div><!-- End Recent Sales -->
		</div>
          </div>
    </section>

  </main><!-- End #main -->

  <!-- ======= Footer ======= -->
  <footer id="footer" class="footer">

  </footer><!-- End Footer -->

  <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>
	
  <!-- Vendor JS Files -->
  <script src="admin/assets/vendor/apexcharts/apexcharts.min.js"></script>
  <script src="admin/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="admin/assets/vendor/chart.js/chart.umd.js"></script>
  <script src="admin/assets/vendor/echarts/echarts.min.js"></script>
  <script src="admin/assets/vendor/quill/quill.js"></script>
  <script src="admin/assets/vendor/simple-datatables/simple-datatables.js"></script>
  <script src="admin/assets/vendor/tinymce/tinymce.min.js"></script>
  <script src="admin/assets/vendor/php-email-form/validate.js"></script>

  <!-- Template Main JS File -->
  <script src="admin/assets/js/main.js"></script>
	
	<script>
  document.querySelectorAll('.status').forEach(badge => {
    const text = badge.textContent.trim();
    
    if (text === 'Đang xử lý') {
      badge.classList.add('badge-light-warning');
    } else if (text === 'Đã xác nhận') {
      badge.classList.add('badge-light-success');
    } else if (text === 'Đã hủy') {
      badge.classList.add('badge-light-error');
    }
  });
</script>

</body>

</html>