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
    <div class="modal fade" id="add_allowance">
        <div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-header bg-primary">
              <h4 class="modal-title">Generate Allowance</h4>
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
                <label for="exampleInputEmail1">School Year</label>
                <select readonly required name="sy" class="form-control select2" >
                  <option selected  value="<?php echo($sy[0]["school_year_id"]); ?>"><?php echo($sy[0]["school_year"]); ?></option>
                </select>
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
                    <th>School Year</th>
                    <th>Month Releasing</th>
                    <th>Facilitator</th>
                    <th>Claimed</th>
                    <th>Returned</th>
                    <th>Unreleased</th>
                  </tr>
                  </thead>
                  <tbody>
                  <?php
                  foreach($allowance as $row):
                  ?>
                    <tr>
                      <td>
                        <a href="allowance?action=details&id=<?php echo($row["allowance_id"]); ?>" class="btn btn-primary btn-sm">Update</a>
                        <form class="generic_form_trigger" data-url="allowance" style="display:inline;">
                          <input type="hidden" name="action" value="printAllowance">
                          <input type="hidden" value="<?php echo($row["allowance_id"]); ?>" name="allowance_id">
                          <button class="btn btn-warning btn-sm">Print</a>
                        </form>
                      </td>
                      <td><?php echo($row["school_year"]); ?></td>
                      <td><?php $monthName = date("F", mktime(0, 0, 0, $row["month"], 1)); echo($monthName); ?></td>
                      <td><?php echo($row["fullname"]); ?></td>
                      <td>
                        <?php $returned = 0; if(isset($List[$row["allowance_id"]]["RETURNED"])): ?>
                          <?php $returned =  $List[$row["allowance_id"]]["RETURNED"]; echo($returned);?>
                        <?php endif; ?>
                      </td>
                      <td>
                        <?php $claimed = 0; if(isset($List[$row["allowance_id"]]["CLAIMED"])): ?>
                          <?php $claimed =  $List[$row["allowance_id"]]["CLAIMED"]; echo($claimed);?>
                        <?php endif; ?>
                      </td>
                      <td>
                        <?php $for_releasing = 0; if(isset($List[$row["allowance_id"]]["FOR RELEASE"])): ?>
                          <?php $for_releasing =  $List[$row["allowance_id"]]["FOR RELEASE"]; echo($for_releasing);?>
                        <?php endif; ?>
                      </td>
           
                      
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