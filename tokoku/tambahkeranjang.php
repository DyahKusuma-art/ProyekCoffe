<?php

include 'conn.php';

$nama = $_POST['namaBarang'];
$harga = $_POST['hargaBarang'];
$gambar = $_POST['gambarBarang'];
$jumlah = $_POST['jumlahBarang'];

$connect->query("INSERT INTO keranjang (nama,harga,gambar,jumlah) VALUES ('".$namaBarang."','".$hargaBarang."','".$gambarBarang."','".$jumlahBarang."')");

?>