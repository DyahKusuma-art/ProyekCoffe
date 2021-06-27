<?php

include 'conn.php';

$email = $_POST['email'];
$sandi = $_POST['sandi'];

    $result = "SELECT * from user where email='".$email."' AND sandi='".$sandi."' ";
    $hasil = mysqli_query($connect,$result);
    $r = mysqli_num_rows($hasil);
    if ($r==1) {
            echo json_encode("sukses");
    }else {
        echo json_encode("gagal");
       }
?>