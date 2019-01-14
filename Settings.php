<?php
require_once('baza.php');
session_start();
if(!(($_SESSION['zalogowany'])==2) || !isset($_SESSION['zalogowany'])){
    header("Location: index.php?error=0");
    exit;
}
?>
<!DOCTYPE html>
<html lang="pl">
<head>
  <meta charset="utf-8">
  <title>GymFit</title>
  <link rel="shortcut icon" href="style/image/favicon .ico" />
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <!-- table -->
  <script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.js"></script>
  <script type="text/javascript" src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
  <script type="text/javascript" src="https://cdn.datatables.net/1.10.19/js/dataTables.foundation.min.js"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/foundation/6.4.3/css/foundation.min.css">
  <link rel="stylesheet" href="https://cdn.datatables.net/1.10.19/css/dataTables.foundation.min.css">
  <!-- icon -->
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">
<!-- style -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">

 <link rel="stylesheet" type="text/css" href="style/styleAdmin.css" /> 
 <link rel="stylesheet" type="text/css" href="style/styleSettings.css" /> 
</head>

<body>

<?php
if(isset($_COOKIE['background'])){
  echo "  <script>
  document.body.style.backgroundImage = 'url(". $_COOKIE['background'] .")';
    </script>
    ";
}
 ?>
 
      <!-- header -->
<div class="wrapper max">
<header>
  <nav id="topnav">
    <div class="logo">GymFit</div>
    <div class="menu1">
    <ul>
        <li id="hello">Witaj, 
        <?php
        echo $_SESSION['user'];

        ?>
          <i class="far fa-user"></i></li>
        <li><a id="logout" href="logout.php">Wyloguj  <i class="fas fa-sign-out-alt"></i></a></li>
      </ul>
    </div>
  </nav>
</header> 
</div>


<!-- sidenav -->
<div class="wrapper1 active"> 
    <div class="burger">
        <i class="fas fa-bars  visible show active "></i>
        <i class="fas fa-times visible active"></i>
    </div>

    <aside class="active">
        		<nav id="ml-menu" class="menu">
			
			<div class="menu__wrap">
				<ul data-menu="main" class="menu__level">
				
                    <li class="menu__item"><a class="menu__link" data-submenu="submenu-1" href="user.php"><i class="fas fa-users"></i>Dane</a></li>
					<li class="menu__item"><a class="menu__link" data-submenu="submenu-2" href="checkCarnet.php"><i class="fas fa-list-ul"></i>Twój Karnet</a></li>
					<li class="menu__item"><a class="menu__link" data-submenu="submenu-3" href="changePass.php"><i class="far fa-edit"></i>Zmień hasło </a></li>
					<li class="menu__item"><a class="menu__link" id="menu_click" data-submenu="submenu-4" href="Settings.php"><i class="fas fa-cog"></i>Ustawienia </a></li>		
					</ul>
			</div>
		</nav>
    </aside>
</div>
   


<div class="wrapper1 active"> 
<div class="content">
<h3>Wybierz tło:</h3>
<div class="row">
<div id="green" class="col-xl-4 col-md-6 color green"></div>
<div id="pioro" class="col-xl-4 col-md-6 color pioro"></div>
<div id="brown" class="col-xl-4 col-md-6 color brown"></div>
<div id="piana" class="col-xl-4 col-md-6 color piana"></div>
<div id="blue" class="col-xl-4 col-md-6 color blue"></div>
<div id="soft" class="col-xl-4 col-md-6 color soft"></div>
</div>

</div>
</div>


<script>
    $(document).ready(function(){
        let divy = document.querySelectorAll('.color');

        for(let i=0;i<divy.length;i++){
        divy[i].addEventListener('click',function(){
            var color= this.id;
            $.ajax({
            url:"changeBG.php",
            method:"POST",
            data:{color:color},
            success:function(data){
             document.body.style.backgroundImage = data;
            }
            });
        });
        }
    });
</script>


<!--zamkniecie polaczenia-->
 <?php
  mysqli_close($link);
 ?>
<!--do przyciemnienia naglówka-->
    <script type="text/javascript">
      $(document).ready(function() {
            $(".menu-icon").on("click", function() {
                  $("nav ul").toggleClass("showing");
            });
      });
      $(window).on("scroll", function() {
            if($(window).scrollTop()) {
                  $('#topnav').addClass('black');
            }
            else {
                  $('#topnav').removeClass('black');
            }
      })
      </script>
  
<!--  do chowania nawigacji -->
    <script src="script.js"></script> 
</body>
</html>
