<style>
.content-wrapper{
  font-size: 75%;
}

  </style>

<link rel="stylesheet" href="AdminLTE_new/plugins/sweetalert2-theme-bootstrap-4/bootstrap-4.min.css">

<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1>Allowance List</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
            <button type="button" class="btn btn-primary btn-flat" data-toggle="modal" data-target="#add_allowance">GENERATE ALLOWANCE</button>
            </ol>
          </div>
        </div>
      </div><!-- /.container-fluid -->
    </section>

    <!-- Main content -->
    <section class="content">

    <?php foreach($scholars as $row): ?>
      <div class="modal fade" id="modalClaim<?php echo($row["scholar_id"]); ?>">
        <div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-header bg-primary">
              <h4 class="modal-title">Claim Allowance</h4>
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
            <div class="modal-body">
              <form class="generic_form_trigger" data-url="allowance">
              <input type="hidden" name="action" value="claimAllowance">
              <input type="hidden" name="facilitator" value="<?php echo($_SESSION["mariphil"]["userid"]); ?>">
              <?php $sy = query("select * from school_year where current_status = 'active'"); ?>
              <div class="form-group">
                <label for="exampleInputEmail1">Scholar Full Name</label>
                <input type="text" disabled value="<?php echo($row["fullname"]); ?>" class="form-control">
              </div>

              <div class="form-group">
                <label for="exampleInputEmail1">Allowance Amount</label>
                <input type="text" disabled value="<?php echo(to_peso($row["amount"])); ?>" class="form-control">
              </div>

              <div class="form-group">
                <label for="exampleInputEmail1">Date Claimed by the Scholar</label>
                <input type="date" required name="dateClaimed" class="form-control" id="exampleInputEmail1" placeholder="...">
              </div>

          
            </div>
            <div class="modal-footer justify-content-between">
              <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
              <button type="submit" class="btn btn-primary">Save changes</button>
                  </form>
            </div>
          </div>
          <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
      </div>

      <div class="modal fade" id="modalReturn<?php echo($row["scholar_id"]); ?>">
        <div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-header bg-primary">
              <h4 class="modal-title">Update Status</h4>
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
            <div class="modal-body">
              <form class="generic_form_trigger" data-url="allowance">
              <input type="hidden" name="action" value="addAllowance">
              <input type="hidden" name="facilitator" value="<?php echo($_SESSION["mariphil"]["userid"]); ?>">
              <?php $sy = query("select * from school_year where current_status = 'active'"); ?>
              <div class="form-group">
                <label for="exampleInputEmail1">Scholar Full Name</label>
                <input type="text" disabled value="<?php echo($row["fullname"]); ?>" class="form-control">
              </div>

              <?php $sy = query("select * from school_year where idd > ?", $sy[0]["idd"]); ?>
              <div class="form-group">
                <label for="exampleInputEmail1">Renew for School Year</label>
                <select id="month" name="month" class="form-control select2">
                <?php
                  for ($i = 1; $i <= 12; $i++) {
                      $monthValue = sprintf("%02d", $i);
                      $selected = (date("m") == $monthValue) ? 'selected' : '';
                      echo "<option value=\"$monthValue\" $selected>" . date("F", mktime(0, 0, 0, $i, 1)) . "</option>";
                  }
                ?>
                </select>
              </div>
            </div>
            <div class="modal-footer justify-content-between">
              <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
              <button type="submit" class="btn btn-primary">Save changes</button>
                  </form>
            </div>
          </div>
          <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
      </div>
    <?php endforeach;?>
   



      <div class="container-fluid">
        <div class="row">

          <div class="col-3">
          <div class="card card-primary card-outline">
              <div class="card-body box-profile">
                <h3 class="profile-username text-center">Allowance Table</h3>
                <ul class="list-group list-group-unbordered mb-3">
                  <li class="list-group-item">
                    <b>School Year</b> <a class="float-right"><?php echo($allowance["school_year"]); ?></a>
                  </li>
                  <li class="list-group-item">
                    <b>Month</b> <a class="float-right"><?php echo(date("F", mktime(0, 0, 0, $allowance["month"], 1))); ?></a>
                  </li>
                  <li class="list-group-item">
                    <b>Facilitator</b> <a class="float-right"><?php echo($allowance["fullname"]); ?></a>
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
              </div>
              <!-- /.card-header -->
              <div class="card-body">
                <table id="example1" class="table table-bordered table-striped">
                  <thead>
                  <tr>
                    <th width="15%">Action</th>
                    <th>Scholar</th>
                    <th>Level</th>
                    <th>Level Type</th>
                    <th>Course</th>
                    <th>Amount</th>
                    <th>Status</th>
                  </tr>
                  </thead>
                  <tbody>
                  <?php
                  foreach($scholars as $row):
                  ?>
                    <tr>
                      <td>
                        <?php if($row["status"] == "FOR RELEASE"): ?>
                          <a href="#" data-toggle="modal" data-target="#modalClaim<?php echo($row["scholar_id"]); ?>" class="btn btn-primary btn-xs">Claim</a>
                          <a href="#" data-toggle="modal" data-target="#modalReturn<?php echo($row["scholar_id"]); ?>" class="btn btn-warning btn-xs">Return</a>
                        <?php endif; ?>
                        <?php if($row["status"] == "CLAIMED"): ?>
                          <form class="generic_form_trigger" data-url="allowance">
                            <input type="hidden" name="action" value="reverAllowance">
                            <input type="hidden" name="scholar_id" value="<?php echo($row["scholar_id"]); ?>">
                            <input type="hidden" name="allowance_id" value="<?php echo($_GET["id"]); ?>">
                            <button class="btn btn-danger btn-xs" type="submit">Revert</a>
                          </form>
                          <?php endif; ?>
                        <?php if($row["status"] == "RETURNED"): ?>
                          <form class="generic_form_trigger" data-url="allowance">
                            <input type="hidden" name="action" value="reverAllowance">
                            <input type="hidden" name="scholar_id" value="<?php echo($row["scholar_id"]); ?>">
                            <input type="hidden" name="allowance_id" value="<?php echo($_GET["id"]); ?>">
                            <button class="btn btn-danger btn-xs" type="submit">Revert</a>
                          </form>
                        <?php endif; ?>
                      </td>
                      <td><?php echo($row["fullname"]); ?></td>
                      <td><?php echo($row["year_level"]); ?></td>
                      <td><?php echo($row["year_type"]); ?></td>
                      <td><?php echo($row["course"]); ?></td>
                      <td><?php echo($row["amount"]); ?></td>
                      <td><?php echo($row["status"]); ?></td>
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