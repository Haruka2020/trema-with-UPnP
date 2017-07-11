<?php
  #http://localhost/check.php?id=2&password=885apmn3ruoiwtyieutuqwrphyvhclq4
  header('Content-type: text/plain; charset=UTF-8');
  session_start();
  require('db_connect.php');
  $id =  $_GET['id'];
  $password = $_GET['password'];
  $array = $db->query("SELECT * FROM OneTime Where id=$id");
  $db_pass = $array['result'][0]['password'];

  if($db_pass != '' && $db_pass == $password){
    $_SESSION['id'] = $id;
    $_SESSION['password'] = $db_pass;
    $_SESSION['body'] = $array['result'][0]['body'];
    header('Location: select.php');
  }else{
    echo "IDとパスワードの組み合わせが違います";
  }
?>
