<?php

  function include_template($name, $data) {
      $name = 'templates/' . $name;
      $result = '';
  
      if (!is_readable($name)) {
          return $result;
      }
  
      ob_start();
      extract($data);
      require $name;
  
      $result = ob_get_clean();
  
      return $result;
  }

  function formatPrice ($number) {
      $number = ceil($number);
      if ( $number >= 1000) {
          $number = number_format($number, 0, '', ' ');
      }
      $number = $number." ₽";
      return $number;
  }

  function showTimeLeft ($timeLimit) {  
      $currentTime = date_create('now');
      $deadlineTime = date_create($timeLimit);
      return date_interval_format(date_diff($currentTime, $deadlineTime), '%H:%I');
  }

?>