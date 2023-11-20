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


         


           
            <!-- /.card -->
          </div>


          <div class="col-8">
            <!-- Default box -->
            <div class="card">
              <div class="card-header">
                <h3 class="card-title">Pending Quarterly Form needed to submit</h3>
              </div>
              <div class="card-body">
                <?php $forms = query("select * from monthly_monitoring m
                              left join forms f
                              on f.form_id = m.form_id
                where m.scholar_id = ? and m.form_status in ('FOR SUBMISSION', 'RETURNED')", $_SESSION["mariphil"]["userid"]); ?>
                <table class="table table-striped table-bordered">
                  <thead>
                    <th>Action</th>
                    <th>Form</th>
                    <th>Type</th>
                    <th>Status</th>
                  </thead>
                  <tbody>
                    <?php 
                    // dump($forms);
                    foreach($forms as $row): ?>
                      <tr>
                        <td><a class="btn btn-xs btn-primary btn-block" href="forms?action=scholar_details&id=<?php echo($row["tbl_id"]); ?>">Update</a></td>
                        <td><?php echo($row["form_type"]); ?></td>
                        <td><?php echo($row["form_kind"]); ?></td>
                        <td><?php echo($row["form_status"]); ?></td>
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


            <div class="card">
              <div class="card-header">
                <h3 class="card-title">Pending Renewal Form needed to submit</h3>
              </div>
              <div class="card-body">
              <?php $forms = query("select r.*,f.*,sy.school_year from renewal r
                              left join renewal_form f
                              on f.form_id = r.form_id
                              left join school_year sy
                              on sy.school_year_id = f.for_school_year_id
                where r.scholar_id = ? and r.form_status in ('FOR SUBMISSION', 'RETURNED')", $_SESSION["mariphil"]["userid"]); ?>
                <table class="table table-striped">
                  <thead>
                    <th></th>
                    <th>Target SY</th>
                    <th>Status</th>
                  </thead>
                  <tbody>
                    <?php 
                    // dump($forms);
                    foreach($forms as $row): ?>
                      <tr>
                        <td><a class="btn btn-xs btn-primary btn-block" href="renewal?action=scholar_details&id=<?php echo($row["renewal_id"]); ?>">Update</a></td>
                        <td><?php echo($row["school_year"]); ?></td>
                        <td><?php echo($row["form_status"]); ?></td>
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
        </div>
      </div>
    </section>
    <!-- /.content -->
  </div>
  <?php require("layouts/footer.php") ?>