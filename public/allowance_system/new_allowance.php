<style>
/* .content-wrapper{
  font-size: 75%;
} */

  </style>

<link rel="stylesheet" href="AdminLTE_new/plugins/sweetalert2-theme-bootstrap-4/bootstrap-4.min.css">

<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1>New Allowance</h1>
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
        <form class="generic_form_trigger" data-url="allowance">
        <input type="hidden" name="action" value="addAllowance">
              <input type="hidden" name="facilitator" value="<?php echo($_SESSION["mariphil"]["userid"]); ?>">
        <div class="row">

          <div class="col-12">
          <div class="card card-primary card-outline">
              <div class="card-body box-profile">
                <div class="row">
                <?php $sy = query("select * from school_year where current_status = 'active'"); ?>
              <div class="col-md-6">
                <div class="form-group">
                  <label for="exampleInputEmail1">School Year</label>
                  <select readonly required name="sy" class="form-control select2" >
                    <option selected  value="<?php echo($sy[0]["school_year_id"]); ?>"><?php echo($sy[0]["school_year"]); ?></option>
                  </select>
                </div>
              </div>

              <?php $sy = query("select * from school_year where idd > ?", $sy[0]["idd"]); ?>
              <div class="col-md-6">
              <div class="form-group">
                <label for="exampleInputEmail1">Month Allowance Released</label>
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
                </div>
                <!-- <h3 class="profile-username text-center">Generate Allowance</h3> -->
                <table class="table table-bordered">
                  <thead>
                  <th>Amount</th>
                    <th>Year Level</th>
                    <th>Type</th>
                   
                  </thead>
                  <tbody>
                    <?php foreach($scholars as $row): ?>
                      <tr>
                        <td>
                          <input required placeholder="Enter allowance amount" class="form-control" name="<?php echo($row["year_level_id"]); ?>" type="number">
                        </td>
                        <td><?php echo($row["year_level"]); ?></td>
                        <td><?php echo($row["year_type"]); ?></td>
                        
                      </tr>
                    <?php endforeach; ?>
                  </tbody>

                </table>
                      <br>
                <button type="submit" class="btn btn-primary">Submit</button>
              </div>
              <!-- /.card-body -->
            </div>
                </div>

       
        </div>
      </form>
      </div>
    </section>
    <!-- /.content -->
  </div>

  <script src="AdminLTE_new/plugins/sweetalert2/sweetalert2.min.js"></script>
  <?php require("layouts/footer.php") ?>