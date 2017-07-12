<?php
session_start();
  if(isset($_SESSION['id'])&&isset($_SESSION['password'])){
    $id = escapeshellcmd($_SESSION['id']);
    $password = escapeshellcmd($_SESSION['password']);
    $admission = escapeshellcmd($_SESSION['admission']);
    $dpid = escapeshellcmd($_SESSION['dpid']);

    system("ruby admission-test.rb $dpid $password $admission");

  }else {
    echo "エラー：リンクからアクセスして下さい";
  }


?>
