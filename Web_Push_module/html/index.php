<?php
  header('Content-type: text/plain; charset=UTF-8');
  require('db_connect.php');
  session_start();
  $array = $db->query("SELECT * FROM OneTime");
  print_r($array['result'][0]['body'])
?>
