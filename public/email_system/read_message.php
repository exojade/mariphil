<link rel="stylesheet" href="AdminLTE_new/plugins/sweetalert2-theme-bootstrap-4/bootstrap-4.min.css">
<link rel="stylesheet" href="AdminLTE_new/plugins/datatables-bs4/css/dataTables.bootstrap4.min.css">
<link rel="stylesheet" href="AdminLTE_new/plugins/datatables-responsive/css/responsive.bootstrap4.min.css">
<link rel="stylesheet" href="AdminLTE_new/plugins/datatables-buttons/css/buttons.bootstrap4.min.css">
<link rel="stylesheet" href="AdminLTE_new/plugins/summernote/summernote-bs4.min.css">
<style>
.inbox-datatable tbody tr:hover {
    cursor: pointer;
}

.mailbox-read-info {
    border-bottom: 0px solid rgba(0,0,0,.125);
    padding: 10px;
}
</style>
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1>Message</h1>
          </div>
       
        </div>
      </div><!-- /.container-fluid -->
    </section>

    <!-- Main content -->
    <section class="content">
      <div class="row">
        <div class="col-md-3">
          <a href="email?action=new" class="btn btn-primary btn-block mb-3">Compose</a>
          <div class="card">
            <div class="card-header">
              <h3 class="card-title">Folders</h3>

              <div class="card-tools">
                <button type="button" class="btn btn-tool" data-card-widget="collapse">
                  <i class="fas fa-minus"></i>
                </button>
              </div>
            </div>
            <div class="card-body p-0">
              <ul class="nav nav-pills flex-column">
                <li class="nav-item active">
                  <a href="email?action=inbox" class="nav-link">
                    <i class="fas fa-inbox"></i> Inbox
                  </a>
                </li>
                <li class="nav-item">
                  <a href="email?action=sent" class="nav-link">
                    <i class="far fa-envelope"></i> Sent
                  </a>
                </li>
              </ul>
            </div>
            <!-- /.card-body -->
          </div>
          <!-- /.card -->
          <!-- /.card -->
        </div>
        <!-- /.col -->
        <div class="col-md-9">

        


        <div class="card card-primary card-outline">
            <div class="card-header">
              <h3 class="card-title">Read Mail</h3>
            </div>
            <!-- /.card-header -->
            <div class="card-body p-0">

            <?php $sender = ""; foreach($mails as $row): 
              // dump($mails);
              if($row["sender_id"] != $_SESSION["mariphil"]["userid"])
                $sender = $row["sender_id"];

              if($sender == ""):
                $sender = $row["receipient_id"];
              endif;

              ?>

              <div class="mailbox-read-info">
                <h4><?php echo($Users[$row["sender_id"]]["fullname"]); ?> [<small><?php echo($Users[$row["sender_id"]]["username"]); ?></small>]</h4>
                <p>To: <?php echo($Users[$row["receipient_id"]]["fullname"]); ?> [<small><?php echo($Users[$row["receipient_id"]]["username"]); ?></small>]
                  <span class="mailbox-read-time float-right"><?php $formattedDate = date('d M. Y h:i A', $row["timestamp"]);
                  echo($formattedDate);
                  ?></span></p>
              </div>
              <div class="mailbox-read-message">
                <h6><?php echo($row["subject"]); ?></h6>
                <?php echo($row["message"]); ?>
              </div>
              <hr>
            <?php endforeach; ?>
            </div>
            <!-- /.card-body -->
          
            <!-- /.card-footer -->
            <!-- <div class="card-footer">
              <div class="float-right">
                <button type="button" class="btn btn-default"><i class="fas fa-reply"></i> Reply</button>
                <button type="button" class="btn btn-default"><i class="fas fa-share"></i> Forward</button>
              </div>
              <button type="button" class="btn btn-default"><i class="far fa-trash-alt"></i> Delete</button>
              <button type="button" class="btn btn-default"><i class="fas fa-print"></i> Print</button>
            </div> -->
            <!-- /.card-footer -->
          </div>

          <div class="card card-primary card-outline">
              <div class="card-header">
                <h3 class="card-title">Reply</h3>
              </div>
              <!-- /.card-header -->
              <form class="generic_form_trigger" data-url="email">
                <input type="hidden" name="action" value="reply">
                <input type="hidden" name="thread_id" value="<?php echo($thread_id); ?>">
                <input type="hidden" name="sender" value="<?php echo($_SESSION["mariphil"]["userid"]); ?>">
              <div class="card-body">
                <div class="form-group">
                  <label>To: </label>
                  <input name="receipient" readonly value="<?php echo($Users[$sender]["username"]); ?>" class="form-control"  placeholder="To:">
                </div>
                <div class="form-group">
                    <textarea name="message" id="compose-textarea" class="form-control" style="height: 150px;">
                     
                    </textarea>
                </div>
                <!-- <div class="form-group">
                  <div class="btn btn-default btn-file">
                    <i class="fas fa-paperclip"></i> Attachment
                    <input type="file" name="attachment">
                  </div>
                  <p class="help-block">Max. 32MB</p>
                </div> -->
              </div>
              <!-- /.card-body -->
              <div class="card-footer">
                <div class="float-right">
                  <button type="submit" class="btn btn-primary"><i class="far fa-envelope"></i> Send</button>
                </div>
              </div>
            </form>
              <!-- /.card-footer -->
            </div>




              


          <!-- /.card -->
        </div>
        <!-- /.col -->
      </div>
      <!-- /.row -->
    </section>
    <!-- /.content -->
  </div>

