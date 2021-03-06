<?php

$OrderID = $Params['OrderID'];
$module = $Params['Module'];
require_once( "kernel/common/template.php" );

$ini = eZINI::instance();
$http = eZHTTPTool::instance();
$user = eZUser::currentUser();
$access = false;
$order = eZOrder::fetch( $OrderID );
if ( !$order )
{
    return $module->handleError( eZError::KERNEL_NOT_AVAILABLE, 'kernel' );
}

$tpl = templateInit();

$tpl->setVariable( "order", $order );

$tpl->setVariable( "package_list", xrowECommerce::getPackageListArray( $order ) );

$Result = array();
$Result['content'] = $tpl->fetch( "design:shop/shippingplan.tpl" );
$Result['pagelayout'] = 'print_pagelayout.tpl';
$Result['path'] = array( array( 'url' => 'shop/orderlist',
                                'text' => ezi18n( 'kernel/shop', 'Shipping plan' ) ),
                         array( 'url' => false,
                                'text' => ezi18n( 'kernel/shop', 'Order #%order_id', null, array( '%order_id' => $order->attribute( 'order_nr' ) ) ) ) );

?>
