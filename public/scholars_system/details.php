<link rel="stylesheet" href="AdminLTE_new/plugins/datatables-bs4/css/dataTables.bootstrap4.min.css">
<link rel="stylesheet" href="AdminLTE_new/plugins/datatables-responsive/css/responsive.bootstrap4.min.css">
<link rel="stylesheet" href="AdminLTE_new/plugins/datatables-buttons/css/buttons.bootstrap4.min.css">
<link rel="stylesheet" href="AdminLTE_new/plugins/sweetalert2-theme-bootstrap-4/bootstrap-4.min.css">
<div class="content-wrapper">
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1>Profile</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item active">User Profile</li>
            </ol>
          </div>
        </div>
      </div>
    </section>
    <section class="content">
    <div class="modal fade" id="accept_modal">
        <div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-header">
              <h4 class="modal-title">Accept Scholar</h4>
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
            <div class="modal-body">
              <form class="generic_form_trigger" data-url="scholars">
                <input type="hidden" name="action" value="acceptScholar">
                <input type="hidden" name="scholar_id" value="<?php echo($_GET["id"]) ?>">
                <div class="form-group">
                  <label>Reason / Remarks</label>
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


      <div class="modal fade" id="deny_modal">
        <div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-header">
              <h4 class="modal-title">Deny Scholar</h4>
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
            <div class="modal-body">
            <form class="generic_form_trigger" data-url="scholars">
                <input type="hidden" name="action" value="denyScholar">
                <input type="hidden" name="scholar_id" value="<?php echo($_GET["id"]) ?>">
                <div class="form-group">
                  <label>Reason / Remarks</label>
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



      <div class="modal fade" id="resubmitRenewal">
        <div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-header">
              <h4 class="modal-title">RESUBMIT</h4>
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
            <div class="modal-body">
            <form class="generic_form_files_trigger" data-url="forms">
                <input type="hidden" name="action" value="resubmitRenewal">
                <input type="hidden" name="scholar_id" value="<?php echo($_GET["id"]) ?>">
                <input type="hidden" name="form_id" id="form_id" value="">
                <div class="form-group">
                      <label for="customFile">Grades</label>
                      <div class="custom-file">
                        <input name="grade_card" type="file" class="custom-file-input" id="family_pic">
                        <label class="custom-file-label" for="family_pic">Choose file</label>
                      </div>
                    </div>  

                    <div class="form-group">
                      <label for="customFile">Tuition Fee Report</label>
                      <div class="custom-file">
                        <input name="tuition" type="file" class="custom-file-input" id="family_pic">
                        <label class="custom-file-label" for="family_pic">Choose file</label>
                      </div>
                    </div> 

                    <div class="form-group">
                      <label for="customFile">Certificate of Registration</label>
                      <div class="custom-file">
                        <input name="cor" type="file" class="custom-file-input" id="family_pic">
                        <label class="custom-file-label" for="family_pic">Choose file</label>
                      </div>
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


     <?php  $renewal = query("select * from renewal where scholar_id = ?", $_GET["id"]); ?>
     <?php foreach($renewal as $r): ?>
      <div class="modal fade" id="viewRenewal_<?php echo($r["form_id"]); ?>">
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
                  <td><a href="<?php echo($r["grades"]); ?>" class="btn btn-primary" target="_blank">Open</a></td>
                </tr>
                <tr>
                  <td>Tuition Fee Report</td>
                  <td><a href="<?php echo($r["tuition_fee_report"]); ?>" class="btn btn-primary" target="_blank">Open</a></td>
                </tr>
                <tr>
                  <td>Certificate of Registration</td>
                  <td><a href="<?php echo($r["cor"]); ?>" class="btn btn-primary" target="_blank">Open</a></td>
                </tr>
              </table>
            </div>
          
          </div>
        </div>
      </div>
     <?php endforeach; ?>


     <?php if($_SESSION["mariphil"]["role"] == "FACILITATOR"): 
      $mychecks = query("select * from forms f
                        left join renewal r
                        on r.form_id = f.form_id
                        where r.scholar_id = ? and f.created_by = ?
                        and r.status = 'SUBMITTED' || r.status='RETURNED'",
                      $_GET["id"], $_SESSION["mariphil"]["userid"]);
                      // dump($mychecks);
      foreach($mychecks as $check):
      ?>
