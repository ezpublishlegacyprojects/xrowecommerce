<?php
$Module = array( "name" => "xrow e-commerce" );

$ViewList = array();

$ViewList["userregister"] = array(
    "functions" => array( 'buy' ),
    "script" => "userregister.php",
    'ui_context' => 'edit',
    "default_navigation_part" => 'ezshopnavigationpart',
    'single_post_actions' => array( 'StoreButton' => 'Store',
                                    'CancelButton' => 'Cancel'
                                    )
    );
$ViewList["multiadd"] = array(
    "functions" => array( 'buy' ),
    "script" => "multiadd.php",
    "default_navigation_part" => 'ezshopnavigationpart',
    "params" => array(  ) );

$ViewList["statistics"] = array(
    "functions" => array( 'administrate' ),
    "script" => "orderstatistics.php",
    "default_navigation_part" => 'ezshopnavigationpart',
    "params" => array( 'StartYear', 'StartMonth', 'StopMonth', 'StartDay', 'StopDay' ) );

$FunctionList['buy'] = array( );
$FunctionList['administrate'] = array( );
$FunctionList['bypass_captcha'] = array( );

?>
