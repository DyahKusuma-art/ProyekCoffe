<?php

include 'conn.php';

$id = $_POST['id'];
$namaUser = $_POST['namaUser'];
$alamatUser = $_POST['alamatUser'];
$emailUser = $_POST['emailUser'];
$sandiUser = $_POST['sandiUser'];

$connect->query("UPDATE user SET nama ='".$namaUser."',alamat='".$alamatUser."', email='".$emailUser."', sandi='".$sandiUser."' WHERE id=".$id);

?>