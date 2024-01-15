
  <link rel="stylesheet" href="AdminLTE_new/plugins/daterangepicker/daterangepicker.css">
  <link rel="stylesheet" href="AdminLTE_new/plugins/icheck-bootstrap/icheck-bootstrap.min.css">
  <link rel="stylesheet" href="AdminLTE_new/plugins/bootstrap-colorpicker/css/bootstrap-colorpicker.min.css">
  <link rel="stylesheet" href="AdminLTE_new/plugins/tempusdominus-bootstrap-4/css/tempusdominus-bootstrap-4.min.css">
  <link rel="stylesheet" href="AdminLTE_new/plugins/select2/css/select2.min.css">
  <link rel="stylesheet" href="AdminLTE_new/plugins/select2-bootstrap4-theme/select2-bootstrap4.min.css">
  <link rel="stylesheet" href="AdminLTE_new/plugins/bootstrap4-duallistbox/bootstrap-duallistbox.min.css">
  <link rel="stylesheet" href="AdminLTE_new/plugins/bs-stepper/css/bs-stepper.min.css">
  <link rel="stylesheet" href="AdminLTE_new/plugins/sweetalert2-theme-bootstrap-4/bootstrap-4.min.css">
  <link rel="stylesheet" href="AdminLTE_new/plugins/dropzone/min/dropzone.min.css">
  <link rel="stylesheet" href="AdminLTE_new/dist/css/adminlte.min.css">

  <style>
.validation-error{
  border-color: red;
}
    </style>
