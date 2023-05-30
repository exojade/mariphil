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
              </div>
              <!-- /.card-header -->
              <div class="card-body">
                <table id="example1" class="table table-bordered table-striped">
                  <thead>
                  <tr>
                    <th>Action</th>
                    <th>Fullname</th>
                    <th>Address</th>
                    <th>Facilitator</th>
                    <th>Status</th>
                  </tr>
                  </thead>
                  <tbody>
                  <?php
                  $list = query("select * from scholars s
                  left join users u
                  on s.responsible = u.user_id
                  where current_status = 'SCHOLAR'
                  and sponsor_id = ?", 
				                          $_SESSION["mariphil"]["userid"]);
                  foreach($list as $l):  ?>
                    <tr>
                      <td>
                        <a href="#" class="btn btn-warning">View</a>
                      </td>
                      <td><?php echo(strtoupper($l["lastname"] . ", " . $l["firstname"])); ?></td>
                      <td><?php echo(strtoupper(
                        $l["address_home"] . ", " . $l["address_barangay"] . ", " . $l["address_city"].
                        ", " . $l["address_province"] . ", " . $l["address_zipcode"]
                        )); ?></td>
                      <td><?php echo(strtoupper($l["fullname"])); ?></td>
                      <td><?php echo(strtoupper($l["current_status"])); ?></td>

                    </tr>
                  <?php endforeach; ?>
                  </tbody>
                  <tfoot>
                  <tr>
                    <th>Action</th>
                    <th>Fullname</th>
                    <th>Address</th>
                    <th>Status</th>
                  </tr>
                  </tfoot>
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