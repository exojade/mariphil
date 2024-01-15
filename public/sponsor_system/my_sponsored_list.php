<link rel="stylesheet" href="AdminLTE_new/plugins/sweetalert2-theme-bootstrap-4/bootstrap-4.min.css">

<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1>List of Sponsored Scholars</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
            </ol>
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


              <div class="row">
              <div class="col-md-6">

              </div>
              <div class="col-md-6">
            <form class="generic_form_no_trigger_and_result" data-url="sponsor">
            <input type="hidden" name="action" value="sponsorFilterSY">
            <!-- <input type="hidden" name="action" value="filterSY"> -->
            <div class="row">
              <div class="col-md-6">
              <div class="form-group">
              <?php $school_year = query("select * from school_year order by idd desc"); ?>
                        <select name="school_year" class="form-control">
                          <option selected value="">Select School Year</option>
                          <?php foreach($school_year as $row): ?>
                            <?php if($row["current_status"] == "active"): ?>
                              <?php if(isset($_GET["school_year"]) && $_GET["school_year"] == $row["school_year_id"]): ?>
                                <option selected value="<?php echo($row["school_year_id"]); ?>"><?php echo($row["school_year"] . " (current)"); ?></option>
                              <?php else: ?>
                                <option value="<?php echo($row["school_year_id"]); ?>"><?php echo($row["school_year"] . " (current)"); ?></option>
                              <?php endif; ?>
                            <?php else: ?>
                              <?php if(isset($_GET["school_year"]) && $_GET["school_year"] == $row["school_year_id"]): ?>
                                <option selected value="<?php echo($row["school_year_id"]); ?>"><?php echo($row["school_year"]); ?></option>
                              <?php else: ?>
                                <option value="<?php echo($row["school_year_id"]); ?>"><?php echo($row["school_year"]); ?></option>
                              <?php endif; ?>
                              
                            <?php endif; ?>
                          <?php endforeach; ?>
                        </select>
                      </div>
              </div>
              <div class="col-md-6">
                <button type="submit" class="btn btn-primary btn-block">Filter</button>
                
              </div>

            </div>
            </form>
              </div>

            </div>



              </div>
              <!-- /.card-header -->
              <div class="card-body">
                <table id="example1" class="table table-bordered table-striped">
                  <thead>
                  <tr>
                    <th>Action</th>
                    <th>Fullname</th>
                    <th>School</th>
                    <th>Year</th>
                    <th>Type</th>
                    <th>Course</th>
                    <th>SY</th>
                    <th>Facilitator</th>
                  </tr>
                  </thead>
                  <tbody>
                  <?php
         
                  foreach($list as $l):  ?>
                    <tr>
                      <td>
                        <a href="scholars?action=details&id=<?php echo($l["scholar_id"]); ?>" class="btn btn-warning btn-xs">View</a>
                      </td>
                      <td><?php echo(strtoupper($l["lastname"] . ", " . $l["firstname"])); ?></td>
                      <td><?php echo(strtoupper($l["school_name"])); ?></td>
                      <td><?php echo(strtoupper($l["year_level"])); ?></td>
                      <td><?php echo(strtoupper($l["year_type"])); ?></td>
                      <td><?php echo(strtoupper($l["course"])); ?></td>
                      <td><?php echo(strtoupper($l["school_year"])); ?></td>
                      <td><?php echo(strtoupper($l["fullname"])); ?></td>

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