<script src="AdminLTE_new/plugins/sweetalert2/sweetalert2.min.js"></script>
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
<script src="AdminLTE_new/plugins/summernote/summernote-bs4.min.js"></script>

<script>
  $(function () {
    //Add text editor
    $('#compose-textarea').summernote()
  })
</script>

  <script>
  var datatable = 
            $('.inbox-datatable').DataTable({
                "pageLength": 50,
                language: {
                    searchPlaceholder: "Enter Filter"
                },
                searching: true,
                // "bLengthChange": true,
                "ordering": false,
                'processing': true,
                'serverSide': true,
                'serverMethod': 'post',
                'ajax': {
                    'url':'email',
                     'type': "POST",
                     "data": function (data){
                        data.action = "inbox-datatable";
                     }
                },
                'columns': [
                    { data: 'email_id', "visible": false },
                    { data: 'read', "orderable": false },
                    { data: 'sender', "orderable": false },
                    { data: 'subject', "orderable": false },
                    { data: 'date', "orderable": false },
                ],
                "footerCallback": function (row, data, start, end, display) {
                    // var api = this.api(), data;
                    // var intVal = function (i) {
                    //     return typeof i === 'string' ?
                    //         i.replace(/[\$,]/g, '') * 1 :
                    //         typeof i === 'number' ?
                    //             i : 0;
                    // };
                    // // // Total over all pages

                    // console.log(received = api
                    //     .column(2)
                    //     .data());


                    // received = api
                    //     .column(2)
                    //     .data()
                    //     .reduce(function (a, b) {
                    //         return intVal(a) + intVal(b);
                    //     }, 0);
                    //     console.log(received);

                    // $('#currentTotal').html('' + received.toLocaleString('en-US', { minimumFractionDigits: 0, maximumFractionDigits: 0 }));
                }
            });

            $('.inbox-datatable tbody').on('click', 'tr', function () {
                var data = $('.inbox-datatable').DataTable().row(this).data();
                if (data) {
                    // Redirect to a URL with the ID parameter
                    window.location.href = 'email?action=read_message&id=' + data.email_id;
                }
            });

            function filter() {
              var from = $('#from').val();
              var to = $('#to').val();
              console.log(from);
              console.log(to);
              datatable.ajax.url('reports_page?action=deceased-datatable&from='+from+'&to='+to).load();
          }
  </script>
  <?php require("layouts/footer.php") ?>