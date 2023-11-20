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
/* .tabular, .tabular th, .tabular td {
   border: 1px solid black !important;
}
.table td{
	font-size: 11.3px !important;
} */

.table{
  margin-bottom:1px !important;
}

/* #fordtr{font-size:20px;}
#fordtr td{padding: 1px !important;}
#fordtr th{padding: 7px !important;} */

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
$scholars = query("select aa.*, CONCAT(firstname, ' ', middlename, ' ', lastname) AS fullname from allowance_scholar aa
                  left join scholars s
                  on s.scholar_id = aa.scholar_id
                  where aa.allowance_id = ?", $options["allowance_id"]);
$allowance = query("select aa.*, sy.school_year from allowance aa
                    left join school_year sy
                    on sy.school_year_id = aa.school_year_id
                     where allowance_id = ?", $options["allowance_id"]);
$allowance = $allowance[0];
$faci = query("select * from users where user_id = ?", $allowance["facilitator"]);
$faci = $faci[0];
// dump($scholars);


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
<h3 class="text-center" style="font-weight:700;font-size:180%; color:#000;">Allowance Report</h3>
<h3 class="text-center" style="font-size:180%; color:#000;font-weight:700;">for <?php echo(date("F", mktime(0, 0, 0, $allowance["month"], 1))); ?> <?php echo($allowance["school_year"]); ?></h3>

<table class="table table-bordered">
  <thead>
    <th></th>
    <th>Scholar's Name</th>
    <th>Status</th>
    <th>Amount</th>
    <th>Date CLAIMED / RETURNED</th>
  </thead>
  <tbody>
    <?php $i=1; foreach($scholars as $row): ?>
      <tr>
        <td><?php echo($i); ?></td>
        <td><?php echo($row["fullname"]); ?></td>
        <td><?php echo($row["status"]); ?></td>
        <td><?php echo(to_peso($row["amount"])); ?></td>
        <?php $date = "";
        if($row["status"] == "CLAIMED"):
          $date  = new DateTime($row["date_claimed"]);
          $date = $date->format("F d, Y");
        elseif($row["status"] == "RETURNED"):
          $date  = new DateTime($row["date_returned"]);
          $date = $date->format("F d, Y");
        endif;
        ?>
        <td><?php echo($date); ?></td>
      </tr>
    <?php $i++; endforeach; ?>
  </tbody>

</table>

      


      <div style="position:absolute; bottom:0; margin-bottom:30px; width: 100%">
      <div class="row">
       
        <div class="col-xs-12 text-center">
        <p style="border-bottom: 4px solid black;"><?php echo($faci["fullname"]); ?></p>
        <p>FACILITATOR</p>
        </div>
      </div>
			
			</div>


<script>
$(".select2").select2();
</script>
