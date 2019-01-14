<?php
session_start();
if(isset($_POST['color'])){
    $color=$_POST['color'];
    if(isset($_COOKIE['background'])){
        unset($_COOKIE['background']);
        setcookie('background', null, time() - 1);
    }
    if($color=="green"){
        setcookie('background',"style/background/green.jpg", time() + (86400 * 30), "/");
        exit("url('style/background/green.jpg')");
    }
    if($color=="pioro"){
        setcookie('background',"style/background/pioro.jpg", time() + (86400 * 30), "/");
        exit("url('style/background/pioro.jpg')");
    }
    if($color=="soft"){
        setcookie('background',"style/background/soft.png", time() + (86400 * 30), "/");
        exit("url('style/background/soft.png')");
    }
    if($color=="brown"){
        setcookie('background',"style/background/brown.jpg", time() + (86400 * 30), "/");
        exit("url('style/background/brown.jpg')");
    }
    if($color=="blue"){
        setcookie('background',"style/background/blue.jpg", time() + (86400 * 30), "/");
        exit("url('style/background/blue.jpg')");
    }
    if($color=="piana"){
        setcookie('background',"style/background/piana.jpg", time() + (86400 * 30), "/");
        exit("url('style/background/piana.jpg')");
    }
}
else{
    header("Location: index.php?error=0");
}
?>