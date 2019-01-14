<?php
require_once('baza.php');
session_start();

if(!(($_SESSION['zalogowany'])==1) || !isset($_SESSION['zalogowany'])){
    header("Location: index.php?error=0");
    exit();
} 

if (isset($_POST["id_person"])) {
    $id=mysqli_real_escape_string($link,$_POST["id_person"]);
    $wynik=mysqli_query($link, "call t_add_Log('$id')") or die("nie udało się pobrać danych");
    if (mysqli_error($link)) {
        echo '<div class="info">'.mysqli_error($link).'</div>';
      }
      else{
          echo "dodano wejscie";
      }
}
else{
    header("Location: index.php?error=0");
}
?>