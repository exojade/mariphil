<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>AdminLTE 3 | Lockscreen</title>

  <!-- Google Font: Source Sans Pro -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="AdminLTE_new/plugins/fontawesome-free/css/all.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="AdminLTE_new/dist/css/adminlte.min.css">
  <link rel="stylesheet" href="AdminLTE_new/plugins/sweetalert2-theme-bootstrap-4/bootstrap-4.min.css">
</head>

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
<body class="hold-transition lockscreen" style="
background-image: url('resources/background.jpg');
  background-repeat: no-repeat;
  background-attachment: fixed;
  background-size: cover;">
<!-- Automatic element centering -->
<div class="layer">
<div class="lockscreen-wrapper">
  <div class="lockscreen-logo">
    <a style="color:#fff;" href="AdminLTE_new/index2.html"><b>OTP</b></a>
  </div>
  <!-- User name -->
  <div style="color:#fff;" class="lockscreen-name"><?php echo($user["username"]); ?></div>

  <!-- START LOCK SCREEN ITEM -->
  <div class="lockscreen-item">
    <!-- lockscreen image -->
    <div class="lockscreen-image">
      <img src="AdminLTE_new/dist/img/user1-128x128.jpg" alt="User Image">
    </div>

    <form class="lockscreen-credentials generic_form_trigger" data-url="otp">
      <input type="hidden" name="action" value="entered_otp">
      <input type="hidden" name="user_id" value="<?php echo($_GET["id"]); ?>">
      <div class="input-group">
        <input name="otp" required type="text" class="form-control" placeholder="Enter OTP...">
        <div class="input-group-append">
          <button type="submit" class="btn">
            <i class="fas fa-arrow-right text-muted"></i>
          </button>
        </div>
      </div>
    </form>

  </div>
  <div class="help-block text-center" style="color:#fff;">
    Enter the code sent to you on your email address
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
