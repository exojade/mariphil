<link rel="stylesheet" href="AdminLTE_new/plugins/sweetalert2-theme-bootstrap-4/bootstrap-4.min.css">

<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1>Form Details</h1>
          </div>
       
        </div>
      </div><!-- /.container-fluid -->
    </section>

    <!-- Main content -->
    <section class="content">
    <div class="modal fade" id="add_user">
        <div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-header">
              <h4 class="modal-title">Default Modal</h4>
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
            <div class="modal-body">
              <form class="generic_form_trigger" data-url="forms">
              <input type="hidden" name="action" value="addForm">
              <div class="form-group">
                <label for="exampleInputEmail1">Form Type</label>
                <select required name="form_type" class="form-control select2" >
                  <option selected disabled value="">Please select Form Type</option>
                  <option value="RENEWAL">RENEWAL</option>
                  <option value="MONTHLY">MONTHLY</option>
                  <option value="QUARTERLY">QUARTERLY</option>
                </select>
              </div>

              <div class="form-group">
                <label for="exampleInputEmail1">Year</label>
                <input required type="number" value="<?php echo(date("Y")); ?>" name="year" class="form-control" id="exampleInputEmail1" placeholder="---">
              </div>

              <div class="form-group">
                <label for="exampleInputEmail1">Month</label>
                <select required name="month" class="form-control select2" >
                  <option selected disabled value="">Please select Month</option>
                  <option value="01">JANUARY</option>
                  <option value="02">FEBRUARY</option>
                  <option value="03">MARCH</option>
                  <option value="04">APRIL</option>
                  <option value="05">MAY</option>
                  <option value="06">JUNE</option>
                  <option value="07">JULY</option>
                  <option value="08">AUGUST</option>
                  <option value="09">SEPTEMBER</option>
                  <option value="10">OCTOBER</option>
                  <option value="11">NOVEMBER</option>
                  <option value="12">DECEMBER</option>
                
                </select>
              </div>

             
            </div>
            <div class="modal-footer justify-content-between">
              <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
              <button type="submit" class="btn btn-primary">Save changes</button>
            </div>
