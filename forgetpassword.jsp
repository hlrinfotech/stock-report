<!DOCTYPE html>
<html lang="en">

  <head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <link href="https://fonts.googleapis.com/css?family=Montserrat:100,200,300,400,500,600,700,800,900" rel="stylesheet">

    <title>Venus</title>
    
    <!-- Bootstrap core CSS -->
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Additional CSS Files -->
    <link rel="stylesheet" href="assets/css/fontawesome.css">
    <link rel="stylesheet" href="assets/css/templatemo-grad-school.css">
    <link rel="stylesheet" href="assets/css/owl.css">
    <link rel="stylesheet" href="assets/css/lightbox.css">
<link rel="stylesheet" type="text/css" href="assets1/css/style.css">
  </head>

<body>

   
  <!--header-->
  <header class="main-header clearfix" role="header">
    <div class="logo">
      <a href="#"><em>venus</em> </a>
    </div>
    <a href="#menu" class="menu-link"><i class="fa fa-bars"></i></a>

  </header>

  <!-- ***** Main Banner Area Start ***** -->
  <section class="section main-banner" id="top" data-section="section1">
      <video autoplay muted loop id="bg-video">
          <source src="assets/video/1.mp4" type="video/mp4" />
      </video>

      <div class="video-overlay header-text">
          <div class="caption">
              <h6>Venus Report</h6>
            
                      <div class="right-content">
            <div class="top-content">
              <h6>Forget&nbsp;Password</h6>
            </div>
            <form id="contact" action="Forgetpassword" method="post">
              <div class="row">
                <div class="col-md-12">
                  <fieldset>
                    <input name="uname" type="text" class="form-control" id="name" placeholder="User Name" required="">
                  </fieldset>
                </div>
                <div class="col-md-12" style="padding-top: 10px;">
                  <fieldset>
                      <input name="hints" type="text" class="form-control" id="email" placeholder="hints" required="">
                  </fieldset>
                </div>
                  
                   <div class="col-md-12" style="padding-top: 10px;">
                  <fieldset>
                      <input name="pwd" type="password" class="form-control" id="email" placeholder="password" required="">
                  </fieldset>
                </div>
                  
                  
          
                <div class="col-md-12" style="padding-top: 10px;">
                  <fieldset>
                   <button type="submit" id="form-submit" class="btn btn-primary submit-btn">Submit</button>
                  </fieldset>
                </div>
                  <div class="col-md-6">
                  <fieldset>
                      <a href="index.jsp"> <<&nbsp;Back</a>
                  </fieldset>
                </div>
              </div>
            </form>
          </div>
        </div>
          </div>
    
  </section>
  <!-- ***** Main Banner Area End ***** -->




  <!-- Scripts -->
  <!-- Bootstrap core JavaScript -->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <script src="assets/js/isotope.min.js"></script>
    <script src="assets/js/owl-carousel.js"></script>
    <script src="assets/js/lightbox.js"></script>
    <script src="assets/js/tabs.js"></script>
    <script src="assets/js/video.js"></script>
    <script src="assets/js/slick-slider.js"></script>
    <script src="assets/js/custom.js"></script>
    <script>
        //according to loftblog tut
        $('.nav li:first').addClass('active');

        var showSection = function showSection(section, isAnimate) {
          var
          direction = section.replace(/#/, ''),
          reqSection = $('.section').filter('[data-section="' + direction + '"]'),
          reqSectionPos = reqSection.offset().top - 0;

          if (isAnimate) {
            $('body, html').animate({
              scrollTop: reqSectionPos },
            800);
          } else {
            $('body, html').scrollTop(reqSectionPos);
          }

        };

        var checkSection = function checkSection() {
          $('.section').each(function () {
            var
            $this = $(this),
            topEdge = $this.offset().top - 80,
            bottomEdge = topEdge + $this.height(),
            wScroll = $(window).scrollTop();
            if (topEdge < wScroll && bottomEdge > wScroll) {
              var
              currentId = $this.data('section'),
              reqLink = $('a').filter('[href*=\\#' + currentId + ']');
              reqLink.closest('li').addClass('active').
              siblings().removeClass('active');
            }
          });
        };

        $('.main-menu, .scroll-to-section').on('click', 'a', function (e) {
          if($(e.target).hasClass('external')) {
            return;
          }
          e.preventDefault();
          $('#menu').removeClass('active');
          showSection($(this).attr('href'), true);
        });

        $(window).scroll(function () {
          checkSection();
        });
    </script>
</body>
</html>