<div class="content-wrapper">
    <section class="content">

      <div class="container-fluid">
      <div class="row">
          <div class="col-md-12">
            <br>

          <div class="alert alert-info alert-dismissible">
                  <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                  <h5><i class="icon fas fa-info"></i> Fill Profile Data</h5>
                  In order to apply for a scholarship you need to fill this assessment form!
                </div>
            <div class="card card-default">
              <div class="card-header">
                <h3 class="card-title">Profile Fill</h3>
              </div>
              <div class="card-body p-0">
                <div class="bs-stepper">
                  <form class="generic_form_files_trigger" role="form" enctype="multipart/form-data" data-url="profile">
                  <input type="hidden" name="action" value="saveProfile">
                  <div class="bs-stepper-header" role="tablist">
                    <!-- your steps here -->
                    <div class="step" data-target="#personal-profile">
                      <button type="button" class="step-trigger" role="tab" aria-controls="logins-part" id="logins-part-trigger">
                        <span class="bs-stepper-circle">1</span>
                        <span class="bs-stepper-label">Personal Profile</span>
                      </button>
                    </div>
                    <div class="line"></div>
                    <div class="step" data-target="#parent-part">
                      <button type="button" class="step-trigger" role="tab" aria-controls="parent-part" id="another_information-part-trigger">
                        <span class="bs-stepper-circle">2</span>
                        <span class="bs-stepper-label">Parent's Info</span>
                      </button>
                    </div>

                    <!-- <div class="line"></div>
                    <div class="step" data-target="#children-part">
                      <button type="button" class="step-trigger" role="tab" aria-controls="children-part" id="another_information-part-trigger">
                        <span class="bs-stepper-circle">3</span>
                        <span class="bs-stepper-label">Children Info</span>
                      </button>
                    </div> -->
                    <div class="line"></div>
                    <div class="step" data-target="#scholarship-part">
                      <button type="button" class="step-trigger" role="tab" aria-controls="requirements-part" id="another_information-part-trigger">
                        <span class="bs-stepper-circle">3</span>
                        <span class="bs-stepper-label">Scholarship</span>
                      </button>
                    </div>

                    <div class="line"></div>
                    <div class="step" data-target="#requirements-part">
                      <button type="button" class="step-trigger" role="tab" aria-controls="requirements-part" id="another_information-part-trigger">
                        <span class="bs-stepper-circle">4</span>
                        <span class="bs-stepper-label">Requirements</span>
                      </button>
                    </div>
                    <div class="line"></div>
                    <div class="step" data-target="#profile-part">
                      <button type="button" class="step-trigger" role="tab" aria-controls="profile-part" id="information-part-trigger">
                        <span class="bs-stepper-circle">5</span>
                        <span class="bs-stepper-label">Profile Image</span>
                      </button>
                    </div>
                    
                  </div>
                  <?php $scholar = $scholar[0]; ?>
                  <div class="bs-stepper-content">
                    <!-- your steps content here -->
                    <div id="personal-profile" class="content" role="tabpanel" aria-labelledby="logins-part-trigger" data-step="1">
                      <div class="row">
                          <div class="col-md-4">
                            <div class="form-group">
                              <label>First Name</label>
                              <input value="<?php echo($scholar["firstname"]); ?>" name="firstname" required type="text" class="form-control"  placeholder="First Name">
                            </div>
                          </div>
                          <div class="col-md-4">
                            <div class="form-group">
                              <label>Middle Name</label>
                              <input value="<?php echo($scholar["middlename"]); ?>" name="middlename" required type="text" class="form-control" placeholder="Middle Name">
                            </div>
                          </div>
                          <div class="col-md-4">
                            <div class="form-group">
                              <label>Last Name</label>
                              <input value="<?php echo($scholar["lastname"]); ?>" name="lastname" required type="text" class="form-control" placeholder="Last Name">
                            </div>
                          </div>
                      </div>

                      <div class="row">
                          <div class="col-md-4">
                            <div class="form-group">
                              <label>Street / House Number / Purok</label>
                              <input value="<?php echo($scholar["address_home"]); ?>" name="address_home" required type="text" class="form-control"  placeholder="Street / House Number / Purok">
                            </div>
                          </div>
                          <div class="col-md-4">
                            <div class="form-group">
                              <label>Barangay</label>
                              <input value="<?php echo($scholar["address_barangay"]); ?>" name="address_barangay" required type="text" class="form-control" placeholder="Barangay">
                            </div>
                          </div>
                          <div class="col-md-4">
                            <div class="form-group">
                              <label>Place / Town / City</label>
                              <input value="<?php echo($scholar["address_city"]); ?>" name="address_city" required type="text" class="form-control" placeholder="Place / Town / City">
                            </div>
                          </div>
                      </div>

                      <div class="row">
                          <div class="col-md-4">
                            <div class="form-group">
                              <label>District / Region</label>
                              <input name="address_region" value="<?php echo($scholar["address_region"]); ?>" required type="text" class="form-control"  placeholder="District / Region">
                            </div>
                          </div>
                          <div class="col-md-4">
                            <div class="form-group">
                              <label>Province</label>
                              <input name="address_province" value="<?php echo($scholar["address_province"]); ?>" required type="text" class="form-control" placeholder="Province">
                            </div>
                          </div>
                          <div class="col-md-4">
                            <div class="form-group">
                              <label>Zip Code</label>
                              <input name="zipcode" value="<?php echo($scholar["address_zipcode"]); ?>" required type="number"
 
 onkeypress="return event.keyCode === 8 || event.charCode >= 48 && event.charCode <= 57" class="form-control" placeholder="Zip Code">
                            </div>
                          </div>
                      </div>


                      <div class="row">
                          <div class="col-md-4">
                            <div class="form-group">
                              <label>Birthdate</label>
                              <input max="<?php echo date('Y-m-d'); ?>" value="<?php echo($scholar["birthdate"]); ?>" name="birthdate" required type="date" class="form-control"  placeholder="Birthdate">
                            </div>
                          </div>
                          <div class="col-md-4">
                            <div class="form-group">
                              <label>Birth Place</label>
                              <input value="<?php echo($scholar["birthplace"]); ?>" name="birthplace" required type="text" class="form-control"  placeholder="---">
                            </div>
                          </div>
                          <div class="col-md-4">
                            <div class="form-group">
                              <label>Sex</label>
                              <select name="gender" class="form-control select2" >
                                <?php if($scholar["sex"] == ""): ?>
                                  <option disabled selected value="">Please select Sex</option>
                                <?php else: ?>
                                  <option selected value="<?php echo($scholar["sex"]); ?>"><?php echo($scholar["sex"]); ?></option>
                                  <option disabled value="">Please select Sex</option>
                                <?php endif; ?>
                                <option value="Male">Male</option>
                                <option value="Female">Female</option>
                              </select>
                            </div>
                          </div>
                      </div>


                      <div class="row">
                          <div class="col-md-4">
                            <div class="form-group">
                              <label>Highest Educational Attainment</label>
                              <input value="<?php echo($scholar["education_attainment"]); ?>" name="educational_attainment" required type="text" class="form-control"  placeholder="Educational Attainment">
                            </div>
                          </div>
                          <div class="col-md-8">
                            <div class="form-group">
                              <label>Name of School</label>
                              <input value="<?php echo($scholar["name_school"]); ?>" name="name_school" required type="text" class="form-control" placeholder="Name of School">
                            </div>
                          </div>
                      </div>
                      <!-- <button type="button" class="btn btn-primary" onclick="stepper.next()">Next</button> -->
                      <button type="button" class="btn btn-primary" onclick="validateAndProceed(1)">Next</button>
                    </div>
                    
                    <div id="parent-part" data-step="5" class="content" role="tabpanel" aria-labelledby="another_information-part-trigger">
                    <div class="form-horizontal">
                      <div class="row">
                        <div class="col-md-6">
                        <div class="card-header">
                          <h3 class="card-title">FATHER</h3>
                        </div>
                        <div class="card-body">
                          <div class="form-group row">
                            <label for="inputEmail3" class="col-sm-2 col-form-label">Name *</label>
                            <div class="col-sm-10">
                              <input value="<?php echo($scholar["father_name"]); ?>" name="father_name" required type="text" class="form-control" id="inputEmail3" placeholder="Name">
                            </div>
                          </div>
                          <div class="form-group row">
                          
                            <label for="inputEmail3" class="col-sm-3 col-form-label">Date of Birth *</label>
                            <div class="col-sm-9">
                              <input value="<?php echo($scholar["father_birthdate"]); ?>" name="father_dob" required max="<?php echo date("Y-m-d"); ?>" type="date" class="form-control" id="inputEmail3" placeholder="Name">
                            </div>
                          </div>
                          <div class="form-group row">
                            <label for="inputEmail3" class="col-sm-3 col-form-label">Home Address *</label>
                            <div class="col-sm-9">
                              <input value="<?php echo($scholar["father_address"]); ?>" name="father_address" required type="text" class="form-control" id="inputEmail3" placeholder="Prk/Brgy/City/Prov">
                            </div>
                          </div>
                          <div class="form-group row">
                            <label for="inputPassword3" class="col-sm-3 col-form-label">Contact No. *</label>
                            <div class="col-sm-9">
                              <input value="<?php echo($scholar["father_contact"]); ?>" name="father_contact" required type="number"
 
 onkeypress="return event.keyCode === 8 || event.charCode >= 48 && event.charCode <= 57" class="form-control" id="inputPassword3" placeholder="---">
                            </div>
                          </div>
                          <div class="form-group row">
                            <label for="inputPassword3" class="col-sm-4 col-form-label">Present Occupation. *</label>
                            <div class="col-sm-8">
                              <input type="text" value="<?php echo($scholar["father_occupation"]); ?>" required name="father_occupation" class="form-control" id="inputPassword3" placeholder="---">
                            </div>
                          </div>
                          <div class="form-group row">
                            <label for="inputPassword3" class="col-sm-5 col-form-label">Office Address. (optional)</label>
                            <div class="col-sm-7">
                              <input name="father_office" type="text" class="form-control" id="inputPassword3" placeholder="---">
                            </div>
                          </div>

                          <div class="form-group row">
                            <label for="inputPassword3" class="col-sm-5 col-form-label">Estimated Annual Income. *</label>
                            <div class="col-sm-7">
                              <input value="<?php echo($scholar["father_income"]); ?>" required name="father_income" type="number"
 
 onkeypress="return event.keyCode === 8 || event.charCode >= 48 && event.charCode <= 57" class="form-control" id="inputPassword3" placeholder="---">
                            </div>
                          </div>

                          <div class="form-group row">
                            <label for="inputPassword3" class="col-sm-6 col-form-label">Highest Educational Attainment. *</label>
                            <div class="col-sm-6">
                            <select required name="father_educational" class="form-control select2" >
                              <?php if($scholar["father_education_attainment"] != ""): ?>
                                <option selected value="<?php echo($scholar["father_education_attainment"]); ?>"><?php echo($scholar["father_education_attainment"]); ?></option>
                              <?php else: ?>
                                <option selected disabled value="">Please select Educational Attainment</option>
                              <?php endif; ?>
                                <option value="College Graduate">College Graduate</option>
                                <option value="College Level">College Level</option>
                                <option value="Vocational">Vocational</option>
                                <option value="High School Graduate">High School Graduate</option>
                                <option value="High School Level">High School Level</option>
                                <option value="Elementary Graduate">Elementary Graduate</option>
                                <option value="Elementary Level">Elementary Level</option>
                         
                              </select>
                              <!-- <input name="father_income" type="number" class="form-control" id="inputPassword3" placeholder="---"> -->
                            </div>
                          </div>

                          <div class="form-group row">
                            <label for="inputPassword3" class="col-sm-4 col-form-label">Name of School *</label>
                            <div class="col-sm-8">
                              <input value="<?php echo($scholar["father_school"]); ?>" name="father_school" type="text" class="form-control" id="inputPassword3" placeholder="---">
                            </div>
                          </div>

                        </div>
                        </div>
                        <div class="col-md-6" style="border-left: 2px solid black;">
                        <div class="card-header">
                          <h3 class="card-title">MOTHER</h3>
                        </div>
                        <div class="card-body">
                          <div class="form-group row">
                            <label for="inputEmail3" class="col-sm-2 col-form-label">Name *</label>
                            <div class="col-sm-10">
                              <input value="<?php echo($scholar["mother_name"]); ?>" required name="mother_name" type="text" class="form-control" id="inputEmail3" placeholder="Name">
                            </div>
                          </div>
                          <div class="form-group row">
                            
                            <label for="inputEmail3" class="col-sm-3 col-form-label">Date of Birth *</label>
                            <div class="col-sm-9">
                              <input value="<?php echo($scholar["mother_birthdate"]); ?>" required max="<?php echo date("Y-m-d"); ?>" name="mother_dob" type="date" class="form-control" id="inputEmail3" placeholder="Name">
                            </div>
                          </div>
                          <div class="form-group row">
                            <label for="inputEmail3" class="col-sm-3 col-form-label">Home Address *</label>
                            <div class="col-sm-9">
                              <input value="<?php echo($scholar["mother_address"]); ?>" required name="mother_address" type="text" class="form-control" id="inputEmail3" placeholder="Prk/Brgy/City/Prov">
                            </div>
                          </div>
                          <div class="form-group row">
                            <label for="inputPassword3" class="col-sm-3 col-form-label">Contact No. *</label>
                            <div class="col-sm-9">
                              <input value="<?php echo($scholar["mother_contact"]); ?>" required name="mother_contact" type="number"
 
 onkeypress="return event.keyCode === 8 || event.charCode >= 48 && event.charCode <= 57" class="form-control" id="inputPassword3" placeholder="---">
                            </div>
                          </div>
                          <div class="form-group row">
                            <label for="inputPassword3" class="col-sm-4 col-form-label">Present Occupation. *</label>
                            <div class="col-sm-8">
                              <input value="<?php echo($scholar["mother_occupation"]); ?>" required name="mother_occupation" type="text" class="form-control" id="inputPassword3" placeholder="---">
                            </div>
                          </div>
                          <div class="form-group row">
                            <label for="inputPassword3" class="col-sm-5 col-form-label">Office Address. (optional)</label>
                            <div class="col-sm-7">
                              <input name="mother_office" value="<?php echo($scholar["mother_occupation_address"]); ?>" type="text" class="form-control" id="inputPassword3" placeholder="---">
                            </div>
                          </div>
                          
                          <div class="form-group row">
                            <label for="inputPassword3" class="col-sm-5 col-form-label">Estimated Annual Income. *</label>
                            <div class="col-sm-7">
                              <input required value="<?php echo($scholar["mother_income"]); ?>" name="mother_income" type="number"
 
    onkeypress="return event.keyCode === 8 || event.charCode >= 48 && event.charCode <= 57" class="form-control" id="inputPassword3" placeholder="---">
                            </div>
                          </div>

                          <div class="form-group row">
                            <label for="inputPassword3" class="col-sm-6 col-form-label">Highest Educational Attainment. *</label>
                            <div class="col-sm-6">
                            <select required name="mother_educational" class="form-control select2" >
                              <?php if($scholar["mother_education_attainment"] != ""): ?>
                                <option selected  value="<?php echo($scholar["mother_education_attainment"]); ?>"><?php echo($scholar["mother_education_attainment"]); ?></option>
                              <?php else: ?>
                                <option selected disabled value="">Please select Educational Attainment</option>
                              <?php endif; ?>
                                <option value="College Graduate">College Graduate</option>
                                <option value="College Level">College Level</option>
                                <option value="Vocational">Vocational</option>
                                <option value="High School Graduate">High School Graduate</option>
                                <option value="High School Level">High School Level</option>
                                <option value="Elementary Graduate">Elementary Graduate</option>
                                <option value="Elementary Level">Elementary Level</option>
                              </select>
                              <!-- <input name="father_income" type="number" class="form-control" id="inputPassword3" placeholder="---"> -->
                            </div>
                          </div>

                          <div class="form-group row">
                            <label for="inputPassword3" class="col-sm-4 col-form-label">Name of School *</label>
                            <div class="col-sm-8">
                              <input value="<?php echo($scholar["mother_school"]); ?>" required name="mother_school" type="text" class="form-control" id="inputPassword3" placeholder="---">
                            </div>
                          </div>

                          
                         




                        </div>
                        </div>
                      </div>
