<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1>Dashboard</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item"><a href="#">Layout</a></li>
              <li class="breadcrumb-item active">Fixed Layout</li>
            </ol>
          </div>
        </div>
      </div><!-- /.container-fluid -->
    </section>

    <!-- Main content -->
    <section class="content">
    <?php
      $applicants = query("select count(*) as count from scholars where current_status 
                    not in ('APPLICANT - DENIED', 'SCHOLAR')");
      $applicants = $applicants[0]["count"];


      $sponsors = query("select count(*) as count from users where role 
                    in ('SPONSOR')");
      $sponsors = $sponsors[0]["count"];

      $scholars = query("select count(*) as count from scholars where current_status 
                    in ('SCHOLAR')");
      $scholars = $scholars[0]["count"];

      $users = query("select count(*) as count from users");
      $users = $users[0]["count"];
      
      // dump($users);


    ?>

      <div class="container-fluid">

      <div class="row">
        <div class="col-md-6">
        <div class="card card-widget widget-user-2 shadow-sm">
              <!-- Add the bg color to the header using any of the bg-* classes -->
              <div class="widget-user-header bg-warning">

                <?php $user = query("select * from users where user_id = ?", $_SESSION["mariphil"]["userid"]); 
                    $user = $user[0];
                ?>

                <div class="widget-user-image">
                <?php if($_SESSION["mariphil"]["profile_image"] == ""): ?>
                  <img class="img-circle elevation-2" src="resources/default.jpg" alt="User Avatar">
                <?php else: ?>
                  <img class="img-circle elevation-2" src="<?php echo($_SESSION["mariphil"]["profile_image"]); ?>" alt="User Avatar">
                <?php endif; ?>
                </div>
                <!-- /.widget-user-image -->
                <h3 class="widget-user-username"><?php echo($user["fullname"]); ?></h3>
                <h5 class="widget-user-desc"><?php echo($user["role"]); ?></h5>
              </div>
              <div class="card-footer p-0">
                <ul class="nav flex-column">
                  <li class="nav-item">
                    <a href="#" class="nav-link">
                      Gender <span class="float-right badge bg-primary"><?php echo($user["gender"]); ?></span>
                    </a>
                  </li>
                  <li class="nav-item">
                    <a href="#" class="nav-link">
                      Address <span class="float-right badge bg-info"><?php echo($user["address"]); ?></span>
                    </a>
                  </li>
                </ul>
              </div>
            </div>

        </div>
        <div class="col-md-6">
        <div class="row">
          <div class="col-12 col-sm-6 col-md-6">
            <div class="info-box">
              <span class="info-box-icon bg-info elevation-1"><i class="fas fa-plus"></i></span>

              <div class="info-box-content">
                <span class="info-box-text">Applicants</span>
                <span class="info-box-number">
                  <?php echo($applicants); ?>
              
                </span>
              </div>
              <!-- /.info-box-content -->
            </div>
            <!-- /.info-box -->
          </div>
          <!-- /.col -->
          <div class="col-12 col-sm-6 col-md-6">
            <div class="info-box mb-3">
              <span class="info-box-icon bg-danger elevation-1"><i class="fas fa-briefcase"></i></span>

              <div class="info-box-content">
                <span class="info-box-text">Sponsors</span>
                <span class="info-box-number"><?php echo($sponsors); ?></span>
              </div>
              <!-- /.info-box-content -->
            </div>
            <!-- /.info-box -->
          </div>
          <!-- /.col -->

          <!-- fix for small devices only -->
          <div class="clearfix hidden-md-up"></div>

          <div class="col-12 col-sm-6 col-md-6">
            <div class="info-box mb-3">
              <span class="info-box-icon bg-success elevation-1"><i class="fas fa-graduation-cap"></i></span>
              <div class="info-box-content">
                <span class="info-box-text">Scholars</span>
                <span class="info-box-number"><?php echo($scholars); ?></span>
              </div>
            </div>
          </div>
          <div class="col-12 col-sm-6 col-md-6">
            <div class="info-box mb-3">
              <span class="info-box-icon bg-warning elevation-1"><i class="fas fa-users"></i></span>

              <div class="info-box-content">
                <span class="info-box-text">Users</span>
                <span class="info-box-number"><?php echo($users); ?></span>
              </div>
            </div>
          </div>
        </div>

        </div>
      </div>


      



      </div>
    </section>
    <!-- /.content -->
  </div>
  <?php require("layouts/footer.php") ?>