<div class="modal fade" id="check_<?php echo($r["form_id"]); ?>">
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
                <input type="hidden" name="form_id" value="<?php echo($r["form_id"]); ?>">
                <input type="hidden" name="scholar_id" value="<?php echo($_GET["id"]); ?>">
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




     <?php endforeach; ?>
     <?php endif; ?>

      



      <div class="container-fluid">
        <div class="row">
          <div class="col-md-3">
            <div class="card card-primary card-outline">
              <div class="card-body box-profile">
                <div class="text-center">
                  <?php if($applicant["profile_image"] == ""): ?>
                    <img class="profile-user-img img-fluid img-circle"
                       src="resources/default.jpg"
                       alt="User profile picture">
                  <?php else: ?>
                    <img class="profile-user-img img-fluid img-circle"
                       src="<?php echo($applicant["profile_image"]); ?>"
                       alt="User profile picture">

                  <?php endif; ?>
              
                </div>
                <br>
                <h3 class="profile-username text-center"><?php echo($applicant["firstname"] . " " . $applicant["lastname"]); ?></h3>
                <br>
                <?php if($applicant["current_status"] == "APPLICANT - DENIED"): ?>
                  <button class="btn btn-danger btn-block"><?php echo($applicant["current_status"]); ?></button>
                <?php elseif($applicant["current_status"] == "SCHOLAR"): ?>
                  <button class="btn btn-success btn-block"><?php echo($applicant["current_status"]); ?></button>
                <?php else: ?>
                  <button class="btn btn-primary btn-block"><?php echo($applicant["current_status"]); ?></button>
                <?php endif; ?>
                
                <Br> 
                <?php if($_SESSION["mariphil"]["role"] == "VALIDATOR"): ?>
                  <?php if($applicant["current_status"] == "APPLICANT - APPLIED"): ?>
                <div class="row">
                  <div class="col-md-6">
                    <a href="#" data-toggle="modal" data-target="#accept_modal" class="btn btn-success btn-block"><b>Verify</b></a>
                  </div>
                  <div class="col-md-6">
                    <a href="#" data-toggle="modal" data-target="#deny_modal" class="btn btn-danger  btn-block"><b>Deny</b></a>
                  </div>
                </div>
                <?php endif; ?>


                <?php if($applicant["current_status"] == "APPLICANT - VERIFIED"): ?>
                <div class="row">
                  <div class="col-md-6">
                    <a href="#" data-toggle="modal" data-target="#accept_modal" class="btn btn-success btn-block"><b>Interviewed</b></a>
                  </div>
                  <div class="col-md-6">
                    <a href="#" data-toggle="modal" data-target="#deny_modal" class="btn btn-danger  btn-block"><b>Deny</b></a>
                  </div>
                </div>
                <?php endif; ?>
                <?php endif; ?>


                <?php if($_SESSION["mariphil"]["role"] == "FACILITATOR"): ?>
                  <?php if($applicant["responsible"] == ""): ?>
                <div class="row">
                  <div class="col-md-12">
                    <form class="generic_form_trigger" data-url="scholars">
                    <input type="hidden" name="action" value="addResponsible">
                    <input type="hidden" name="scholar_id" value="<?php echo($_GET["id"]); ?>">
                    <button type="submit" class="btn btn-success btn-block"><b>ADD TO MY RESPONSIBILITY</b></button>
                    </form>
                  </div>
                </div>
                <?php endif; ?>
                <?php endif; ?>
              </div>
            </div>

            <?php
            // dump($applicant);
            if($applicant["current_status"] == "SCHOLAR"): ?>
              <div class="card card-primary">
              <div class="card-header " >
                <h3 class="card-title text-center clearfix" >About the Scholar</h3>
              </div>
              <!-- /.card-header -->
              <div class="card-body">
                <strong><i class="fas fa-briefcase mr-1"></i> Sponsor</strong>
                <p class="text-muted">
                  <?php echo($applicant["sponsor"]); ?>
                </p>
                <hr>
                <strong><i class="fas fa-map-marker-alt mr-1"></i> Facilitator</strong>
                <p class="text-muted"><?php echo($applicant["responsible_name"]); ?></p>
              </div>
              <!-- /.card-body -->
            </div>

            <?php endif; ?>
            

          
          </div>
          <div class="col-md-9">
            <div class="card">
              <div class="card-header p-2">
                <ul class="nav nav-pills">
                  <li class="nav-item"><a class="nav-link active" href="#activity" data-toggle="tab">Personal Info</a></li>
                  <li class="nav-item"><a class="nav-link" href="#timeline" data-toggle="tab">Documents</a></li>
                  <li class="nav-item"><a class="nav-link" href="#settings" data-toggle="tab">Application Status</a></li>
                  <li class="nav-item"><a class="nav-link" href="#forms" data-toggle="tab">Forms</a></li>
                </ul>
              </div>
              <div class="card-body">
                <div class="tab-content">
                  <div class="active tab-pane" id="activity">
                  <dl class="row">
                  <dt class="col-sm-4">Fullname</dt>
                  <dd class="col-sm-8"><?php echo($applicant["firstname"] . " " . $applicant["lastname"]); ?></dd>
                  <dt class="col-sm-4">Address</dt>
                  <dd class="col-sm-8">
                    <?php echo(

                      $applicant["address_home"] . ", " . $applicant["address_barangay"] . ", " .
                      $applicant["address_city"] . ", " . $applicant["address_province"] . ", " . 
                      $applicant["address_region"] . ", " . $applicant["address_zipcode"]
                      ); ?>
                  </dd>
                  <dt class="col-sm-4">Date of Birth</dt>
                  <dd class="col-sm-8"><?php echo($applicant["birthdate"]); ?></dd>

                  <dt class="col-sm-4">Place of Birth</dt>
                  <dd class="col-sm-8"><?php echo($applicant["birthplace"]); ?></dd>

                  <dt class="col-sm-4">Sex</dt>
                  <dd class="col-sm-8"><?php echo($applicant["sex"]); ?></dd>

                  <dt class="col-sm-4">Highest Educational Attainment</dt>
                  <dd class="col-sm-8"><?php echo($applicant["education_attainment"]); ?></dd>

                  <dt class="col-sm-4">School</dt>
                  <dd class="col-sm-8"><?php echo($applicant["name_school"]); ?></dd>
                
                  <br>
                  <br>

                  <dt class="col-sm-4">Father's Name</dt>
                  <dd class="col-sm-8"><?php echo($applicant["father_name"]); ?></dd>

                  <dt class="col-sm-4">Father's Date of Birth</dt>
                  <dd class="col-sm-8"><?php echo($applicant["father_birthdate"]); ?></dd>

                  <dt class="col-sm-4">Father's Address</dt>
                  <dd class="col-sm-8"><?php echo($applicant["father_address"]); ?></dd>

                  <dt class="col-sm-4">Father's Contact No.</dt>
                  <dd class="col-sm-8"><?php echo($applicant["father_contact"]); ?></dd>

                  <dt class="col-sm-4">Father's Occupation</dt>
                  <dd class="col-sm-8"><?php echo($applicant["father_occupation"]); ?></dd>

                  <dt class="col-sm-4">Work Place</dt>
                  <dd class="col-sm-8"><?php echo($applicant["father_occupation_address"]); ?></dd>

                  <dt class="col-sm-4">Highest Educational Attainment</dt>
                  <dd class="col-sm-8"><?php echo($applicant["father_education_attainment"]); ?></dd>

                  <dt class="col-sm-4">School</dt>
                  <dd class="col-sm-8"><?php echo($applicant["father_school"]); ?></dd>

                  <br>
                  <br>

                  <dt class="col-sm-4">Mother's Name</dt>
                  <dd class="col-sm-8"><?php echo($applicant["mother_name"]); ?></dd>

                  <dt class="col-sm-4">Mother's Date of Birth</dt>
                  <dd class="col-sm-8"><?php echo($applicant["mother_birthdate"]); ?></dd>

                  <dt class="col-sm-4">Mother's Address</dt>
                  <dd class="col-sm-8"><?php echo($applicant["mother_address"]); ?></dd>

                  <dt class="col-sm-4">Mother's Contact No.</dt>
                  <dd class="col-sm-8"><?php echo($applicant["mother_contact"]); ?></dd>

                  <dt class="col-sm-4">Mother's Occupation</dt>
                  <dd class="col-sm-8"><?php echo($applicant["mother_occupation"]); ?></dd>

                  <dt class="col-sm-4">Work Place</dt>
                  <dd class="col-sm-8"><?php echo($applicant["mother_occupation_address"]); ?></dd>

                  <dt class="col-sm-4">Highest Educational Attainment</dt>
                  <dd class="col-sm-8"><?php echo($applicant["mother_education_attainment"]); ?></dd>

                  <dt class="col-sm-4">School</dt>
                  <dd class="col-sm-8"><?php echo($applicant["mother_school"]); ?></dd>
                </dl>
                  </div>
                  <div class="tab-pane" id="timeline">
                  <table id="example1" class="table table-bordered table-striped">
                  <thead>
                  <tr>
                    <th>Document</th>
                    <th>Link</th>
                  </tr>
                  </thead>
                  <tbody>
                    <tr>  
                      <td>Family Picture</td>
                      <td><a target="_blank" class="btn btn-primary" href="<?php echo($applicant["family_picture"]); ?>">Open</a></td>
                    </tr>
                    <tr>  
                      <td>Barangay Clearance</td>
                      <td><a target="_blank" class="btn btn-primary" href="<?php echo($applicant["barangay_clearance"]); ?>">Open</a></td>
                    </tr>
                    <tr>  
                      <td>Certificate of Low Income</td>
                      <td><a target="_blank" class="btn btn-primary" href="<?php echo($applicant["low_income"]); ?>">Open</a></td>
                    </tr>
                    <tr>  
                      <td>Birth Certificate</td>
                      <td><a target="_blank" class="btn btn-primary" href="<?php echo($applicant["birth_certificate"]); ?>">Open</a></td>
                    </tr>
                    <tr>  
                      <td>Grade Card</td>
                      <td><a target="_blank" class="btn btn-primary" href="<?php echo($applicant["grade_card"]); ?>">Open</a></td>
                    </tr>
                  </tbody>
                  <tfoot>
                  <tr>
                    <th>Document</th>
                    <th>Link</th>
                  </tr>
                  </tfoot>
                </table>
                  </div>
                  <!-- /.tab-pane -->

                  <div class="tab-pane" id="settings">
                  <table id="example1" class="table table-bordered table-striped">
                  <thead>
                  <tr>
                    <th>Status</th>
                    <th>Person Responsible</th>
                    <th>Date Created</th>
                    <th>Time Created</th>
                    <th>Remarks</th>
                  </tr>
                  </thead>
                  <tbody>
                  <?php
                  $trackers = query("select t.status as current_status, t.*, u.* from scholar_tracker t
                  left join users u on u.user_id = t.user_id
                  where t.scholar_id = ?
                  order by date_created desc, time_created desc", $_GET["id"]);
                  foreach($trackers as $t):?>
                    <tr>
                      <td><?php echo($t["current_status"]); ?></td>
                      <td><?php echo(strtoupper($t["fullname"])); ?></td>
                      <td><?php echo(($t["date_created"])); ?></td>
                      <td><?php echo(($t["time_created"])); ?></td>
                      <td><?php echo(strtoupper($t["remarks"])); ?></td>
                    </tr>
                  <?php endforeach; ?>
                  </tbody>
                  <tfoot>
                  <tr>
                    <th>Action</th>
                    <th>Username / Email</th>
                    <th>Role</th>
                    <th>Fullname</th>
                    <th>Status</th>
                  </tr>
                  </tfoot>
                </table>

                  </div>


                  <div class="tab-pane" id="forms">
                  <table id="example1" class="table table-bordered table-striped">
                  <thead>
                  <tr>
                    <th>Action</th>
                    <th>Form</th>
                    <th>Year</th>
                    <th>Month</th>
                    <th>Status</th>
                    <th>Remarks</th>
                    <th>Check By</th>
                  </tr>
                  </thead>
                  <tbody>
                  <?php
                  $forms = query("select *,r.status as the_status from renewal r
                                  left join forms f
                                  on r.form_id = f.form_id
                                  left join users u 
                                  on u.user_id = r.remarks_by
                                  where scholar_id = ?", $_GET["id"]);
                    // dump($applicant);
                  foreach($forms as $f):?>
                    <tr>
                    <?php if($_SESSION["mariphil"]["role"] == "FACILITATOR"): ?>
                        <?php if($applicant["responsible"] == $_SESSION["mariphil"]["userid"]): ?>
                        <td>
                          <a href="#" class="btn btn-primary" data-toggle="modal" data-target="#viewRenewal_<?php echo($f["form_id"]); ?>">View</a>
                          <a href="#" data-id="<?php echo($f["form_id"]); ?>" class="btn btn-warning" data-toggle="modal" data-target="#check_<?php echo($f["form_id"]); ?>">Check</a>
                        </td> 
                        <?php else: ?>
                          <td>
                          <a href="#" class="btn btn-primary" data-toggle="modal" data-target="#viewRenewal_<?php echo($f["form_id"]); ?>">View</a>
                        </td> 

                        <?php endif; ?>
                      <?php else: ?>
                        <td>
                          <a href="#" class="btn btn-primary" data-toggle="modal" data-target="#viewRenewal_<?php echo($f["form_id"]); ?>">View</a>
                          <?php if($f["the_status"] != "CHECKED"): ?>
                          <a href="#" data-id="<?php echo($f["form_id"]); ?>" class="btn btn-warning" data-toggle="modal" data-target="#resubmitRenewal">ReSubmit</a>
                          <?php endif; ?>
                        </td> 
                        <?php endif; ?>
                      <td><?php echo($f["form_type"]); ?></td>
                      <td><?php echo($f["year"]); ?></td>
                      <td><?php echo($f["month"]); ?></td>
                      <td><?php echo($f["the_status"]); ?></td>
                      <td><?php echo($f["remarks"]); ?></td>
                      <td><?php echo($f["fullname"]); ?></td>
                    </tr>
                  <?php endforeach; ?>
                  </tbody>
                  <tfoot>
                  <tr>
                  <th width="25%">Action</th>
                    <th>Form</th>
                    <th>Year</th>
                    <th>Month</th>
                    <th>Status</th>
                    <th>Remarks</th>
                    <th>Check By</th>
                  </tr>
                  </tfoot>
                </table>

                  </div>
                  <!-- /.tab-pane -->
                </div>
                <!-- /.tab-content -->
              </div><!-- /.card-body -->
            </div>
            <!-- /.card -->
          </div>
          <!-- /.col -->
        </div>
        <!-- /.row -->
      </div><!-- /.container-fluid -->
    </section>
    <!-- /.content -->
  </div>

<script src="AdminLTE_new/plugins/datatables/jquery.dataTables.min.js"></script>
<script src="AdminLTE_new/plugins/datatables-bs4/js/dataTables.bootstrap4.min.js"></script>
<script src="AdminLTE_new/plugins/datatables-responsive/js/dataTables.responsive.min.js"></script>
<script src="AdminLTE_new/plugins/datatables-responsive/js/responsive.bootstrap4.min.js"></script>
<script src="AdminLTE_new/plugins/datatables-buttons/js/dataTables.buttons.min.js"></script>
<script src="AdminLTE_new/plugins/datatables-buttons/js/buttons.bootstrap4.min.js"></script>
<script src="AdminLTE_new/plugins/jszip/jszip.min.js"></script>
<script src="AdminLTE_new/plugins/pdfmake/pdfmake.min.js"></script>
<script src="AdminLTE_new/plugins/pdfmake/vfs_fonts.js"></script>
<script src="AdminLTE_new/plugins/datatables-buttons/js/buttons.html5.min.js"></script>
<script src="AdminLTE_new/plugins/datatables-buttons/js/buttons.print.min.js"></script>
<script src="AdminLTE_new/plugins/datatables-buttons/js/buttons.colVis.min.js"></script>
<script src="AdminLTE_new/plugins/sweetalert2/sweetalert2.min.js"></script>
<script src="AdminLTE_new/plugins/bs-custom-file-input/bs-custom-file-input.min.js"></script>

<script>
  $(function () {
    $("#example1").DataTable({
      "responsive": true, "lengthChange": false, "autoWidth": false,
    }).buttons().container().appendTo('#example1_wrapper .col-md-6:eq(0)');
    $('#example2').DataTable({
      "paging": true,
      "lengthChange": false,
      "searching": false,
      "ordering": true,
      "info": true,
      "autoWidth": false,
      "responsive": true,
    });
  });

  $(function () {
  bsCustomFileInput.init();
});


$('#resubmitRenewal').on('show.bs.modal', function(e) {

//get data-id attribute of the clicked element
var bookId = $(e.relatedTarget).data('id');

//populate the textbox
$(e.currentTarget).find('input[name="form_id"]').val(bookId);
});


// $(document).on("click", "#resubmitRenewal", function () {
//      var myBookId = $(this).data('id');
//      console.log(myBookId);
//      $(".modal-body #form_id").val( myBookId );
//      // As pointed out in comments, 
//      // it is unnecessary to have to manually call the modal.
//      // $('#addBookDialog').modal('show');
// });
</script>

  <?php require("layouts/footer.php") ?>