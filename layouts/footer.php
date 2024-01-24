<script src="AdminLTE_new/plugins/sweetalert2/sweetalert2.min.js"></script>



<script>

<?php if($_SESSION["mariphil"]["temp_password"] == "YES"): ?>
  document.addEventListener('DOMContentLoaded', function () {
    // Get the modal element
    var myModal = new bootstrap.Modal(document.getElementById('changePassword'), {
      backdrop: 'static'
    });

    // Show the modal when the page loads
    myModal.show();
  });
<?php endif; ?>


$('body').on('submit', '.generic_form_trigger', function(e) {
  e.preventDefault();

  var form = $(this)[0];
  var formData = new FormData(form);
  var url = $(this).data('url');


  Swal.fire({
  title: 'Do you want to submit the changes?',
  showCancelButton: true,
  confirmButtonText: 'Save',
  }).then((result) => {
    /* Read more about isConfirmed, isDenied below */
    if (result.isConfirmed) {
      Swal.fire({title: 'Please wait...', imageUrl: 'AdminLTE/dist/img/loader.gif', showConfirmButton: false});
      $.ajax({
                type: 'post',
                url: url,
                data: formData,
                processData: false,
                contentType: false,
                success: function (results) {
                var o = jQuery.parseJSON(results);
                console.log(o);
                if(o.result === "success") {
                    Swal.close();
                    Swal.fire({title: "Submit success",
                    text: o.message,
                    type:"success"})
                    .then(function () {



                      if(typeof(o.newlink) != "undefined" && o.newlink !== null) {
                          if(o.newlink == "newlink"){
                            console.log(o);
                            if(o.link == "refresh")
                            window.location.reload();
                            else if(o.link == "not_refresh")
                              console.log("");
                            else
                              window.open(o.link, '_blank');
                              // window.location.replace(o.link, "_blank");
                          }
                      }
                      else{
                        if(o.link == "refresh")
                        window.location.reload();
                        else if(o.link == "not_refresh")
                          console.log("");
                        else
                          window.location.replace(o.link);

                      }




                      // // alert(o.link);
                      // if(o.link == "refresh"){
                      //   location.reload();
                      // }
                      // else{
                      //   window.location.replace(o.link);
                      // }
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



$('.generic_form_no_trigger').submit(function(e) {
var form = $(this)[0];
var formData = new FormData(form);
var url = $(this).data('url');
e.preventDefault();


Swal.fire({title: 'Please wait...', imageUrl: 'AdminLTE/dist/img/loader.gif', showConfirmButton: false});
$.ajax({
              type: 'post',
              url: url,
              data: formData,
              processData: false,
              contentType: false,
              success: function (results) {
              var o = jQuery.parseJSON(results);
              console.log(o);
              if(o.result === "success") {
                  Swal.close();
                  Swal.fire({title: "Submit success",
                  text: o.message,
                  type:"success"})
                  .then(function () {



                    if(typeof(o.newlink) != "undefined" && o.newlink !== null) {
                        if(o.newlink == "newlink"){
                          console.log(o);
                          if(o.link == "refresh")
                          window.location.reload();
                          else if(o.link == "not_refresh")
                            console.log("");
                          else
                            window.open(o.link, '_blank');
                            // window.location.replace(o.link, "_blank");
                        }
                    }
                    else{
                      if(o.link == "refresh")
                      window.location.reload();
                      else if(o.link == "not_refresh")
                        console.log("");
                      else
                        window.location.replace(o.link);

                    }




                    // // alert(o.link);
                    // if(o.link == "refresh"){
                    //   location.reload();
                    // }
                    // else{
                    //   window.location.replace(o.link);
                    // }
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
  });




  $('.generic_form_no_trigger_and_result').submit(function(e) {
var form = $(this)[0];
var formData = new FormData(form);
var url = $(this).data('url');
e.preventDefault();


Swal.fire({title: 'Please wait...', imageUrl: 'AdminLTE/dist/img/loader.gif', showConfirmButton: false});
$.ajax({
              type: 'post',
              url: url,
              data: formData,
              processData: false,
              contentType: false,
              success: function (results) {
              var o = jQuery.parseJSON(results);
              console.log(o);
              if(o.result === "success") {
                  Swal.close();
                  if(typeof(o.newlink) != "undefined" && o.newlink !== null) {
                        if(o.newlink == "newlink"){
                          console.log(o);
                          if(o.link == "refresh")
                          window.location.reload();
                          else if(o.link == "not_refresh")
                            console.log("");
                          else
                            window.open(o.link, '_blank');
                            // window.location.replace(o.link, "_blank");
                        }
                    }
                    else{
                      if(o.link == "refresh")
                      window.location.reload();
                      else if(o.link == "not_refresh")
                        console.log("");
                      else
                        window.location.replace(o.link);

                    }
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
  });

    $('.generic_form_pdf').submit(function(e) {
      e.preventDefault();
      var url = $(this).data('url');
        var promptmessage = 'This form will be submitted. Are you sure you want to continue?';
        var prompttitle = 'Data submission';
        e.preventDefault();
        swal({
            title: prompttitle,
            text: promptmessage,
            type: 'info',
            showCancelButton: true,
            confirmButtonText: 'Yes',
            cancelButtonText: 'Cancel'
        }).then((result) => {
            if (result.value) {
                swal({title: 'Please wait...', imageUrl: 'AdminLTE/dist/img/loader.gif', showConfirmButton: false});
            $.ajax({
                type: 'post',
                url: url,
                data: $(this).serialize(),
                success: function (results) {
                var o = jQuery.parseJSON(results);
                o = o.info["0"];
                console.log(o);
                if(o.result === "success") {
          swal({
            title: "Success!",
            text: "Successfully rendered List: " + o.filename,
            icon: "warning",
             showCancelButton: true,
              confirmButtonColor: '#DD6B55',
              confirmButtonText: 'View',
              cancelButtonText: "Cancel",
              closeOnConfirm: false,
              closeOnCancel: false,
            dangerMode: true,
          }).then(function(isConfirm) {
            if (isConfirm) {
                var fileName = o.path;
                    $("#dialog").dialog({
                        modal: true,
                        title: fileName,
                        width: 1200,
                        height: "auto",
                        resizable: false,
                        draggable: false,
                        closeOnEscape: true,
                        dialogClass: 'fixed-dialog',
                        buttons: {
                            Close: function () {
                                $(this).dialog('close');
                            },"Open Link": function (){
                          window.open(o.path);
                        },
                        },
                        open: function () {
                            var object = "<object data=\""+o.path+"\" type=\"application/pdf\" width=\"1200px\" height=\"500px\">";
                            object += "If you are unable to view file, you can download from <a href = \"{FileName}\">here</a>";
                            object += " or download <a target = \"_blank\" href = \"http://get.adobe.com/reader/\">Adobe PDF Reader</a> to view the file.";
                            object += "</object>";
                            object = object.replace(/{FileName}/g, "Files/" + fileName);
                            $("#dialog").html(object);
                        }
                    });
             
              // console.log("confirmed");
              // window.open(o.path, '_blank');
        // window.location = parsed.path;
        swal.close();
            } else {
              console.log("cancelled");
        
        swal.close();
            }
          });
        }
                else {
                    swal({
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
            }
        });
    });



    $('.generic_form_files_trigger').submit(function(e) {



  var form = $(this)[0];
	var formData = new FormData(form);
    e.preventDefault();
    console.log(formData);


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
                data: formData,
                processData: false,
    	contentType: false,
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



<footer class="main-footer">
    <div class="float-right d-none d-sm-block">
      <b>Version</b> 3.2.0
    </div>
    <strong>Copyright &copy; <?php echo(date("Y")); ?> <a href="#">Mariphil</a>.</strong> All rights reserved.
  </footer>
    <aside class="control-sidebar control-sidebar-dark">
  </aside>
</div>
</body>
</html>