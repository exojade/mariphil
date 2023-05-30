<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>AdminLTE 3 | Registration Page (v2)</title>

  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
  <link rel="stylesheet" href="AdminLTE_new/plugins/fontawesome-free/css/all.min.css">
  <link rel="stylesheet" href="AdminLTE_new/plugins/icheck-bootstrap/icheck-bootstrap.min.css">
  <link rel="stylesheet" href="AdminLTE_new/dist/css/adminlte.min.css">
  <link rel="stylesheet" href="AdminLTE_new/plugins/sweetalert2-theme-bootstrap-4/bootstrap-4.min.css">
  <style>
.layer {
    background-color: rgba(5, 5, 5, 0.7);
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
}
  </style>
</head>



<body class="hold-transition register-page" style="
background-image: url('resources/background.jpg');
  background-repeat: no-repeat;
  background-attachment: fixed;
  background-size: cover;
">

<div class="layer">
<div class="register-box" style="    width: 360px;
    margin: 7% auto;">
  <div class="card card-outline card-primary">
    <div class="card-header text-center">
      <a href="#" class="h1"><b>Mariphil</b></a>
    </div>
    <div class="card-body">
      <p class="login-box-msg">Applicant Verification</p>
      <form class="generic_form_trigger" data-url="register">
        <input type="hidden" name="action" value="register">
        <div class="input-group mb-3">
          <input required type="text" name="lastname" class="form-control" placeholder="Last name">
          <div class="input-group-append">
            <div class="input-group-text">
              <span class="fas fa-user"></span>
            </div>
          </div>
        </div>
        <div class="input-group mb-3">
          <input required type="text" name="firstname" class="form-control" placeholder="First name">
          <div class="input-group-append">
            <div class="input-group-text">
              <span class="fas fa-user"></span>
            </div>
          </div>
        </div>
        <div class="input-group mb-3">
          <input required type="text" name="middlename" class="form-control" placeholder="Middle name">
          <div class="input-group-append">
            <div class="input-group-text">
              <span class="fas fa-user"></span>
            </div>
          </div>
        </div>
        <div class="input-group mb-3">
          <input required name="email_address" type="email" class="form-control" placeholder="Email">
          <div class="input-group-append">
            <div class="input-group-text">
              <span class="fas fa-envelope"></span>
            </div>
          </div>
        </div>
        <div class="input-group mb-3">
          <input type="text" placeholder="Birthdate"
                    onfocus="(this.type='date')" required type="text" name="birthdate" class="form-control" placeholder="Birthdate">
          <div class="input-group-append">
            <div class="input-group-text">
              <span class="fas fa-calendar"></span>
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col-12">
            <button type="submit" class="btn btn-primary btn-block">Register</button>
          </div>
        </div>
      </form>
    </div>
  </div>
</div>
</div>
<script src="AdminLTE_new/plugins/jquery/jquery.min.js"></script>
<script src="AdminLTE_new/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="AdminLTE_new/plugins/sweetalert2/sweetalert2.min.js"></script>
<script src="AdminLTE_new/plugins/toastr/toastr.min.js"></script>
<script src="AdminLTE_new/dist/js/adminlte.min.js"></script>
<script src="AdminLTE_new/dist/js/demo.js"></script>
<script>
$('.generic_form_trigger').submit(function(e) {
  e.preventDefault();

  e.preventDefault();
  var url = $(this).data('url');


  console.log(url);

  Swal.fire({
  title: 'Do you want to save the changes?',
  showCancelButton: true,
  confirmButtonText: 'Save',
  }).then((result) => {
    /* Read more about isConfirmed, isDenied below */
    if (result.isConfirmed) {
      Swal.fire({title: 'Please wait...', imageUrl: 'AdminLTE/dist/img/loader.gif', showConfirmButton: false});
      $.ajax({
                type: 'post',
                url: url,
                data: $(this).serialize(),
                success: function (results) {
                var o = jQuery.parseJSON(results);
                console.log(o);
                if(o.result === "success") {
                    Swal.close();
                    Swal.fire({title: "Submit success",
                    text: o.message,
                    type:"success"})
                    .then(function () {
                    window.location.replace(o.link);
                    });
                }
                else {
                    Swal.fire({
                    title: "Error!",
                    text: o.message,
                    type:"error"
                    });
                    console.log(results);
                }
                },
                error: function(results) {
                console.log(results);
                swal("Error!", "Unexpected error occur!", "error");
                }
            });
    } else if (result.isDenied) {
    
    }
  })

     
    });

</script>
</body>
</html>
