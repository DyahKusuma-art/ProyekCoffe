<?php

include 'conn.php';

$id = $_POST['id'];

$connect->query("DELETE FROM user WHERE id=".$id);

?>