</div>
                      <button type="button" class="btn btn-primary" onclick="stepper.previous()">Previous</button>
                      <button type="button" class="btn btn-primary" onclick="validateAndProceed(5)">Next</button>
                    </div>


                    <div id="scholarship-part" class="content" role="tabpanel" aria-labelledby="information-part-trigger"  data-step="2">
                      <div class="form-group">
                        <label for="exampleInputEmail1">Name of School</label>
                        <input value="<?php echo($scholar["school_name"]); ?>" type="text" required name="school_name" class="form-control" id="exampleInputEmail1" placeholder="Enter ...">
                      </div>
                     
                      <div class="form-group">
                        <label>Year Level</label>
                        <select id="yearLevelSelect" name="year_level" required class="form-control">
                        <?php $year_level = query("select * from year_level order by level_id asc"); ?>
                        <?php if($scholar["year_level"] == ""): ?>
                          <option value="" selected disabled>Please select year level</option>
                        <?php endif; ?>
                          <?php foreach($year_level as $row): ?>

                            <?php if($scholar["year_level_id"] == $row["level_id"]): ?>
                              <option selected data-type="<?php echo($row["type"]); ?>" value="<?php echo($row["level_id"]); ?>">[<?php echo($row["type"]); ?>] - <?php echo($row["year_level"]); ?></option>
                            <?php else: ?>
                              <option data-type="<?php echo($row["type"]); ?>" value="<?php echo($row["level_id"]); ?>">[<?php echo($row["type"]); ?>] - <?php echo($row["year_level"]); ?></option>
                            <?php endif; ?>

                            
                          <?php endforeach; ?>
                        </select>
                      </div>

                      <div id="courseInputDiv" <?php if($scholar["course"] != ""): ?>

