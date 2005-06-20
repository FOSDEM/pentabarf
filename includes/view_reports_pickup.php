<?php

  require_once("../db/person.php");
  require_once("../db/view_person_travel.php");


  $template->addVar("main","CONTENT_TITLE","Reports: Pickup");
  $template->addVar("main","VIEW_TITLE", "Reports");


  $person = new View_Person_Travel;
  $person->select(array('conference_id' => $preferences['conference']));

  $result = array();

  foreach($person as $value) {
    array_push($result, array("IMAGE_URL"          => get_person_image_url($person),
                              "URL"                => get_person_url($person, "general"),
                              "NAME"               => $person->get('name'),
                              "FROM"               => $person->get('from'),
                              "TO"                 => $person->get('to'),
                              "NUMBER"             => $person->get('number'),
                              "DATE"               => is_object( $person->get('date')) ? $person->get('date')->format('%Y-%m-%d') : '',
                              "TIME"               => is_object( $person->get('time')) ? $person->get('time')->format('%H:%M:%S') : ''));
  }
  $template->addRows("report-list", $result);

?>
