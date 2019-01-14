<?php
session_start();
if($_SESSION['zalogowany']==2){
    unset($_SESSION['id_person']);
    unset($_SESSION['user']);
    unset($_SESSION['surname']);
    unset($_SESSION['phone']);
    unset($_SESSION['email']);
    unset($_SESSION['street']);
    unset($_SESSION['code']);
    unset($_SESSION['city']);
}
    unset($_SESSION['zalogowany']);
    session_destroy();
    header("Location: index.php?error=1");
?>