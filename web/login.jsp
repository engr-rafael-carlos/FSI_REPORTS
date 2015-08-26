<!--
Project Title: FSI Reports
Company: Agile Solution Partners International Corporation
Front-End by: "engr-rafael-carlos"
Back-End by: "michaelyabut"
Date: August 5, 2015
Time: 10:48 PM
FileName: index.html
Description: Log In Form
Version: 1.0.0

Last Update: August 5, 2015
-->

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>FSI</title>

  <!-- Mobile Specific Meta Tag -->
  <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />

  <!-- =====================================
  Cascading Stylesheet Libraries and Plugins
  ===================================== -->

  <link href="css/design.css" rel="stylesheet" />

  <!-- =====================================
       Javascript Libraries and Plugins
  ===================================== -->

  <!-- JQuery -->
  <script type="text/javascript" src="js/lib/jquery-1.11.1.min.js"></script>
  <script type="text/javascript" src="js/lib/jquery-2.1.4.js"></script>

  <!-- Bootstrap Javascript -->
  <script type="text/javascript" src="js/lib/bootstrap.js"></script>

  <!-- Application -->
  <script type="text/javascript" src="js/application.js"></script>

</head>

<body class="open-sans">

<div class="container">
  <div class="row">
    <div class="col-sm-6 col-sm-offset-3 col-lg-4 col-lg-offset-4">

      <div class="mt70">
        <div class="box-shadow">
          <div class="panel">
            <div class="panel-body">
              <div class="text-center">
                <h3 id="banner">
                  <strong>SIGN</strong> <span class="thin"> IN</span>
                </h3>
              </div>

              <div class="padding">
                <form id="sign-in-form" action="LoginServlet">

                  <!--Error Message-->
                  <div class="alert alert-danger" role="alert" id="error-message" style="display: none">
                    Your Account Number or Password is Invalid!
                  </div>

                  <!--Input User-->
                  <div class="form-group">
                    <input class="form-control" maxlength="255" placeholder="Username" name="username" required />
                  </div>

                  <!--Input Password-->
                  <div class="form-group">
                    <input class="form-control" placeholder="Password" type="password" name="password" required />
                  </div>

                  <!--Sign In Button-->
                  <div class="form-group">
                    <button class="btn btn-success btn-block" type="submit" id="sign_in_btn">Let's go</button>
                  </div>

                  <div class="form-group">
                    <div class="row">

                      <!--Remember Me-->
                      <div class="col-xs-6">
                        <label class="checkbox-inline">
                          <input type="checkbox" class="checkbox-success"> Remember Me
                        </label>
                      </div>

                      <!--Forgot Password-->
                      <div class="col-xs-6 text-right">
                        <a href="#">Forgot password?</a>
                      </div>

                    </div>
                  </div>

                </form>
              </div>

            </div>
          </div>
        </div>


        <!--Logging In-->
        <div id="welcome" style="display: none;">
          <h1 class="thin text-success text-center animated fadeInLeft">
            Welcome :)
          </h1>
          <br><br>
          <div class="progress animated fadeInLeft">
            <div class="progress-bar progress-bar-success progress-bar-striped active"
                 style="width: 100%">
            </div>
          </div>
          <br><br>
          <p class="text-center animated fadeInLeft">
            Redirecting to your dashboard...
          </p>
        </div>


      </div>


      <div class="text-center">
        &copy; 2015 FSI Reports. All Rights Reserved
      </div>

    </div>
  </div>
</div>



</body>
</html>
