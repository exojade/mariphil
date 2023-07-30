<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1>Dashboard</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item"><a href="#">Layout</a></li>
              <li class="breadcrumb-item active">Fixed Layout</li>
            </ol>
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
           
            <!-- /.card -->
          </div>


          <div class="col-8">
            <!-- Default box -->
            <div class="card">
              <div class="card-header">
                <h3 class="card-title">Track my Application Status</h3>

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
                    <th>Status</th>
                    <th>Date</th>
                    <th>Time</th>
                    <th>Remarks</th>
                    <th>Responsible</th>
                  </thead>
                  <?php $scholar_tracker = query("select s.*, u.fullname as responsible from scholar_tracker s
                                                    left join users u
                                                    on u.user_id = s.user_id
                                                    where scholar_id = ? order by timestamp desc", $_SESSION["mariphil"]["userid"]); ?>
                  <?php foreach($scholar_tracker as $st):
                    if($st["status"] == "APPLICANT - IN REVIEW")
                    $st["responsible"] = "";
                    ?>
                    <tr>
                        <td><?php echo($st["status"]); ?></td>
                        <td><?php echo($st["date_created"]); ?></td>
                        <td><?php echo($st["time_created"]); ?></td>
                        <td><?php echo($st["remarks"]); ?></td>
                        <td><?php echo($st["responsible"]); ?></td>
                    </tr>
                  <?php endforeach; ?>
                </table>
              </div>
              <!-- /.card-body -->
            
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