<?php

include 'conn.php';

$email = $_POST['email'];
$sandi = $_POST['sandi'];
$nama = $_POST['nama'];
$alamat = $_POST['alamat'];

    $result = $connect->query("SELECT * from user where email ='".$email."'");
    $hasil = mysqli_num_rows($result);
    if ($hasil==1) {
        echo json_encode("Gagal");
    }else {
       $insert = $connect->query ("INSERT INTO user (email,sandi,nama,alamat) Values('".$email."','".$sandi."','".$nama."','".$alamat."')");
       if ($insert) {
        echo json_encode("Sukses");
       }
    }
    
    
?>