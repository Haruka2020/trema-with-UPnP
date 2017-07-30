<?php
session_start();
if(isset($_SESSION['id'])&&isset($_GET['admission'])&&isset($_SESSION['password'])){
    $_SESSION['admission'] = $_GET['admission'];
    header('Location: admission.php');
}elseif(isset($_SESSION['body'])&&isset($_SESSION['id'])){
    $flag = 'on';
}else {
  header('Location: checks.php');
}

if($flag=='on'):
  $body = $_SESSION['body'];
  $body = str_replace(array("\r\n", "\r", "\n"), "", $body);
  preg_match('/(.*利用しようとしています。)(.*提供します)/',$body,$devices);
  preg_match_all('/・([^・]*)/',$body,$services);
?>
<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8">

  <title>Security Policy Admission</title>
  <meta name="description" content="Security Policy Admission Page">
  <meta name="author" content="OF_Controller">

  <link rel="stylesheet" href="./style.css">

  <!--[if lt IE 9]>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/html5shiv/3.7.3/html5shiv.js"></script>
  <![endif]-->
</head>

<body>
  <article>
    <p><?php echo $devices[1]; ?></p>
    <section>
    <p><?php echo $devices[2]; ?></p>
    <ul>
    <?php
      for($i = 0 ; $i < count($services[1]); $i++){
        echo "<li>".$services[1][$i]."</li>";
      }
    ?>
    </ul>
    <form action="" method="get">
      <button type='submit' name='admission' value='yes' class="checkbox">許可</button>
      <button type='submit' name='admission' value='no'class="checkbox">キャンセル</button>
    </form>
  </section>
  </article>
</body>
</html>
<?php endif; ?>