<?php else: ?>
  style="display: none;"
<?php endif; ?>>
                      
                      <div class="form-group">
                        <label>Courses</label>
                        <?php $course = query("select * from courses"); ?>
                        <select name="course" required class="form-control" id="courseInput" style="width: 100%;" >
                        <option value="" disabled>Please select Course</option>
                        <?php if($scholar["course"] != ""): ?>
                            <option selected value="<?php echo($scholar["course"]); ?>"><?php echo($scholar["course"]); ?></option>
                          <?php endif; ?>
                        <?php foreach($course as $row): ?>
                          <option value="<?php echo($row["course_name"]); ?>"><?php echo($row["course_name"]); ?></option>
                        <?php endforeach; ?>
                        </select>
                      </div>
                        </div>




             

                      <button type="button" class="btn btn-primary" onclick="stepper.previous()">Previous</button>
                      <button type="button" class="btn btn-primary"  onclick="validateAndProceed(2)">Next</button>
                    </div>


                    <div id="children-part" class="content" role="tabpanel" aria-labelledby="another_information-part-trigger" >
                
                      <button type="button" class="btn btn-primary" onclick="stepper.previous()">Previous</button>
                      <button type="button" class="btn btn-primary" onclick="stepper.next()">Next</button>
                </div>

                    <div id="requirements-part" class="content" role="tabpanel" aria-labelledby="another_information-part-trigger"  data-step="3">
                    <div class="form-group">
                      <label for="customFile">Family picture and picture of the applicant</label>
                      <?php if($scholar["family_picture"] != ""): ?>
                        <br>
                        <a target="_blank" href="<?php echo($scholar["family_picture"]); ?>">View Document</a>
                      <?php endif; ?>
                      <div class="custom-file">
                        <input name="family_pic" accept="application/msword,image/jpeg,image/gif,image/png,application/pdf,image/x-eps" type="file" class="custom-file-input" id="family_pic">
                        <label class="custom-file-label" for="family_pic">Upload / Reupload Document</label>
                      </div>
                    </div>  
                    <div class="form-group">
                      <label for="customFile">Barangay clearance as proof of residence (must be at least 3 years)</label>
                      <?php if($scholar["barangay_clearance"] != ""): ?>
                        <br>
                        <a target="_blank" href="<?php echo($scholar["barangay_clearance"]); ?>">View Document</a>
                      <?php endif; ?>
                      <div class="custom-file">
                        <input name="barangay_clearance" accept="application/msword,image/jpeg,image/gif,image/png,application/pdf,image/x-eps" type="file" class="custom-file-input" id="barangay_clearance">
                        <label class="custom-file-label" for="barangay_clearance">Upload / Reupload Document</label>
                      </div>
                    </div>  
                    <div class="form-group">
                      <label for="customFile">Certificate of Low-Income Bracket</label>
                      <?php if($scholar["low_income"] != ""): ?>
                        <br>
                        <a target="_blank" href="<?php echo($scholar["low_income"]); ?>">View Document</a>
                      <?php endif; ?>
                      <div class="custom-file">
                        <input name="low_income" accept="application/msword,image/jpeg,image/gif,image/png,application/pdf,image/x-eps" type="file" class="custom-file-input" id="low_income">
                        <label class="custom-file-label" for="low_income">Upload / Reupload Document</label>
                      </div>
                    </div>  
                    <div class="form-group">
                      <label for="customFile">Photocopy of Birth Certificate</label>
                      <?php if($scholar["birth_certificate"] != ""): ?>
                        <br>
                        <a target="_blank" href="<?php echo($scholar["birth_certificate"]); ?>">View Document</a>
                      <?php endif; ?>
                      <div class="custom-file">
                        <input name="birth_certificate" accept="application/msword,image/jpeg,image/gif,image/png,application/pdf,image/x-eps" type="file" class="custom-file-input" id="birth_certificate">
                        <label class="custom-file-label" for="birth_certificate">Upload / Reupload Document</label>
                      </div>
                    </div>  
                    <div class="form-group">
                      <label for="customFile">Photocopy of Grade Card</label>
                      <?php if($scholar["grade_card"] != ""): ?>
                        <br>
                        <a target="_blank" href="<?php echo($scholar["grade_card"]); ?>">View Document</a>
                      <?php endif; ?>
                      <div class="custom-file">
                        <input name="grade_card" accept="application/msword,image/jpeg,image/gif,image/png,application/pdf,image/x-eps" type="file" class="custom-file-input" id="grade_card">
                        <label class="custom-file-label" for="grade_card">Upload / Reupload Document</label>
                      </div>
                    </div>  

                          <button type="button" class="btn btn-primary" onclick="stepper.previous()">Previous</button>
                          <button type="button" class="btn btn-primary" onclick="validateAndProceed(3)">Next</button>
                          <!-- <button type="submit" class="btn btn-primary">Submit</button> -->

                          <!-- <button type="submit" class="btn btn-primary">Submit</button> -->
                    </div>



                    <div id="profile-part" class="content" role="tabpanel" aria-labelledby="another_information-part-trigger">
                      <div class="row">
                        <div class="col-6">
                        <div class="form-group">
                          <label for="Image" class="form-label">Profile Image</label>
                          <input accept="image/png, image/gif, image/jpeg" class="form-control" type="file" id="formFile" name="profile_image" onchange="preview()">
                          <button onclick="clearImage()" type="button" class="btn btn-primary mt-3">Clear</button>
                      </div>

                        </div>
                        <div class="col-6">
                        
                        <img id="frame" 
                        <?php if($scholar["profile_image"] != ""): ?>
                          src="<?php echo($scholar["profile_image"]); ?>"
                        <?php else: ?>
                          src=""
                        <?php endif; ?>
                        
                        
                        class="img-fluid" width="300" height="300" />

                        </div>
                      </div>
                      
                     

                          <button type="button" class="btn btn-primary" onclick="stepper.previous()">Previous</button>
                          <button type="submit" class="btn btn-primary">Submit</button>

                          <!-- <button type="submit" class="btn btn-primary">Submit</button> -->
                


                  </div>
                </div>
              </div>
              <!-- /.card-body -->
             
            </div>
