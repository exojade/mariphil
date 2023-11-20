<link rel="stylesheet" href="AdminLTE_new/plugins/sweetalert2-theme-bootstrap-4/bootstrap-4.min.css">

<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-12">
            <h1>Renewal Portal
       

            </h1>
          </div>
       
        </div>
      </div><!-- /.container-fluid -->
    </section>

    <!-- Main content -->
    <section class="content">
    <div class="modal fade" id="upload_grades">
        <div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-header">
              <h4 class="modal-title">Upload Grades</h4>
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
            <div class="modal-body">
              <form class="generic_form_trigger" data-url="renewal">
              <input type="hidden" name="action" value="upload_grades">
              <input type="hidden" name="renewal_id" value="<?php echo($_GET["id"]); ?>">
           
              <div class="form-group">
                <label for="customFile">Grades</label>
                <div class="custom-file">
                  <input name="grades" accept="application/msword,image/jpeg,image/gif,image/png,application/pdf,image/x-eps" type="file" class="custom-file-input" id="family_pic">
                  <label class="custom-file-label" for="family_pic">Choose file</label>
                </div>
              </div>
            </div>
            <div class="modal-footer justify-content-between">
              <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
              <button type="submit" class="btn btn-primary">Save changes</button>
            </div>
            </form>
          </div>
        </div>
      </div>


      <div class="modal fade" id="upload_cor">
        <div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-header">
              <h4 class="modal-title">Upload COR</h4>
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
            <div class="modal-body">
              <form class="generic_form_trigger" data-url="renewal">
              <input type="hidden" name="action" value="upload_cor">
              <input type="hidden" name="renewal_id" value="<?php echo($_GET["id"]); ?>">
           
              <div class="form-group">
                <label for="customFile">Certificate of Registration</label>
                <div class="custom-file">
                  <input name="cor" accept="application/msword,image/jpeg,image/gif,image/png,application/pdf,image/x-eps" type="file" class="custom-file-input" id="family_pic">
                  <label class="custom-file-label" for="family_pic">Choose file</label>
                </div>
              </div>
            </div>
            <div class="modal-footer justify-content-between">
              <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
              <button type="submit" class="btn btn-primary">Save changes</button>
            </div>
            </form>
          </div>
        </div>
      </div>


      <div class="modal fade" id="upload_tuition">
        <div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-header">
              <h4 class="modal-title">Upload Tuition</h4>
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
            <div class="modal-body">
              <form class="generic_form_trigger" data-url="renewal">
              <input type="hidden" name="action" value="upload_tuition">
              <input type="hidden" name="renewal_id" value="<?php echo($_GET["id"]); ?>">
           
              <div class="form-group">
                <label for="customFile">Tuition Fee Report</label>
                <div class="custom-file">
                  <input name="tuition" accept="application/msword,image/jpeg,image/gif,image/png,application/pdf,image/x-eps" type="file" class="custom-file-input" id="family_pic">
                  <label class="custom-file-label" for="family_pic">Choose file</label>
                </div>
              </div>
            </div>
            <div class="modal-footer justify-content-between">
              <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
              <button type="submit" class="btn btn-primary">Save changes</button>
            </div>
            </form>
          </div>
        </div>
      </div>




<?php
      $mychecks = query("select * from renewal
                        where form_id = ? and status = 'SUBMITTED'
                      ",
                      $_GET["id"]);
                      // dump($mychecks);
      foreach($mychecks as $check):
      ?>
