
<?php
require_once('baza.php');
function filtruj($zmienna,$link)
{
    if (get_magic_quotes_gpc()) {
        $zmienna = stripslashes($zmienna);
    }
$zmienna=htmlspecialchars(trim($zmienna));
    return mysqli_real_escape_string($link,$zmienna);
}
if(isset($_POST['email'])){
    $email = filtruj($_POST['email'],$link);
    if(empty($email))
    {
       exit("E-mail jest wymagany") ;
    }
    $wynik=mysqli_query($link, "Select * from Person where email='$email' ;") or die("nie udało się pobrać danych");
    $rows=mysqli_fetch_array($wynik);

    if($email==$rows['email']){
         exit("E-mail jest juz zajety") ;
    }
}
   else{
    header("Location: Register.php");
    exit;
   }
?>
 