<?php
error_reporting(0);
$conn = mysqli_connect("localhost","root","","student");
if(count($_POST)>0) {
$roll_no=$_POST[roll_no];
$result = mysqli_query($conn,"SELECT * FROM user_data where roll_no='$roll_no' ");
}
?>
<!DOCTYPE html>
<html>
<head>
<title> Retrive data</title>
<style>
table, th, td {
    border: 1px solid black;
}
</style>
</head>
<body>
<table>
<tr>
<td>Name</td>
<td>Email</td>
<td>Roll No</td>

</tr>
<?php
$i=0;
while($row = mysqli_fetch_array($result)) {
?>
<tr>
<td><?php echo $row["name"]; ?></td>
<td><?php echo $row["email"]; ?></td>
<td><?php echo $row["roll_no"]; ?></td>
</tr>
<?php
$i++;
}
?>
</table>
</body>
</html>