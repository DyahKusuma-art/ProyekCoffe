<?php

$connect= new mysqli("localhost","root", "","tokoku");
if($connect){


}else{
    echo "koneksi gagal ke DB";
    exit();
}

?>