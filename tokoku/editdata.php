<?php

include 'conn.php';

$id = $_POST['id'];
$kodeBarang = $_POST['kodeBarang'];
$namaBarang = $_POST['namaBarang'];
$hargaBarang = $_POST['hargaBarang'];
$stokBarang = $_POST['stokBarang'];
$gambarBarang = $_POST['gambarBarang'];

$connect->query("UPDATE barang SET kode ='".$kodeBarang."',nama='".$namaBarang."', harga='".$hargaBarang."', stok='".$stokBarang."', gambar='".$gambarBarang."' WHERE id=".$id);

?>