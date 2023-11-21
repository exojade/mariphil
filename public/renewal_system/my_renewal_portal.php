<link rel="stylesheet" href="AdminLTE_new/plugins/sweetalert2-theme-bootstrap-4/bootstrap-4.min.css">

<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1>Forms</h1>
          </div>
       
        </div>
      </div><!-- /.container-fluid -->
    </section>

    <!-- Main content -->
    <section class="content">



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
                    <th>Target SY Renewal</th>
                    <th>Date Created</th>
                    <th>Time Created</th>
                    <th>Status</th>
                  </tr>
                  </thead>
                  <tbody>
                  <?php
                  foreach($forms as $f):
     
                  
                  ?>
                    <tr>
                      <td>
                        <?php if($f["form_status"] == "DONE"): ?>
                        <a href="renewal?action=scholar_details&id=<?php echo($f["renewal_id"]); ?>" class="btn btn-warning">View</a>
                        <?php else: ?>
                        <a href="renewal?action=scholar_details&id=<?php echo($f["renewal_id"]); ?>" class="btn btn-warning">Update</a>
                        <?php endif; ?>
                      </td>
                      <td>Renewal Portal</td>
                      <td><?php echo($f["current_sy"]); ?></td>
                      <td><?php echo($f["renew_sy"]); ?></td>
                      <td><?php echo($f["date_created"]); ?></td>
                      <td><?php echo($f["time_created"]); ?></td>
                      <td><?php
                      if($f["form_status"] == "DONE"):
                        echo("RENEWED");
                      else:
                      echo($f["form_status"]); 
                      endif;
                      
                      ?></td>
                      
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