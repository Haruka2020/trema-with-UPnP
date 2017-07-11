<?php
session_start();
  if(isset($_SESSION['id'])&&isset($_SESSION['password'])){
    $socket = socket_create(AF_INET,SOCK_STREAM,SOL_TCP);
    socket_connect($socket,'127.0.0.1',9999);
    $id = $_SESSION['id'];
    $password = $_SESSION['password'];
    $admission = $_SESSION['admission'];
    socket_write($socket,"$id,$password,$admission");
    socket_close($socket);
    echo "ok";
  }else {
    echo "エラー：リンクからアクセスして下さい";
  }


?>
