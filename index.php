<?php
session_start();
include_once ("./mydb/databaseManager/DBEnter.db.php");
include_once("./layouts/header.php");
?>

<section class="container">
  <div class="text-center">
    <h1>Welcome to my self-log/vent page</h1>

  <?php
    $result = DB::query("SELECT * FROM log");

    if (!$result) {

    } else {
      foreach ($result as $row){
        $date = $row['date'];
        $title = $row['title'];
        $info = $row['info'];
  ?>
        </div>
        <div class="card">
          <div class="card-header">
            <h6><?php echo $date; ?></h6>
          </div>
          <div class="card-body">
            <h5 class="card-title"><?php $title; ?></h5>
            <p class="card-text"><?php echo $info; ?></p>
          </div>
        </div>
  <?php
      }
    }
  ?>
</section>

<!--Body Ends in footer.php-->
<?php
require_once("./layouts/footer.php");
?>