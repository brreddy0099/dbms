
<!DOCTYPE html>
<html>
<head>
<title>Mining_stock </title>
<meta content="noindex, nofollow" name="robots">
<link href="style.css" rel="stylesheet" type="text/css">
</head>
<body>
<div class="maindiv">
<div class="divA">
<div class="title">
<h2>Mining_stock</h2>
</div>


<style>
    body{
 background-image:url("nice11.jpg");
    }

table,td,th
{
 padding:10px;
 border-collapse:collapse;
 font-family:Georgia, "Times New Roman", Times, serif;
 border:solid #ddd 2px;
}
</style>
</head>
<body>
<table align="center" border="1" width="100%">
<tr>
<th>Stock_name</th>
<br>
<th> No_of_shares</th>
</tr>

<form action="" method="POST">
  <input type="text"  name="Added_date" placeholder="Enter Year to search"/><br><br>

  <input type="submit"  name="search" value="search data"><br>
  <br>
</form>

<?php

$connection = mysqli_connect("localhost", "root", ""); // Establishing Connection with Server
$db = mysqli_select_db($connection, 'Mining_stock'); // Selecting Database
//MySQL Query to read data

if (isset($_POST['search'])) {
    $Added_date = $_POST['Added_date'];
    $query1 = "CALL ase('$Added_date')";

    $query_run = mysqli_query($connection,$query1);
   
while ($row = mysqli_fetch_array($query_run)) {

    
        ?>

<form action="" method="POST">


<tr>
    <td><p><?php echo $row['Stock_name']; ?></p></td>
    <td><p><?php echo $row['No_of_shares']; ?></p></td>
    </tr>

  
</form>

<?php

        
    }
}
   ?>
   </table>
</body>
</html>
