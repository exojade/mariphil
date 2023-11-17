<link rel="stylesheet" href="AdminLTE_new/plugins/sweetalert2-theme-bootstrap-4/bootstrap-4.min.css">

<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1>Forms</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <?php if($_SESSION["mariphil"]["role"] != "SCHOLAR"): ?>
               <button type="button" class="btn btn-primary btn-flat" data-toggle="modal" data-target="#add_user">ADD FORM</button>
              <?php endif; ?>
          </ol>
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
              <h4 class="modal-title">Add Form</h4>
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
            <div class="modal-body">
              <form class="generic_form_trigger" data-url="forms">
              <input type="hidden" name="action" value="addQuarterlyMonitoring">
              <div class="form-group">
                <label for="exampleInputEmail1">Form Type</label>
                <select disabled required name="form_type" class="form-control select2" >
                  <option selected disabled value="">Please select Form Type</option>
                  <option value="RENEWAL">RENEWAL</option>
                  <option value="MONTHLY">MONTHLY</option>
                  <option selected value="QUARTERLY">QUARTERLY</option>
                </select>
              </div>

              <?php $sy = query("select * from school_year where current_status = 'active'"); ?>

              <div class="form-group">
                <label for="exampleInputEmail1">School Year</label>
                <select readonly required name="sy" class="form-control select2" >
                  <option selected  value="<?php echo($sy[0]["school_year_id"]); ?>"><?php echo($sy[0]["school_year"]); ?></option>
                </select>
              </div>



              <div class="form-group">
                <label for="exampleInputEmail1">Quarter</label>
                <select required name="form_kind" class="form-control select2" >
                  <option selected disabled value="">Please select Type of Quarter Report</option>
                  <option value="FIRST QUARTER">FIRST QUARTER</option>
                  <option value="SECOND QUARTER">SECOND QUARTER</option>
                  <option value="THIRD QUARTER">THIRD QUARTER</option>
                  <option value="FOURTH QUARTER">FOURTH QUARTER</option>
                </select>
              </div>


             
            </div>
            <div class="modal-footer justify-content-between">
              <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
              <button type="submit" class="btn btn-primary">Save changes</button>
            </div>
          </div>
          <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
      </div>



      <div class="container-fluid">
        <div class="row">
          <div class="col-12">
            <!-- Default box -->
            <div class="card">
              <div class="card-header">
              </div>
              <!-- /.card-header -->
              <div class="card-body">
                <table id="example1" class="table table-bordered table-striped">
                  <thead>
                  <tr>
                    <th>Action</th>
                    <th>Form</th>
                    <th>School Year</th>
                    <th>Type</th>
                    <th>Date Created</th>
                    <th>Time Created</th>
                  </tr>
                  </thead>
                  <tbody>
                  <?php
                  foreach($forms as $f):
     
                  
                  ?>
                    <tr>
                      <td>
                        <a href="forms?action=details&id=<?php echo($f["form_id"]); ?>" class="btn btn-primary btn-sm btn-block">View Submission</a>
                      </td>
                      <td><?php echo($f["form_type"]); ?></td>
                      <td><?php echo($f["school_year"]); ?></td>
                      <td><?php echo($f["form_kind"]); ?></td>
                      <td><?php echo($f["date_created"]); ?></td>
                      <td><?php echo($f["time_created"]); ?></td>
           
                      
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