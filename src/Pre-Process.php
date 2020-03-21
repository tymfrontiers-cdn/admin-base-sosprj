<?php
// require_once "../inc.php";
if( !empty($params) ):
  $path = $_SERVER['REQUEST_URI'];
  // record Event
  $inp_data  = "";
  foreach ($params as $key => $value) {
    $inp_data .= "[{$key}]: {$value} \r\n";
  }
  $authr = !empty($params['author']) ? $params['author']: $session->name;
  $evt = new \TymFrontiers\Event(
    "[REQUEST]: $path",
    "REQUEST DATA:\r\n {$inp_data}",
    "APP: QuicFX/" . API_APP_NAME,
    $authr
    );
    $evt->record();
  // end of event log
endif;