</form>
            <!-- /.card -->
          </div>
        </div>
      </div>
    </section>
    <!-- /.content -->
  </div>


<script src="AdminLTE_new/plugins/select2/js/select2.full.min.js"></script>

<script src="AdminLTE_new/plugins/bootstrap4-duallistbox/jquery.bootstrap-duallistbox.min.js"></script>
<script src="AdminLTE_new/plugins/moment/moment.min.js"></script>
<script src="AdminLTE_new/plugins/inputmask/jquery.inputmask.min.js"></script>
<script src="AdminLTE_new./plugins/daterangepicker/daterangepicker.js"></script>
<script src="AdminLTE_new/plugins/bootstrap-colorpicker/js/bootstrap-colorpicker.min.js"></script>
<script src="AdminLTE_new/plugins/tempusdominus-bootstrap-4/js/tempusdominus-bootstrap-4.min.js"></script>
<script src="AdminLTE_new/plugins/bootstrap-switch/js/bootstrap-switch.min.js"></script>
<script src="AdminLTE_new/plugins/bs-stepper/js/bs-stepper.min.js"></script>
<script src="AdminLTE_new/plugins/sweetalert2/sweetalert2.min.js"></script>
<script src="AdminLTE_new/plugins/bs-custom-file-input/bs-custom-file-input.min.js"></script>
<script>
  document.addEventListener('DOMContentLoaded', function () {
    window.stepper = new Stepper(document.querySelector('.bs-stepper'))
  })
  $(function () {
  bsCustomFileInput.init();
});