</form>
          </div>
          <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
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




     <div class="modal fade" id="modal_add_child">
          <div class="modal-dialog">
            <div class="modal-content">
              <div class="modal-header bg-primary">
                <h3 class="modal-title">Add Achievement</h3>
              </div>
              <div class="modal-body">
                <form role="form" class="generic_form_trigger" data-url="forms">
                  <input type="hidden" name="action" value="add_achievement">
                  <input type="hidden" name="tbl_id" value="<?php echo($_GET["id"]); ?>">
                  <div class="form-group">
                      <label for="exampleInputBorderWidth2">Achievement</label>
                      <input required name="achievement" type="text" class="form-control form-control-border border-width-2">
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


      <div class="modal fade" id="modal_add_image">
          <div class="modal-dialog">
            <div class="modal-content">
              <div class="modal-header bg-primary">
                <h3 class="modal-title">Add Photos for Support</h3>
              </div>
              <div class="modal-body">
                <form role="form" class="generic_form_trigger" data-url="forms">
                  <input type="hidden" name="action" value="add_photo">
                  <input type="hidden" name="tbl_id" value="<?php echo($_GET["id"]); ?>">
                  <div class="form-group">
                    <label for="exampleInputFile">Upload Photo</label>
                    <div class="input-group">
                      <div class="custom-file">
                        <input required="" type="file" class="custom-file-input" id="exampleInputFile">
                        <label class="custom-file-label" for="exampleInputFile">Choose file</label>
                      </div>
                      <div class="input-group-append">
                        <span class="input-group-text">Upload</span>
                      </div>
                    </div>
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
          <div class="col-3">
          <div class="card card-primary card-outline">
              <div class="card-body box-profile">
                <h3 class="profile-username text-center"><?php echo($form["form_type"]); ?></h3>
                <ul class="list-group list-group-unbordered mb-3">
                  <li class="list-group-item">
                    <b>Type</b> <a class="float-right"><?php echo($form["form_kind"]); ?></a>
                  </li>
                  <li class="list-group-item">
                    <b>School Year</b> <a class="float-right"><?php echo($form["school_year_id"]); ?></a>
                  </li>
                </ul>
              </div>
              <!-- /.card-body -->
            </div>

          </div>
          <div class="col-9">
            <!-- Default box -->
            <div class="card">
            <form class="generic_form_trigger" id="quarterly_form" data-url="quarterly">
            <input type="hidden" name="action" value="update_form">
            <input type="hidden" name="form_id" value="<?php echo($_GET["id"]); ?>">
            <div class="card-header p-2">
                          <h3 class="card-title">Grade Form</h3>
                          <div class="card-tools" style="margin-right:10px;">
                          <button class="btn btn-primary btn-update" type="button">Update</button>
                          <button style="display: none;" class="btn btn-success btn-save" type="submit">Save</button>
                          <button style="display: none;" class="btn btn-danger btn-cancel" type="button">Cancel</button>
                          </div>
                        </div>
              <div class="card-body">
                  <div class="form-group">
                    <label>Grades</label>
                    <input readonly required name="awit" type="number" step="0.01" class="form-control form-control-border border-width-2"  placeholder="Enter GPA / GWA here..">
                  </div>
                  <div class="form-group">
                    <label for="exampleInputFile">Upload Grade Card</label>
                    <div class="input-group">
                      <div class="custom-file">
                        <input required disabled type="file" class="custom-file-input" id="exampleInputFile">
                        <label class="custom-file-label" for="exampleInputFile">Choose file</label>
                      </div>
                      <div class="input-group-append">
                        <span class="input-group-text">Upload</span>
                      </div>
                    </div>
                  </div>
                  <?php if($form["grade_card_upload"] != ""): ?>
                    <div class="form-check">
                    <label class="form-check-label" for="exampleCheck1"><a href="<?php echo($form["grade_card_upload"]); ?>">Grade Card File</a></label>
                  </div>
                  <?php endif; ?>
          
                  
                </div>
              </form>
             
            </div>


            <div class="card">
       
            <div class="card-header p-2">
                          <h3 class="card-title">Achievements</h3>
                          <div class="card-tools" style="margin-right:10px;">
                            <button data-toggle="modal" data-target="#modal_add_child" class="btn btn-primary btn-save">Add</button>
                          </div>
                        </div>
              <div class="card-body">
                <table class="table table-bordered">
                  <thead>
                    <th width="10%">Action</th>
                    <th>Achievement</th>
                  </thead>
                  <tbody>
                    <?php foreach($form_achievements as $row): ?>
                      <tr>
                        <td>
                          <form class="generic_form_trigger" data-url="forms">
                          <input type="hidden" name="action" value="delete_achievement">
                          <input type="hidden" name="achievement_id" value="<?php echo($row["achievement_id"]); ?>">
                          <button type="submit" class="btn btn-danger btn-block">Delete</button>
                    </form>
                        </td>
                        <td><?php echo($row["achievement"]); ?></td>
                      </tr>
                    <?php endforeach; ?>
                  </tbody>

                </table>
               
      
                </div>
            </div>


            <div class="card">
      
            <div class="card-header p-2">
                          <h3 class="card-title">Photos of Achievements</h3>
                          <div class="card-tools" style="margin-right:10px;">
                            <button data-toggle="modal" data-target="#modal_add_image" class="btn btn-primary btn-save" type="submit">Add</button>
                          </div>
                        </div>
              <div class="card-body">

              <table class="table table-bordered">
                  <thead>
                    <th width="10%">Action</th>
                    <th>Photo</th>
                  </thead>
                  <tbody>
                    <?php foreach($form_uploads as $row): ?>
                      <tr>
                        <td>
                          <form class="generic_form_trigger" data-url="forms">
                          <input type="hidden" name="action" value="delete_photo">
                          <input type="hidden" name="achievement_id" value="<?php echo($row["upload_id"]); ?>">
                          <button type="submit" class="btn btn-danger btn-block">Delete</button>
                    </form>
                        </td>
                        <td><?php echo($row["achievement"]); ?></td>
                        <td><img style="border: 2px solid black;" src="<?php echo($row["upload_file"]); ?>" width="50" height="50"></td>
                      </tr>
                    <?php endforeach; ?>
                  </tbody>

                </table>
      
                </div>
            </div>
            <!-- /.card -->
          </div>
        </div>
      </div>
    </section>
    <!-- /.content -->
  </div>

  <script src="AdminLTE_new/plugins/sweetalert2/sweetalert2.min.js"></script>
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

    </script>
  <?php require("layouts/footer.php") ?>