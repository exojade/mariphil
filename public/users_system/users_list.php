<link rel="stylesheet" href="AdminLTE_new/plugins/sweetalert2-theme-bootstrap-4/bootstrap-4.min.css">

<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1>Users</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
            <button type="button" class="btn btn-primary btn-flat" data-toggle="modal" data-target="#add_user">ADD USER</button>
            </ol>
          </div>
        </div>
      </div><!-- /.container-fluid -->
    </section>

    <!-- Main content -->
    <section class="content">
    <div class="modal fade" id="add_user">
        <div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-header">
              <h4 class="modal-title">Default Modal</h4>
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
            <div class="modal-body">
              <form class="generic_form_files_trigger" role="form" enctype="multipart/form-data" data-url="users">
              <input type="hidden" name="action" value="addUser">
              <div class="form-group">
                <label for="exampleInputEmail1">Email address / Username</label>
                <input required type="text" name="username" class="form-control" id="exampleInputEmail1" placeholder="---">
              </div>

              <div class="form-group">
                <label for="exampleInputEmail1">Fullname</label>
                <input required type="text" name="fullname" class="form-control" id="exampleInputEmail1" placeholder="---">
              </div>

              <div class="form-group">
                <label for="exampleInputEmail1">Address</label>
                <input required type="text" name="address" class="form-control" id="exampleInputEmail1" placeholder="---">
              </div>

              <div class="form-group">
                <label for="exampleInputEmail1">Gender</label>
                <select required name="gender" class="form-control select2">
                  <option selected disabled value="">Please select Gender</option>
                  <option value="MALE">MALE</option>
                  <option value="FEMALE">FEMALE</option>
                </select>
              </div>

              <div class="form-group">
                <label for="exampleInputEmail1">Role</label>
                <select required name="role" class="form-control select2">
                  <option selected disabled value="">Please select Role</option>
                  <option value="ADMIN">ADMIN</option>
                  <option value="SPONSOR">SPONSOR</option>
                  <option value="VALIDATOR">VALIDATOR</option>
                  <option value="FACILITATOR">FACILITATOR</option>
                </select>
              </div>


              <div class="row">
                        <div class="col-12">
                        <div class="form-group">
                          <label for="Image" class="form-label">Profile Image</label>
                          <input accept="image/png, image/gif, image/jpeg" class="form-control" type="file" id="formFile" name="profile_image" onchange="preview()">
                          <button onclick="clearImage()" type="button" class="btn btn-primary mt-3">Clear</button>
                      </div>
                        </div>
                        <div class="col-12">
                        <img id="frame" src="" class="img-fluid" width="200" height="200" />

                        </div>
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








      <?php foreach($users as $u):  ?>
      <div class="modal fade" id="updateUser<?php echo($u["user_id"]); ?>">
        <div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-header">
              <h4 class="modal-title"><?php echo($u["username"]); ?></h4>
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
            <div class="modal-body">
              <form class="generic_form_trigger" data-url="users">
              <input type="hidden" name="action" value="updateUSer">
              <input type="hidden" name="user_id" value="<?php echo($u["user_id"]); ?>">
              <div class="form-group">
                <label for="exampleInputEmail1">Email address / Username</label>
                <input required type="text" value="<?php echo($u["username"]); ?>" name="username" class="form-control" placeholder="---">
              </div>

              <div class="form-group">
                <label for="exampleInputEmail1">Fullname</label>
                <input required type="text" value="<?php echo($u["fullname"]); ?>" name="fullname" class="form-control" id="exampleInputEmail1" placeholder="---">
              </div>

              <div class="form-group">
                <label for="exampleInputEmail1">Gender</label>
                <select required name="gender" class="form-control select2">
                  <option selected value="<?php echo($u["gender"]); ?>"><?php echo($u["gender"]); ?></option>
                  <option value="MALE">MALE</option>
                  <option value="FEMALE">FEMALE</option>
                </select>
              </div>

              <div class="form-group">
                <label for="exampleInputEmail1">Role</label>
                <select required name="role" class="form-control select2">
                  <option selected disabled value="<?php echo($u["role"]); ?>"><?php echo($u["role"]); ?></option>
                  <option value="ADMIN">ADMIN</option>
                  <option value="SPONSOR">SPONSOR</option>
                  <option value="VALIDATOR">VALIDATOR</option>
                  <option value="FACILITATOR">FACILITATOR</option>
                  <option value="SCHOLAR">FACILITATOR</option>
                  <option value="APPLICANT">APPLICANT</option>
                </select>
              </div>


              <div class="row">
                        <div class="col-12">
                        <div class="form-group">
                          <label for="Image" class="form-label">Profile Image</label>
                          <input accept="image/png, image/gif, image/jpeg" class="form-control" type="file" id="formFile" name="profile_image" onchange="preview2()">
                      </div>
                        </div>
                        <div class="col-12">
                        <img id="frame2" src="<?php echo($u["profile_image"]); ?>" class="img-fluid" width="200" height="200" />

                        </div>
                      </div>

             
            </div>
            <div class="modal-footer justify-content-between">
              <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
              <button type="submit" class="btn btn-primary">Save changes</button>
            </div>
      </form>
          </div>
          <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
      </div>
      <?php endforeach; ?>



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
                    <th>Username / Email</th>
                    <th>Role</th>
                    <th>Fullname</th>
                    <th>Status</th>
                  </tr>
                  </thead>
                  <tbody>
                  <?php foreach($users as $u):  ?>
                    <tr>
                      <td>
                        <a href="#" title="Update User" data-toggle="modal" data-target="#updateUser<?php echo($u["user_id"]); ?>" class="btn btn-warning">Update</a>
                      </td>
                      <td><?php echo($u["username"]); ?></td>
                      <td><?php echo(strtoupper($u["role"])); ?></td>
                      <td><?php echo(strtoupper($u["fullname"])); ?></td>
                      <td><?php echo(strtoupper($u["status"])); ?></td>

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
  <script>
            function preview2() {
              frame = document.getElementById('frame2');
                frame.src = URL.createObjectURL(event.target.files[0]);
            }
            function preview() {
                frame.src = URL.createObjectURL(event.target.files[0]);
            }
            function clearImage() {
                document.getElementById('formFile').value = null;
                frame.src = "";
            }
        </script>
  <?php require("layouts/footer.php") ?>