$('#courseInput').select2({
        tags: true,
        placeholder: "Select a course or type a new one",
        allowClear: true
    });


function validateAndProceed(stepNumber) {
    var isValid = validateInputs(stepNumber);

    // Remove previous validation styles
    $(`#bs-stepper-form .content[data-step="${stepNumber}"] [required]`).removeClass('validation-error');

    // Validate each required input
    $(`#bs-stepper-form .content[data-step="${stepNumber}"] [required]`).each(function () {
 
        // if (!$(this).val()) {
        //     isValid = false;
        //     // Add validation-error class to highlight the field
        //     $(this).addClass('validation-error');
        // }
    });

    // Proceed to the next step if all inputs are valid
    if (isValid) {
        stepper.next();
    } else {
        // Optionally, you can display a message to the user about the validation error.
        // alert('Please fill out all required fields before proceeding.');
    }
}

  // Function to validate inputs for each step
  function validateInputs(stepNumber) {
    var boolValid = true;
    // Get all required fields for the current step
    var requiredInputs = $('.bs-stepper-content .content[data-step="'+stepNumber+'"] [required]');
    console.log(requiredInputs);
    // Validate each required input
    for (var i = 0; i < requiredInputs.length; i++) {
      var input = requiredInputs[i];
      // Check if the input is empty (trimming whitespace)
      if (input.value.trim() === '') {
        input.classList.add("validation-error");
        boolValid = false;
      }
      else{
        input.classList.remove("validation-error");
      }
    }

    if(boolValid == true){
      return true;
    }
    else{
        alert(`Please fill out all required fields for Step ${stepNumber}.`);
        return false;
    }

    // If all validations pass, return true
    // return true;
  }



  $(function () {
        $("#father_college_grad_check").click(function () {
            if ($(this).is(":checked")) {
                $("#father_college_grad_div").show();
            } else {
                $("#father_college_grad_div").hide();
            }
        });


        $("#father_college_level_check").click(function () {
            if ($(this).is(":checked")) {
                $("#father_college_level_div").show();
            } else {
                $("#father_college_level_div").hide();
            }
        });


        $("#father_vocational_check").click(function () {
            if ($(this).is(":checked")) {
                $("#father_vocational_div").show();
            } else {
                $("#father_vocational_div").hide();
            }
        });


        $("#mother_college_grad_check").click(function () {
            if ($(this).is(":checked")) {
                $("#mother_college_grad_div").show();
            } else {
                $("#mother_college_grad_div").hide();
            }
        });


        $("#mother_college_level_check").click(function () {
            if ($(this).is(":checked")) {
                $("#mother_college_level_div").show();
            } else {
                $("#mother_college_level_div").hide();
            }
        });


        $("#mother_vocational_check").click(function () {
            if ($(this).is(":checked")) {
                $("#mother_vocational_div").show();
            } else {
                $("#mother_vocational_div").hide();
            }
        });
    });


    
  


</script>

<script>
    // Get references to the select and course input elements
    // $('#courseInput').select2();

    // Get references to the select and course input elements
    var yearLevelSelect = $("#yearLevelSelect");
    var courseInput = $("#courseInputDiv");
    // $('#courseInputDiv').select2('close');

    // Add an event listener to the select element
    yearLevelSelect.on("change", function() {
        // Get the selected option's data-type attribute
        var selectedOption = yearLevelSelect.find(":selected");
        var dataType = selectedOption.data("type");
        // alert(dataType);

        // Check if the selected option has data-type "COLLEGE"
        if (dataType === "COLLEGE") {
            // If it's a college, show the course input box
            courseInput.show();
        } else {
            // If it's not a college, hide the course input box
            courseInput.hide();
        }
    });
</script>


<script>
            function preview() {
                frame.src = URL.createObjectURL(event.target.files[0]);
            }
            function clearImage() {
                document.getElementById('formFile').value = null;
                frame.src = "";
            }
        </script>


  <?php require("layouts/footer.php") ?>