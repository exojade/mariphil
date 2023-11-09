<link rel="stylesheet" href="AdminLTE/dist/css/AdminLTE.min.css">
<link rel="stylesheet" href="AdminLTE/bower_components/bootstrap/dist/css/bootstrap.min.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Barlow:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet">

<style>



 hr{
  margin-bottom: 2px;
  margin-top: 2px;
 }

html *
{
	font-family: 'Barlow';
 
}
body{
  border: 4px solid black;
  padding:10px;
}
.tabular, .tabular th, .tabular td {
   border: 1px solid black !important;
}
.table td{
	font-size: 11.3px !important;
}

.table{
  margin-bottom:1px !important;
}

#fordtr{font-size:20px;}
#fordtr td{padding: 1px !important;}
#fordtr th{padding: 7px !important;}

p{
 
  font-size: 180%;
  
}

ul li{
  font-size: 180%;
}

hr{
  height:2px;border-width:6;color:#254C0B !important;background-color:#254C0B !important;
  border-top: 1px solid #254C0B;
}
	</style>

<style>

</style>
<?php
$options = unserialize($_GET["options"]);
// dump($options);

$forms = query("select sy.school_year, m.*, f.* from monthly_monitoring m
			left join forms f
			on m.form_id = f.form_id
			left join school_year sy
			on sy.school_year_id = f.school_year_id
			 where m.tbl_id = ?
			 order by f.timestamp desc", $options["tbl_id"]);

       $form = $forms[0];
       $scholar = query("select * from scholars where scholar_id = ?", $form["scholar_id"]);
       $scholar = $scholar[0];

       $faci = query("select * from users where user_id = ?", $form["created_by"]);
       $faci = $faci[0];

       $sponsor = query("select * from users where user_id = ?", $scholar["sponsor_id"]);
       $sponsor = $sponsor[0];
       // dump($scholar);
 
       $form_achievements = query("select * from monthly_monitoring_achievements where tbl_id = ?", $options["tbl_id"]);
       $form_uploads = query("select * from monthly_monitoring_upload where tbl_id = ?", $options["tbl_id"]);
?>

<div class="row">
  <div class="col-xs-5 text-right">
    <img  class="img-responsive  pull-right"  style="width: 40%; height: auto; background-color: #254C0B;" src="resources/mariphil.png">
  </div>
  <div class="col-xs-7">
    <h3 style="font-size:300%; color:#254C0B;font-weight:900;padding-top:15px;">MARIPHIL<br>FOUNDATION</h3>
  </div>
</div>
<br>
<p class="text-center" style="background-color:#254C0B; color:#fff; padding:10px; auto 10px auto;font-weight:700;font-size:180%;">Project MARIPHIL Foundation Inc.</p>
<br>
<div class="row">
  <div class="col-xs-6">
      <p><b>SCHOLAR:</b> <?php echo($scholar["firstname"] . " " . $scholar["lastname"]); ?></p> 
      <p><b>FACILITATOR:</b> <?php echo($faci["fullname"]); ?></p> 
      <p><b>SPONSOR:</b> <?php echo($sponsor["fullname"]); ?></p> 
  </div>
  <div class="col-xs-6">
      <p><b>SCHOOL YEAR:</b> <?php echo($form["school_year"]); ?></p> 
      <p><b>FORM TYPE:</b> QUARTERLY MONITORING</p> 
      <p><b>QUARTER:</b> <?php echo($form["form_kind"]); ?></p> 
  </div>
</div>

<hr>
<br>

<p><b>LATEST GENERAL WEIGHT AVERAGE (GWA):</b> <?php echo($form["grades"]); ?></p> 
<p><b>AWARDS AND ACHIEVEMENTS:</b></p> 
<ul>
  <?php foreach($form_achievements as $row): ?>
    <li><?php echo($row["achievement"]); ?></li>
  <?php endforeach; ?>
              </ul>
<br>
              <p><b>FACILITATOR REMARKS:</b></p> 
              <p style="margin-left: 20px;"><?php echo($form["remarks"]); ?></p> 


      <div style="position:absolute; bottom:0; margin-bottom:30px; width: 100%">
      <div class="row">
        <div class="col-xs-1">

        </div>
        <div class="col-xs-4 text-center">
        <p style="border-bottom: 4px solid black;"><?php echo($faci["fullname"]); ?></p>
        <p>FACILITATOR</p>
        </div>
      </div>
			
			</div>


<script>
$(".select2").select2();
</script>
