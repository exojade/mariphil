<?php

$receiver = [];

if($_SESSION["mariphil"]["role"] == "FACILITATOR"):
  $scholars = query("select * from scholars s left join school_year sy
                      on sy.school_year_id = s.school_year_id
                      left join users u
                      on u.user_id = s.scholar_id
                      where
                      responsible = ?
                      order by s.school_year_id desc
                       ", $_SESSION["mariphil"]["userid"]);
                      //  dump($scholars);
  $i=0;
  foreach($scholars as $row):
    $receiver[$i]["email"] = $row["user_id"];
    $receiver[$i]["name"] = $row["fullname"] . "(" .  $row["username"].  ")" . "[SY: " . $row["school_year"] . "]";
    $i++;
  endforeach;
  // dump($receiver);
endif;


if($_SESSION["mariphil"]["role"] == "SCHOLAR"):
  $data = query("select * from scholars s
                  left join users u
                  on u.user_id = s.responsible
                  where scholar_id = ?
                       ", $_SESSION["mariphil"]["userid"]);
                      //  dump($data);
  $i=0;
  foreach($data as $row):
    $receiver[$i]["email"] = $row["user_id"];
    $receiver[$i]["name"] = $row["fullname"] . "(" .  $row["username"].  ") - FACILITATOR" ;
    $i++;
  endforeach;

  $data = query("select * from scholars s
                  left join users u
                  on u.user_id = s.sponsor_id
                  where scholar_id = ?
                       ", $_SESSION["mariphil"]["userid"]);
                      //  dump($data);
 
  foreach($data as $row):
    $receiver[$i]["email"] = $row["user_id"];
    $receiver[$i]["name"] = $row["fullname"] . "(" .  $row["username"].  ") - SPONSOR";
    $i++;
  endforeach;

  // dump($receiver);
endif;



if($_SESSION["mariphil"]["role"] == "APPLICANT"):
  $data = query("select * from scholar_tracker st
                  left join users u 
                  on u.user_id = st.user_id
                  where scholar_id = ?
                  and st.status in ('APPLICANT - TO BE INTERVIEWED', 'APPLICANT - INTERVIEWED')
                  group by st.user_id
                       ", $_SESSION["mariphil"]["userid"]);
                      //  dump($data);
  $i=0;
  foreach($data as $row):
    $receiver[$i]["email"] = $row["user_id"];
    $receiver[$i]["name"] = $row["fullname"] . "(" .  $row["username"].  ") - VALIDATOR" ;
    $i++;
  endforeach;
  // dump($receiver);
endif;



if($_SESSION["mariphil"]["role"] == "VALIDATOR"):

  $StatusScholar = [];
  $scholars = query("select * from scholar_tracker where status = 'SCHOLAR'");
  foreach($scholars as $row):
    $StatusScholar[$row["scholar_id"]] = $row;
  endforeach;


  $data = query("select * from scholar_tracker st
                  left join users u 
                  on u.user_id = st.scholar_id
                  where st.user_id = ?
                  and st.status in ('APPLICANT - TO BE INTERVIEWED', 'APPLICANT - INTERVIEWED')
                  group by st.scholar_id
                       ", $_SESSION["mariphil"]["userid"]);
                      //  dump($data);
  $i=0;
  foreach($data as $row):
    if(!isset($StatusScholar[$row["scholar_id"]])):
      // $receiver[$i]["row"] = $row;
      $receiver[$i]["email"] = $row["user_id"];
      $receiver[$i]["name"] = $row["fullname"] . "(" .  $row["username"].  ") - VALIDATOR" ;
      $i++;
    endif;
  endforeach;
  // dump($receiver);
endif;


?>

<link rel="stylesheet" href="AdminLTE_new/plugins/sweetalert2-theme-bootstrap-4/bootstrap-4.min.css">
<link rel="stylesheet" href="AdminLTE_new/plugins/summernote/summernote-bs4.min.css">
<link rel="stylesheet" href="AdminLTE_new/plugins/select2/css/select2.min.css">
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1>COMPOSE</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
            </ol>
          </div>
        </div>
      </div><!-- /.container-fluid -->
    </section>
    <sectiion class="content">
      <div class="container-fluid">
        <div class="row">
          <div class="col-md-3">
            <a href="email?action=inbox" class="btn btn-primary btn-block mb-3">Back to Inbox</a>
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
          </div>
          </div>
          <!-- /.col -->
          <div class="col-md-9">
            <div class="card card-primary card-outline">
              <div class="card-header">
                <h3 class="card-title">Compose New Message</h3>
              </div>
              <!-- /.card-header -->
              <div class="card-body">
                <form class="generic_form_trigger" data-url="email">
                <input type="hidden" name="action" value="compose">
                <input type="hidden" name="sender" value="<?php echo($_SESSION["mariphil"]["userid"]); ?>">
                <input type="hidden" name="sender_fullname" value="<?php echo($_SESSION["mariphil"]["fullname"]); ?>">
              <div class="form-group">
                  <select class="select2" multiple="multiple" name="receipient[]" data-placeholder="To: " style="width: 100%;">
                  <!-- <option >Please select email</option> -->
                    <?php foreach($receiver as $row): ?>
                      <option value="<?php echo($row["email"]); ?>"  ><?php echo($row["name"]); ?></option>

                    <?php endforeach; ?>
                  </select>
                </div>
                <div class="form-group">
                  <input class="form-control" name="subject" required placeholder="Subject:">
                </div>
                <div class="form-group">
                    <textarea id="compose-textarea" name="message" required class="form-control" style="height: 300px">
                   
                    </textarea>
                </div>
  
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
      </div><!-- /.container-fluid -->
    </section>
    <!-- /.content -->
  </div>

  <script src="AdminLTE_new/plugins/sweetalert2/sweetalert2.min.js"></script>
  <script src="AdminLTE_new/plugins/summernote/summernote-bs4.min.js"></script>
  <script src="AdminLTE_new/plugins/select2/js/select2.full.min.js"></script>
  <script>
 $(function () {
    //Add text editor
    $('#compose-textarea').summernote()
  })

  $('.select2').select2()
  </script>
  <?php require("layouts/footer.php") ?>