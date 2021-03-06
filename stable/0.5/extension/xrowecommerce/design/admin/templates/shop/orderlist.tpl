
<div class="context-block">

{* DESIGN: Header START *}<div class="box-header"><div class="box-tc"><div class="box-ml"><div class="box-mr"><div class="box-tl"><div class="box-tr">

<h1 class="context-title">Customer search</h1>

{* DESIGN: Mainline *}<div class="header-mainline"></div>

{* DESIGN: Header END *}</div></div></div></div></div></div>

{* DESIGN: Content START *}<div class="box-ml"><div class="box-mr"><div class="box-content">

<div class="context-toolbar">

<div class="block">

<div class="break"></div>
{if and(is_set($emails), $emails|eq(2)) }
    <p>Multiple occurencies!</p>
{elseif and(is_set($emails), $emails|eq(0)) }
    <p>No match</p>
{else}
    <p>Search for customer in the system via e-mail address</p>
{/if}  
</div>
</div>

<table class="list">
  <tr class="bglight">
  <th scope="row">Edit shippingcosts with this order number:</th>
    <td>
        <form name="orderedit" method="post" action={'orderedit/edit'|ezurl}>
            <input name="order_id" type="text" value="" size="50" />
            <input class="button" name="Edit" type="submit" value="Edit" />
        </form>  
    </td>
  </tr>
<form name="contentserver" method="post" action={'customersearch/search'|ezurl}>
    <tr>
        <th scope="row">E-mail address or Order No</th>
        <td>
            <input name="E-mail" type="text" {if is_set($email)}value="{$email}"{else}value="{$E-mail}"{/if} size="50" />
            <input class="button" name="Search" type="submit" value="Search" />
        </td>
  </tr>
</table>
{if and(is_set($emails),$emails|eq(2))}
<h3>Please select one of the following users:</h3>
<table class="list" cellspacing="0">
<tr>
	<th class="wide">Link</th>
	<th class="wide">ID</th>
	<th class="wide">E-mail</th>
</tr>
{foreach $userid as $email_item}
    <tr><td><a href="/shop/customerorderview/{$email_item.user_id}/{$email}">Show user</a></td><td>{if $email_item.user_id|eq(10)}(anonymous){else}{$email_item.user_id}{/if}</td><td>{$email}</td></tr>
{/foreach}
</table>
{/if}

{* DESIGN: Content END *}</div></div></div>

<div class="controlbar">
{* DESIGN: Control bar START *}<div class="box-bc"><div class="box-ml"><div class="box-mr"><div class="box-tc"><div class="box-bl"><div class="box-br">

{* DESIGN: Control bar END *}</div></div></div></div></div></div>
</div>
</div>
</form>




{if is_set($email)|not}
{let can_apply=false()}
<form name="orderlist" method="post" action={concat( '/shop/orderlist' )|ezurl}>

<div class="context-block">

{* DESIGN: Header START *}<div class="box-header"><div class="box-tc"><div class="box-ml"><div class="box-mr"><div class="box-tl"><div class="box-tr">

<h1 class="context-title">{'Orders [%count]'|i18n( 'design/admin/shop/orderlist',, hash( '%count', $order_list|count ) )}</h1>

{* DESIGN: Mainline *}<div class="header-mainline"></div>

{* DESIGN: Header END *}</div></div></div></div></div></div>

{* DESIGN: Content START *}<div class="box-ml"><div class="box-mr"><div class="box-content">

{section show=$order_list}
<div class="context-toolbar">
<div class="block">
<div class="left">
<p>
{section show=eq( ezpreference( 'admin_orderlist_sortfield' ), 'user_name' )}
    <a href={'/user/preferences/set/admin_orderlist_sortfield/time/shop/orderlist/'|ezurl}>{'Time'|i18n( 'design/admin/shop/orderlist' )}</a>
    <span class="current">{'Customer'|i18n( 'design/admin/shop/orderlist' )}</span>
{section-else}
    <span class="current">{'Time'|i18n( 'design/admin/shop/orderlist' )}</span>
    <a href={'/user/preferences/set/admin_orderlist_sortfield/user_name/shop/orderlist/'|ezurl}>{'Customer'|i18n( 'design/admin/shop/orderlist' )}</a>
{/section}
</p>
</div>
<div class="right">
<p>
{section show=eq( ezpreference( 'admin_orderlist_sortorder' ), 'desc' )}
    <a href={'/user/preferences/set/admin_orderlist_sortorder/asc/shop/orderlist/'|ezurl}>{'Ascending'|i18n( 'design/admin/shop/orderlist' )}</a>
    <span class="current">{'Descending'|i18n( 'design/admin/shop/orderlist' )}</span>
{section-else}
    <span class="current">{'Ascending'|i18n( 'design/admin/shop/orderlist' )}</span>
    <a href={'/user/preferences/set/admin_orderlist_sortorder/desc/shop/orderlist/'|ezurl}>{'Descending'|i18n( 'design/admin/shop/orderlist' )}</a>
{/section}
</p>
</div>

<div class="break"></div>

</div>
</div>

{def $currency = false()
     $locale = false()
     $symbol = false()}

