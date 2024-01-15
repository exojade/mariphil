<link rel="stylesheet" href="AdminLTE_new/plugins/datatables-bs4/css/dataTables.bootstrap4.min.css">
<link rel="stylesheet" href="AdminLTE_new/plugins/datatables-responsive/css/responsive.bootstrap4.min.css">
<link rel="stylesheet" href="AdminLTE_new/plugins/datatables-buttons/css/buttons.bootstrap4.min.css">

<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1>Scholars</h1>
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
            <form class="generic_form_no_trigger_and_result" data-url="scholars">
            <input type="hidden" name="action" value="scholars_listFilter">
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
                    <th>Address</th>
                    <th>Gender</th>
                    <th>Sponsor</th>
                    <th>Facilitator</th>
                    <th>School Year</th>
                  </tr>
                  </thead>
                  <tbody>
                  <?php foreach($scholars as $s): ?>
                    <tr>
                    <td><a class="btn btn-primary" href="scholars?action=details&id=<?php echo($s["scholar_id"]); ?>"><i class="fa fa-solid fa-eye"></i></a></td>
                    <!-- <td><?php echo($s["lastname"] . ", " . $s["firstname"]); ?></td> -->
                    <td><?php echo($s["lastname"] . ", " . $s["firstname"]); ?></td>
                    <td><?php 
                    echo($s["address_home"] . " " . $s["address_barangay"]
                          . " " . $s["address_city"] . ", " . $s["address_province"]
                  ); 
                    ?></td>
                    <td><?php echo($s["sex"]); ?></td>
                    <td><?php echo($s["fullname"]); ?></td>
                    <td><?php echo($s["responsible"]); ?></td>
                    <td><?php echo($s["school_year"]); ?></td>
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

<script src="AdminLTE_new/plugins/datatables/jquery.dataTables.min.js"></script>
<script src="AdminLTE_new/plugins/datatables-bs4/js/dataTables.bootstrap4.min.js"></script>
<script src="AdminLTE_new/plugins/datatables-responsive/js/dataTables.responsive.min.js"></script>
<script src="AdminLTE_new/plugins/datatables-responsive/js/responsive.bootstrap4.min.js"></script>
<script src="AdminLTE_new/plugins/datatables-buttons/js/dataTables.buttons.min.js"></script>
<script src="AdminLTE_new/plugins/datatables-buttons/js/buttons.bootstrap4.min.js"></script>
<script src="AdminLTE_new/plugins/jszip/jszip.min.js"></script>
<script src="AdminLTE_new/plugins/pdfmake/pdfmake.min.js"></script>
<script src="AdminLTE_new/plugins/pdfmake/vfs_fonts.js"></script>
<script src="AdminLTE_new/plugins/datatables-buttons/js/buttons.html5.min.js"></script>
<script src="AdminLTE_new/plugins/datatables-buttons/js/buttons.print.min.js"></script>
<script src="AdminLTE_new/plugins/datatables-buttons/js/buttons.colVis.min.js"></script>


<script>
  $(function () {
    $("#example1").DataTable({
      "responsive": true, "lengthChange": false, "autoWidth": false,
      "buttons": ["copy", "csv", "excel", "pdf", "print", "colvis"]
    }).buttons().container().appendTo('#example1_wrapper .col-md-6:eq(0)');
    $('#example2').DataTable({
      "paging": true,
      "lengthChange": false,
      "searching": false,
      "ordering": true,
      "info": true,
      "autoWidth": false,
      "responsive": true,
    });
  });
</script>

  <?php require("layouts/footer.php") ?>