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
                  $list = query("select s.*, u.*, sy.school_year from scholars s
                  left join users u
                  on s.responsible = u.user_id
                  left join school_year sy
                  on sy.school_year_id = s.school_year_id
                  where s.current_status = 'SCHOLAR'
                  and sponsor_id = ?
                  order by s.school_year_id desc", 
				                          $_SESSION["mariphil"]["userid"]);
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