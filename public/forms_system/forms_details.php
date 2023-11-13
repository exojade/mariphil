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




      <div class="container-fluid">
        <div class="row">
          <div class="col-3">
          <div class="card card-primary card-outline">
              <div class="card-body box-profile">
                <h3 class="profile-username text-center"><?php echo($forms["form_type"]); ?></h3>
                <ul class="list-group list-group-unbordered mb-3">
                  <li class="list-group-item">
                    <b>Type</b> <a class="float-right"><?php echo($forms["form_kind"]); ?></a>
                  </li>
                  <li class="list-group-item">
                    <b>School Year</b> <a class="float-right"><?php echo($forms["school_year"]); ?></a>
                  </li>
                </ul>
              </div>
              <!-- /.card-body -->
            </div>

          </div>
          <div class="col-9">
            <!-- Default box -->
            <div class="card">
              <div class="card-header">
                <h3>List of Scholars</h3>
              </div>
              <!-- /.card-header -->
              <div class="card-body">
                <table id="example1" class="table table-bordered table-striped">
                  <thead>
                  <tr>
                    <th width="16%">Action</th>
                    <th>Scholar</th>
                    <th>Status</th>
                    <th>Grade</th>
                    <th>Remarks</th>
                  </tr>
                  </thead>
                  <tbody>
                  <?php
                  foreach($scholars as $row):
                  ?>
                    <tr>
                      <td>
                   <a href="forms?action=scholar_details&id=<?php echo($row["tbl_id"]); ?>" class="btn btn-primary"><i class="fa fa-eye"></i></a>
                   <a class="btn btn-warning"><i class="fa fa-pen"></i></a>
                        
                        
                      </td>
                      <td><?php echo($row["lastname"] . ", " . $row["firstname"]); ?></td>
                      <td><?php echo($row["form_status"]); ?></td>
                      <td><?php echo($row["grades"]); ?></td>
                      <td><?php echo($row["remarks"]); ?></td>
                     
                    </tr>
                  <?php endforeach; ?>
                  </tbody>
                  
                </table>
              </div>
              <!-- /.card-body -->
            </div>
            <!-- /.card -->
          </div>
        </div>
      </div>
    </section>
    <!-- /.content -->
  </div>

  <script src="AdminLTE_new/plugins/sweetalert2/sweetalert2.min.js"></script>
  <?php require("layouts/footer.php") ?>