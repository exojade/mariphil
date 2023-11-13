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
            <div class="modal-header bg-primary">
              <h4 class="modal-title">New Renewal Portal</h4>
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
            <div class="modal-body">
              <form class="generic_form_trigger" data-url="renewal">
              <input type="hidden" name="action" value="addRenewalForm">
              <input type="hidden" name="facilitator" value="<?php echo($_SESSION["mariphil"]["userid"]); ?>">
              <?php $sy = query("select * from school_year where current_status = 'active'"); ?>
              <div class="form-group">
                <label for="exampleInputEmail1">School Year</label>
                <select readonly required name="sy" class="form-control select2" >
                  <option selected  value="<?php echo($sy[0]["school_year_id"]); ?>"><?php echo($sy[0]["school_year"]); ?></option>
                </select>
              </div>

              <?php $sy = query("select * from school_year where idd > ?", $sy[0]["idd"]); ?>
              <div class="form-group">
                <label for="exampleInputEmail1">Renew for School Year</label>
                <select required name="renew_sy" class="form-control select2">
                  <option selected disabled value="">Please select school year to be renewed</option>
                  <?php foreach($sy as $row): ?>
                    <option value="<?php echo($row["school_year_id"]); ?>"><?php echo($row["school_year"]); ?></option>
                  <?php endforeach; ?>
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
                    <th>Current SY</th>
                    <th>Renew SY</th>
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
                        <a href="renewal?action=details&id=<?php echo($f["form_id"]); ?>" class="btn btn-warning">Details</a>
                      </td>
                      <td>RENEWAL PORTAL</td>
                      <td><?php echo($f["current_sy"]); ?></td>
                      <td><?php echo($f["for_sy"]); ?></td>
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