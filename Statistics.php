<?php
session_start();

if(!(($_SESSION['zalogowany'])==1) || !isset($_SESSION['zalogowany'])){
    header("Location: index.php?error=0");
    exit();
}
?>

<?php
require_once('baza.php');
?> 

<!DOCTYPE html>
<html lang="pl">
<head>
  <meta charset="utf-8">
  <title>AdminPanel</title>
  <link rel="shortcut icon" href="style/image/favicon .ico" />
  <meta name="viewport" content="width=device-width, initial-scale=1">

  <!-- icons -->
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">

  <!-- modal i datatable-->
  <script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.js"></script>
<script type="text/javascript" src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript" src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="https://cdn.datatables.net/1.10.19/js/dataTables.bootstrap.min.js"></script>
<script type="text/javascript" src="https://cdn.datatables.net/responsive/2.2.3/js/dataTables.responsive.min.js"></script>
<script type="text/javascript" src="https://cdn.datatables.net/responsive/2.2.3/js/responsive.bootstrap.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdn.datatables.net/1.10.19/css/dataTables.bootstrap.min.css">
<link rel="stylesheet" href="https://cdn.datatables.net/responsive/2.2.3/css/responsive.bootstrap.min.css">
 <!-- style -->
  <link rel="stylesheet" type="text/css" href="style/styleAdmin.css" /> 
</head>

<body>
<!-- header -->
<div class="wrapper max">
<header>
  <nav id="topnav">
    <div class="logo">GymFit</div>
    <div class="menu1">
    <ul>
        <li id="hello">Witaj, Admin  <i class="far fa-user"></i></li>
        <li><a href="logout.php" class="logout">Wyloguj  <i class="fas fa-sign-out-alt "></i></a></li>
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
                <li class="menu__item"><a class="menu__link" data-submenu="submenu-1" href="AdminPanel.php"><i class="fas fa-users"></i>Lista klientów</a></li>
				<li class="menu__item"><a class="menu__link" data-submenu="submenu-2" href="CarnetList.php"><i class="fas fa-list-ul"></i>Lista karnetów</a></li>
				<li class="menu__item"><a class="menu__link" id="menu_click" data-submenu="submenu-3" href="Statistics.php"><i class="fas fa-chart-line"></i>Statystyki </a></li>
				<!-- <li class="menu__item"><a class="menu__link" data-submenu="submenu-4" href="#"><i class="fas fa-cog"></i>Ustawienia </a></li>		 -->
				</ul>
			</div>
		</nav>
    </aside>
</div>
    

<!-- table -->
<div class="wrapper1 active"> 
    <div class="content">
<div id="info" class="info"></div>
<div id="employee_table">
<table id="table" class="table table-striped table-bordered nowrap" style="width:100%; background-color:white;">
      <thead>
      <tr>
      <th >Rok</th>
      <th >Miesiąc</th>
      <th >Liczba wejść</th>
      </tr>
      </thead>
      <tbody>

      <?php
      $q=mysqli_query($link, "select year(date_log) Rok,
      month(date_log ) Miesiac,
      count(id_log) as LiczbaWejsc
      from entrance en 
      inner join entrance_log el on en.id_entrance = el.id_entrance 
      group by year(date_log), month(date_log)
      order by year(date_log), month(date_log) ;");
    
      while($tabl=mysqli_fetch_assoc($q)){
     
      $tabl['Rok']=htmlspecialchars($tabl['Rok']);
      $tabl['Miesiac']=htmlspecialchars($tabl['Miesiac']);
      $tabl['LiczbaWejsc']=htmlspecialchars($tabl['LiczbaWejsc']);

      echo "<tr> <td>$tabl[Rok] </td> <td>$tabl[Miesiac]</td><td> $tabl[LiczbaWejsc]</td></tr>";
      }
      ?>
      </tbody>
      <tfoot>
      <tr>
      <th >Rok</th>
      <th >Miesiąc</th>
      <th >Liczba wejść</th>
      </tr>
      </tfoot> 
      </table>
      </div>
</div>
</div>



<!--zamkniecie polaczenia-->
<?php
  mysqli_free_result($q);
  mysqli_close($link);
 ?>
<!--   do tabeli-->
<script>$(document).ready(function() {
    $('#table').DataTable( {
        responsive: true   
    } );
} );</script>

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

    <noscript>
      Twoja przeglądarna nie obsługuje języka JavaScript. Zmień ustawienia, aby korzystać z aplikacji.
    </noscript>
</body>
</html>