<table class="list" cellspacing="0">
<tr>
    <th class="tight"><img src={'toggle-button-16x16.gif'|ezimage} alt="{'Invert selection.'|i18n( 'design/admin/shop/orderlist' )}" title="{'Invert selection.'|i18n( 'design/admin/shop/orderlist' )}" onclick="ezjs_toggleCheckboxes( document.orderlist, 'OrderIDArray[]' ); return false;" /></th>
	<th class="tight">{'ID'|i18n( 'design/admin/shop/orderlist' )}</th>
	<th class="wide">{'Customer'|i18n( 'design/admin/shop/orderlist' )}</th>
	<th class="tight">{'Total (ex. VAT)'|i18n( 'design/admin/shop/orderlist' )}</th>
	<th class="tight">{'Total (inc. VAT)'|i18n( 'design/admin/shop/orderlist' )}</th>
	<th class="wide">{'Time'|i18n( 'design/admin/shop/orderlist' )}</th>
	<th class="wide">{'Status'|i18n( 'design/admin/shop/orderlist' )}</th>
	<th class="wide">{'Actions'|i18n( 'design/admin/shop/orderlist' )}</th>
</tr>
{section var=Orders loop=$order_list sequence=array( bglight, bgdark )}

{set $currency = fetch( 'shop', 'currency', hash( 'code', $Orders.item.productcollection.currency_code ) )}
{if $currency}
    {set locale = $currency.locale
         symbol = $currency.symbol}
{else}
    {set locale = false()
         symbol = false()}
{/if}

<tr class="{$Orders.sequence}">
    <td><input type="checkbox" name="OrderIDArray[]" value="{$Orders.item.id}" title="{'Select order for removal.'|i18n( 'design/admin/shop/orderlist' )}" /></td>
	<td><a href={concat( '/shop/orderview/', $Orders.item.id, '/' )|ezurl}>{$Orders.item.order_nr}</a></td>
	<td>
	{if is_null($Orders.item.account_name)}
	    <s><i>{'( removed )'|i18n( 'design/admin/shop/orderlist' )}</i></s>
	{else}
	    <a href={concat( '/shop/customerorderview/', $Orders.item.user_id, '/', $Orders.item.account_email )|ezurl}>{$Orders.item.account_name}</a>
	{/if}
	</td>
	

    {* NOTE: These two attribute calls are slow, they cause the system to generate lots of SQLs.
             The reason is that their values are not cached in the order tables *}
	<td class="number" align="right">{$Orders.item.total_ex_vat|l10n( 'currency', $locale, $symbol )}</td>
	<td class="number" align="right">{$Orders.item.total_inc_vat|l10n( 'currency', $locale, $symbol )}</td>

	<td>{$Orders.item.created|l10n( shortdatetime )}</td>
	<td>
    {let order_status_list=$Orders.status_modification_list}

    {section show=$order_status_list|count|gt( 0 )}
        {set can_apply=true()}
        <select name="StatusList[{$Orders.item.id}]">
        {section var=Status loop=$order_status_list}
            <option value="{$Status.item.status_id}"
                {section show=eq( $Status.item.status_id, $Orders.item.status_id )}selected="selected"{/section}>
                {$Status.item.name|wash}</option>
        {/section}
        </select>
    {section-else}
        {* Lets just show the name if we don't have access to change the status *}
        {$Orders.status_name|wash}
    {/section}

    {/let}
	</td>
{* BC:Original Text Link
	<td><a href={concat( '/layout/set/print/shop/orderview/', $Orders.item.id, '/?print=1', )|ezurl} target="_blank">print #{$Orders.item.order_nr}</a></td>
	<td><a href={concat( '/layout/set/print/shop/orderview/', $Orders.item.id, '/?print=1', )|ezurl} target="_blank">Print #{$Orders.item.order_nr}</a></td>
*}
	<td>
	<a href={concat( '/layout/set/print/shop/orderview/', $Orders.item.id, '/?print=1', )|ezurl} target="_blank"><img src={'print_printer.32x32.png'|ezimage} height="28" width="28" alt="" title=""></a>
	<a href={concat( '/orderedit/edit/', $Orders.item.order_nr)|ezurl}><img src={'images/txt2.png'|ezdesign}  alt="Edit shippingcosts" title="Edit shippingcosts"></a>
	</td>
</tr>
{/section}
</table>
{undef $currency $locale $symbol}
{section-else}
<div class="block">
<p>{'The order list is empty.'|i18n( 'design/admin/shop/orderlist' )}</p>
</div>
{/section}

<div class="context-toolbar">
{include name=navigator
         uri='design:navigator/google.tpl'
         page_uri='/shop/orderlist'
         item_count=$order_list_count
         view_parameters=$view_parameters
         item_limit=$limit}
</div>

{* DESIGN: Content END *}</div></div></div>

<div class="controlbar">
{* DESIGN: Control bar START *}<div class="box-bc"><div class="box-ml"><div class="box-mr"><div class="box-tc"><div class="box-bl"><div class="box-br">

<div class="block">
<div class="button-left">
{section show=$order_list}
    <input class="button" type="submit" name="ArchiveButton" value="{'Archive selected'|i18n( 'design/admin/shop/orderlist' )}" title="{'Archive selected orders.'|i18n( 'design/admin/shop/orderlist' )}" />
{section-else}
    <input class="button-disabled" type="submit" name="ArchiveButton" value="{'Archive selected'|i18n( 'design/admin/shop/orderlist' )}" disabled="disabled" />
{/section}
</div>
<div class="button-right">
    {section show=and( $order_list|count|gt( 0 ), $can_apply )}
    <input class="button" type="submit" name="SaveOrderStatusButton" value="{'Apply changes'|i18n( 'design/admin/shop/orderlist' )}" title="{'Click this button to store changes if you have modified any of the fields above.'|i18n( 'design/admin/shop/orderlist' )}" />
    {section-else}
    <input class="button-disabled" type="submit" name="SaveOrderStatusButton" value="{'Apply changes'|i18n( 'design/admin/shop/orderlist' )}" disabled="disabled" />
    {/section}
</div>
<div class="break"></div>

</div>

{* DESIGN: Control bar END *}</div></div></div></div></div></div>
</div>

</form>
{/let}
{/if}