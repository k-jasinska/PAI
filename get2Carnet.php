<?php
session_start();
require_once('baza.php');

if(!(($_SESSION['zalogowany'])==2) || !isset($_SESSION['zalogowany'])){
    header("Location: index.php?error=0");
    exit();
}
 if (isset($_POST['usun'])) {
    $id=$_SESSION['id_person'];
    $wynik=mysqli_query($link, "call t_del_OldEntrance($id)") or display_error(mysqli_error($link));
    header("location: checkCarnet.php");
 
} 
else{
    header("location: index.php?error=0");
}
function display_error($str) {
    header("Location: yourCarnet.php");
    $_SESSION['e_carnet']=$str;
    exit;
}
?> 