<div class="modal fade" id="check_<?php echo($check["scholar_id"]); ?>">
        <div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-header">
              <h4 class="modal-title">Check the Form</h4>
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
            <div class="modal-body">
            <form class="generic_form_files_trigger" data-url="forms">
                <input type="hidden" name="action" value="checkForm">
                <input type="hidden" name="form_id" value="<?php echo($check["form_id"]); ?>">
                <input type="hidden" name="scholar_id" value="<?php echo($check["scholar_id"]); ?>">
                <input type="hidden" name="checked_by" value="<?php echo($_SESSION["mariphil"]["userid"]); ?>">
                <div class="form-group">
                  <label>Change Status</label>
                  <select required name="status" class="form-control select2" >
                    <option value="<?php echo($check["status"]); ?>"><?php echo($check["status"]); ?></option>
                    <option value="CHECKED">CHECKED</option>
                    <option value="RETURNED">RETURNED</option>
                  </select>
                </div>

                <div class="form-group">
                    <label>Remarks</label>
                    <textarea required name="remarks" class="form-control" rows="3" placeholder="Enter ..."></textarea>
                </div>
            </div>

            <div class="modal-footer justify-content-between">
              <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
              <button type="submit" class="btn btn-primary">Submit</button>
            </div>
          </form>
          
          </div>
        </div>
      </div>



      <div class="modal fade" id="viewRenewal_<?php echo($check["scholar_id"]); ?>">
        <div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-header">
              <h4 class="modal-title">View Report</h4>
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
            <div class="modal-body">
              <table class="table table-bordered">
                <tr>
                  <td>Grades</td>
                  <td><a href="<?php echo($check["grades"]); ?>" class="btn btn-primary" target="_blank">Open</a></td>
                </tr>
                <tr>
                  <td>Tuition Fee Report</td>
                  <td><a href="<?php echo($check["tuition_fee_report"]); ?>" class="btn btn-primary" target="_blank">Open</a></td>
                </tr>
                <tr>
                  <td>Certificate of Registration</td>
                  <td><a href="<?php echo($check["cor"]); ?>" class="btn btn-primary" target="_blank">Open</a></td>
                </tr>
              </table>
            </div>
          
          </div>
        </div>
      </div>




     <?php endforeach; ?>




    


    


      <div class="modal fade" id="modal_approveForm">
          <div class="modal-dialog modal-lg">
            <div class="modal-content ">
              <div class="modal-header bg-primary">
                <h3 class="modal-title">Approve Renewal</h3>
              </div>
              <div class="modal-body">
                <form role="form" class="generic_form_trigger" data-url="renewal">
                  <input type="hidden" name="action" value="approveForm">
                  <input type="hidden" name="renewal_id" value="<?php echo($_GET["id"]); ?>">

                  <div class="form-group">
                        <label>Remarks *</label>
                        <textarea required name="remarks" class="form-control" rows="5" placeholder="Enter ..."></textarea>
                      </div>

                  <div class="box-footer">
                    <button type="submit" class="btn btn-primary">Submit</button>
                    <button type="button" class="btn btn-default pull-left" data-dismiss="modal">Close</button>
                  </div>
                </form>
              </div>
            </div>
          </div>
      </div>

      <div class="modal fade" id="modal_returnForm">
          <div class="modal-dialog modal-lg">
            <div class="modal-content ">
              <div class="modal-header bg-danger">
                <h3 class="modal-title">Return Quarterly Form</h3>
              </div>
              <div class="modal-body">
                <form role="form" class="generic_form_trigger" data-url="renewal">
                  <input type="hidden" name="action" value="returnForm">
                  <input type="hidden" name="renewal_id" value="<?php echo($_GET["id"]); ?>">

                  <div class="form-group">
                        <label>Comments why being returned *</label>
                        <textarea required name="remarks" class="form-control" rows="5" placeholder="Enter ..."></textarea>
                      </div>

                  <div class="box-footer">
                    <button type="submit" class="btn btn-primary">Submit</button>
                    <button type="button" class="btn btn-default pull-left" data-dismiss="modal">Close</button>
                  </div>
                </form>
              </div>
            </div>
          </div>
      </div>



      <div class="container-fluid">
        <div class="row">
          <div class="col-4">

          <div class="card card-primary card-outline">
              <div class="card-body box-profile">
                <div class="text-center">
                  <?php if($scholar[0]["profile_image"] == ""): ?>
                    <img class="profile-user-img img-fluid img-circle"
                       src="resources/default.jpg"
                       alt="User profile picture" style="height:150px; width: 150px;">
                  <?php else: ?>
                    <img class="profile-user-img img-fluid img-circle"
                       src="<?php echo($scholar[0]["profile_image"]); ?>"
                       alt="User profile picture" style="height:150px; width: 150px;">

                  <?php endif; ?>
              
                </div>
                <br>
                <h3 class="profile-username text-center"><?php echo($scholar[0]["firstname"] . " " . $scholar[0]["lastname"]); ?></h3>
                <br>
                <ul class="list-group list-group-unbordered mb-3">
                  <li class="list-group-item">
                    <b>School</b> <a class="float-right"><?php echo($scholar[0]["school_name"]); ?></a>
                  </li>
                  <li class="list-group-item">
                    <b>Level</b> <a class="float-right"><?php echo($scholar[0]["year_type"]); ?></a>
                  </li>
                  <li class="list-group-item">
                    <b>Year Level</b> <a class="float-right"><?php echo($scholar[0]["year_level"]); ?></a>
                  </li>
                </ul>
             
              </div>
            </div>


          <div class="card card-primary card-outline">
              <div class="card-body box-profile">
                <h3 class="profile-username text-center">RENEWAL PORTAL INFORMATION</h3>
                <ul class="list-group list-group-unbordered mb-3">
                  <li class="list-group-item">
                    <b>Current SY</b> <a class="float-right"><?php echo($form["current_sy"]); ?></a>
                  </li>
                  <li class="list-group-item">
                    <b>For Renewal SY</b> <a class="float-right"><?php echo($form["for_sy"]); ?></a>
                  </li>
                  <li class="list-group-item">
                    <b>Status</b> <a class="float-right"><?php

                    if($form["form_status"] == "DONE"):
                      echo("RENEWED");
                    else:
                      echo($form["form_status"]); 
                    endif;

                     ?></a>
                  </li>
                </ul>
              </div>
              <!-- /.card-body -->
            </div>

          <?php if($form["form_status"] != "DONE" && $form["return_comments"] != ""): ?>
            <div class="card">
    
              <div class="card-header p-2 bg-danger">
                            <h3 class="card-title">RETURNED COMMENTS</h3>
                          </div>
                <div class="card-body">
                      <div class="form-group">
                        <label>Comments</label>
                        <textarea readonly class="form-control" rows="5" placeholder="Enter ..."><?php echo($form["return_comments"]); ?></textarea>
                      </div>
                </div>
              </div>
          <?php endif; ?>



            <?php
            // dump($_SESSION);
            if($_SESSION["mariphil"]["role"] == "FACILITATOR"):
              if($form["form_status"] == "FOR CHECKING"):
             ?>
            <div class="row">
              <div class="col-md-6">
                  <a href="#" data-toggle="modal" data-target="#modal_approveForm" class="btn btn-success btn-block">Approve</a>
              </div>
              <div class="col-md-6">
                  <a href="#" data-toggle="modal" data-target="#modal_returnForm" class="btn btn-danger btn-block">Return</a>
              </div>
            </div>
             <?php endif; ?>
            <?php endif; ?>

          </div>
          <div class="col-8">
            <!-- Default box -->
            <div class="card">
            <form class="generic_form_trigger" id="grade_form" data-url="renewal">
            <input type="hidden" name="action" value="updateInfo">
            <input type="hidden" name="form_id" value="<?php echo($_GET["id"]); ?>">
            <div class="card-header p-2">
                          <h3 class="card-title">School Information</h3>
                          <?php if($_SESSION["mariphil"]["role"] == "SCHOLAR" && ($form["form_status"] == "FOR SUBMISSION" || $form["form_status"] == "RETURNED")): ?>
                            <div class="card-tools" style="margin-right:10px;">
                              <button class="btn btn-primary btn-update" type="button">Update</button>
                              <button style="display: none;" class="btn btn-success btn-save" type="submit">Save</button>
                              <button style="display: none;" class="btn btn-danger btn-cancel" type="button">Cancel</button>
                            </div>
                          <?php endif; ?>
                          
                        </div>
              <div class="card-body">
                  <div class="form-group">
                    <label>School Name</label>
                    <?php
                    $school = $form["school_name"];
                    if($form["school_name"] == "")
                    $school = $scholar[0]["school_name"];
                  

                    $course = $form["course"];
                    if($form["course"] == "")
                    $course = $scholar[0]["course"];
                    ?>
                    <input readonly value="<?php echo($school); ?>" required name="school_name" type="text" class="form-control form-control-border border-width-2"  placeholder="Enter Targeted School">
                  </div>

                  <?php 
                    $year_level = query("select * from year_level where level_id > ?", $scholar[0]["year_level_id"]); 
                  ?>
                    <div class="form-group">
                        <label>Select Year Level</label>
                        <select id="yearLevelSelect" disabled name="year_level" class="form-control select">
                          <?php $i=0; foreach($year_level as $row):
                            if($i == 0):
                            ?>
                              <option selected data-type="<?php echo($row["type"]); ?>" value="<?php echo($row["level_id"]); ?>">[<?php echo($row["type"]); ?>] - <?php echo($row["year_level"]); ?></option>
                            <?php else: ?>
                              <option data-type="<?php echo($row["type"]); ?>" value="<?php echo($row["level_id"]); ?>">[<?php echo($row["type"]); ?>] - <?php echo($row["year_level"]); ?></option>
                            <?php endif; ?>
                          <?php $i++;endforeach; ?>
                        </select>
                      </div>

                      <div class="form-group" id="courseInput" <?php if($course == ""): ?>style="display: none;" <?php endif; ?>>
                          <label for="course">Enter Course</label>
                          <input value="<?php echo($course); ?>" type="text" name="course" class="form-control">
                      </div>
                  
                </div>
              </form>
             
            </div>


            <div class="card">
       
            <div class="card-header p-2">
                          <h3 class="card-title">Requirements</h3>
                          <div class="card-tools" style="margin-right:10px;">
                      
                          </div>
                        </div>
              <div class="card-body">
                <table class="table table-bordered">
                  <thead>
                    <th width="20%">Action</th>
                    <th>Requirement</th>
                    <th>File</th>
                  </thead>
                  <tbody>
                    <tr>
                      <td>
                      <?php if($_SESSION["mariphil"]["role"] == "SCHOLAR" && ($form["form_status"] == "FOR SUBMISSION" || $form["form_status"] == "RETURNED")): ?>
                        <a href="#" data-toggle="modal" data-target="#upload_grades" class="btn btn-primary btn-block">Reupload</a>
                      <?php else: ?>
                        <button disabled class="btn btn-primary btn-block">Reupload</button>
                      <?php endif; ?>
                    </td>
                      <td>Grades</td>
                      <td>
                        <a target="_blank" href="<?php echo($form["grades"]); ?>"><?php echo($form["grades"]); ?></a></td>
                    </tr>
                    <tr>
                      <td>

                      <?php if($_SESSION["mariphil"]["role"] == "SCHOLAR" && ($form["form_status"] == "FOR SUBMISSION" || $form["form_status"] == "RETURNED")): ?>
                        <a href="#" data-toggle="modal" data-target="#upload_cor" class="btn btn-primary btn-block">Reupload</a>
                      <?php else: ?>
                        <button disabled class="btn btn-primary btn-block">Reupload</button>
                      <?php endif; ?>

                        
                      </td>
                      <td>Certificate of Registration</td>
                      <td><a target="_blank" href="<?php echo($form["cor"]); ?>"><?php echo($form["cor"]); ?></a></td>
                    </tr>
                    <tr>
                      <td>
                      <?php if($_SESSION["mariphil"]["role"] == "SCHOLAR" && ($form["form_status"] == "FOR SUBMISSION" || $form["form_status"] == "RETURNED")): ?>
                        <a href="#" data-toggle="modal" data-target="#upload_tuition" class="btn btn-primary btn-block">Reupload</a>

                      <?php else: ?>
                        <button disabled class="btn btn-primary btn-block">Reupload</button>
                      <?php endif; ?>
                      </td>
                      <td>Tuition Fee Report</td>
                      <td><a target="_blank" href="<?php echo($form["tuition_fee_report"]); ?>"><?php echo($form["tuition_fee_report"]); ?></a></td>
                    </tr>
                  </tbody>
                </table>
                </div>
            </div>


            <?php
            if($_SESSION["mariphil"]["role"] == "SCHOLAR" && ($form["form_status"] == "FOR SUBMISSION" || $form["form_status"] == "RETURNED")): ?>
              <form class="generic_form_trigger" data-url="renewal" style="display:inline; float:right;">
              <input type="hidden" name="action" value="submitForm">
              <input type="hidden" name="tbl_id" value="<?php echo($_GET["id"]); ?>">
                <button class="btn btn-primary" >Submit Renewal Form</button>
              </form>
            <?php endif; ?>
          </div>
        </div>
      </div>
    </section>
  </div>
  <script src="AdminLTE_new/plugins/sweetalert2/sweetalert2.min.js"></script>
  <script src="AdminLTE_new/plugins/bs-custom-file-input/bs-custom-file-input.min.js"></script>
  <script>
    $(".btn-update").click(function(){
      // alert("awoit");
      var form = $(this).parents('form:first');
      // console.log( $("#"+form.attr('id')+" :input"));
      $("#"+form.attr('id')+" :input").prop('readonly', false);
      $("#"+form.attr('id')+" .select").prop('disabled', false);
      $("#"+form.attr('id')+" .custom-file-input").prop('disabled', false);
      $("#"+form.attr('id')+" .btn-save").show(); //Showing submit_text
      $("#"+form.attr('id')+" .btn-cancel").show(); //Showing submit_text
      $("#"+form.attr('id')+" .btn-update").hide(); //Showing submit_text
    });
    $(".btn-cancel").click(function(){
      var form = $(this).parents('form:first');
      $("#"+form.attr('id')+" :input").prop('readonly', true);
      $("#"+form.attr('id')+" .select").prop('disabled', true);
      $("#"+form.attr('id')+" .custom-file-input").prop('disabled', true);
      $("#"+form.attr('id')+" .btn-save").hide(); //Showing submit_text
      $("#"+form.attr('id')+" .btn-cancel").hide(); //Showing submit_text
      $("#"+form.attr('id')+" .btn-update").show(); //Showing submit_text
    });


    $(function () {
      bsCustomFileInput.init();
    });
    </script>

<script>
    // Get references to the select and course input elements
    var yearLevelSelect = document.getElementById("yearLevelSelect");
    var courseInput = document.getElementById("courseInput");

    // Add an event listener to the select element
    yearLevelSelect.addEventListener("change", function() {
        // Get the selected option's data-type attribute
        var selectedOption = yearLevelSelect.options[yearLevelSelect.selectedIndex];
        var dataType = selectedOption.getAttribute("data-type");

        // Check if the selected option has data-type "college"
        if (dataType === "COLLEGE") {
            // If it's a college, show the course input box
            courseInput.style.display = "block";
        } else {
            // If it's not a college, hide the course input box
            courseInput.style.display = "none";
        }
    });
</script>

    
  <?php require("layouts/footer.php") ?>