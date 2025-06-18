<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!--===============================================================================================-->	
	<script src="vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/animsition/js/animsition.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/bootstrap/js/popper.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/select2/select2.min.js"></script>
	<script>
		$(".js-select2").each(function(){
			$(this).select2({
				minimumResultsForSearch: 20,
				dropdownParent: $(this).next('.dropDownSelect2')
			});
		})
	</script>
<!--===============================================================================================-->
	<script src="vendor/daterangepicker/moment.min.js"></script>
	<script src="vendor/daterangepicker/daterangepicker.js"></script>
<!--===============================================================================================-->
	<script src="vendor/slick/slick.min.js"></script>
	<script src="js/slick-custom.js"></script>
<!--===============================================================================================-->
	<script src="vendor/parallax100/parallax100.js"></script>
	<script>
        $('.parallax100').parallax100();
	</script>
<!--===============================================================================================-->
	<script src="vendor/MagnificPopup/jquery.magnific-popup.min.js"></script>
	<script>
		$('.gallery-lb').each(function() { // the containers for all your galleries
			$(this).magnificPopup({
		        delegate: 'a', // the selector for gallery item
		        type: 'image',
		        gallery: {
		        	enabled:true
		        },
		        mainClass: 'mfp-fade'
		    });
		});
	</script>
<!--===============================================================================================-->
	<script src="vendor/isotope/isotope.pkgd.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/sweetalert/sweetalert.min.js"></script>
	<script>
		$('.js-addwish-b2').on('click', function(e){
			e.preventDefault();
		});

		$('.js-addwish-b2').each(function(){
			var nameProduct = $(this).parent().parent().find('.js-name-b2').html();
			$(this).on('click', function(){
				swal(nameProduct, "is added to wishlist !", "success");

				$(this).addClass('js-addedwish-b2');
				$(this).off('click');
			});
		});

		$('.js-addwish-detail').each(function(){
			var nameProduct = $(this).parent().parent().parent().find('.js-name-detail').html();

			$(this).on('click', function(){
				swal(nameProduct, "is added to wishlist !", "success");

				$(this).addClass('js-addedwish-detail');
				$(this).off('click');
			});
		});

		/*---------------------------------------------*/

		$('.js-addcart-detail').each(function(){
			var nameProduct = $(this).parent().parent().parent().parent().find('.js-name-detail').html();
			$(this).on('click', function(){
				swal(nameProduct, "is added to cart !", "success");
			});
		});
	
	</script>
<!--===============================================================================================-->
	<script src="vendor/perfect-scrollbar/perfect-scrollbar.min.js"></script>
	<script>
		$('.js-pscroll').each(function(){
			$(this).css('position','relative');
			$(this).css('overflow','hidden');
			var ps = new PerfectScrollbar(this, {
				wheelSpeed: 1,
				scrollingThreshold: 1000,
				wheelPropagation: false,
			});

			$(window).on('resize', function(){
				ps.update();
			})
		});
	</script>

	<!-- Slick Carousel JS -->
<script src="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
<script>
    $(document).ready(function(){
        $('.slider-topbar-text').slick({
            vertical: true,
            autoplay: true,
            autoplaySpeed: 3000,
            arrows: false,
            dots: false,
            infinite: true,
            pauseOnHover: true
        });
    });
</script>
<!--===============================================================================================-->
<script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>
<script>
	// Slider cho class .swiper (nếu có)
const swiperOne = new Swiper('.swiper', {
  loop: true,
  navigation: {
    nextEl: '.swiper-button-next',
    prevEl: '.swiper-button-prev'
  },
  pagination: false,
  autoplay: {
    delay: 2000, // Thời gian chờ giữa các slide (ms)
    disableOnInteraction: false // Tiếp tục autoplay sau khi tương tác
  }
});


</script>

<script>
	document.addEventListener('DOMContentLoaded', function() {
		var productSwiper = new Swiper('.item-collector .wrapper-content-collector .collection-list .swiper-container', {
			slidesPerView: 'auto',
        freeMode: true,
        loop: true,
        spaceBetween: 0, // Đặt thành 0 vì đã dùng margin-right cho slide
        slidesOffsetBefore: 0,
        slidesOffsetAfter: 0,
			navigation: {
				nextEl: '.item-collector .wrapper-content-collector .collection-list .swiper-button-next',
				prevEl: '.item-collector .wrapper-content-collector .collection-list .swiper-button-prev',
			},
			breakpoints: {
				768: {
					spaceBetween: 20
				},
				992: {
					spaceBetween: 15
				}
			}
		});
	});
	</script>
	
	<script>
	document.addEventListener("DOMContentLoaded", function() {
		  const profileDropdown = document.getElementById("profileDropdown");
		  const dropdownMenu = document.getElementById("dropdownMenu");
		  
		  profileDropdown.addEventListener("click", function(event) {
		    event.preventDefault();
		    dropdownMenu.style.display = dropdownMenu.style.display === "none" ? "block" : "none";
		  });
		  
		  document.addEventListener("click", function(event) {
		    if (!profileDropdown.contains(event.target) && !dropdownMenu.contains(event.target)) {
		      dropdownMenu.style.display = "none";
		    }
		  });
		});
	</script>
	

<script src="js/main.js?v1.1"></script>
</body>
</html>