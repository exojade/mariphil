<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1>Dashboard</h1>
          </div>
       
        </div>
      </div><!-- /.container-fluid -->
    </section>
    <?php $scholar = query("select * from scholars where scholar_id = ?", $_SESSION["mariphil"]["userid"]);
    $scholar = $scholar[0];
    
    ?>

    <!-- Main content -->
    <section class="content">
      <div class="container-fluid">
        <div class="row">
          <div class="col-4">
            <!-- Default box -->
            <?php if($scholar["current_status"] == "APPLICANT - DENIED"): ?>
              <div class="alert alert-danger alert-dismissible">
                  <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                  <h5><i class="icon fas fa-info"></i> Current Status!</h5>
                  Your current status is <?php echo($scholar["current_status"]); ?>
                </div>
            <?php else: ?>
              <div class="alert alert-info alert-dismissible">
                  <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                  <h5><i class="icon fas fa-info"></i> Current Status!</h5>
                  Your current status is <?php echo($scholar["current_status"]); ?>
                </div>
            <?php endif; ?>


            <div class="card">
              <div class="card-header">
                <h3 class="card-title">Pending Reports needed to submit</h3>
              </div>
              <div class="card-body">
                <?php $forms = query("select * from renewal r
                              left join forms f
                              on f.form_id = r.form_id
                where r.scholar_id = ? and status in ('SUBMITTED', 'FOR CHECKING')", $_SESSION["mariphil"]["userid"]); ?>
                <table class="table table-striped">
                  <thead>
                    <th>Form</th>
                    <th>Status</th>
                  </thead>
                  <tbody>
                    <?php 
                    // dump($forms);
                    foreach($forms as $row): ?>
                      <tr>
                        <td><?php echo($row["form_type"]); ?></td>
                        <td><?php echo($row["status"]); ?></td>
                      </tr>
                    <?php endforeach; ?>

                  </tbody>
                </table>
              </div>
              <!-- /.card-body -->
              <div class="card-footer">
              
              </div>
              <!-- /.card-footer-->
            </div>


           
            <!-- /.card -->
          </div>


          <div class="col-8">
            <!-- Default box -->
            <div class="card">
              <div class="card-header">
                <h3 class="card-title">Announcements</h3>

                <div class="card-tools">
                  <button type="button" class="btn btn-tool" data-card-widget="collapse" title="Collapse">
                    <i class="fas fa-minus"></i>
                  </button>
                  <button type="button" class="btn btn-tool" data-card-widget="remove" title="Remove">
                    <i class="fas fa-times"></i>
                  </button>
                </div>
              </div>
              <div class="card-body">
                <table class="table table-striped">
                  <thead>
                    <th>Announcement</th>
                    <th>Date</th>
                    <th>Time</th>
                  </thead>
             
                </table>
              </div>
              <!-- /.card-body -->
              <div class="card-footer">
              </div>
              <!-- /.card-footer-->
            </div>
            <!-- /.card -->
          </div>
        </div>
      </div>
    </section>
    <!-- /.content -->
  </div>
  <?php require("layouts/footer.php") ?>