{* DESIGN: Header START *}<div class="box-header"><div class="box-tc"><div class="box-ml"><div class="box-mr"><div class="box-tl"><div class="box-tr">

<h4>{'Shop'|i18n( 'design/admin/parts/shop/menu' )}</h4>

{* DESIGN: Header END *}</div></div></div></div></div></div>

{* DESIGN: Content START *}<div class="box-bc"><div class="box-ml"><div class="box-mr"><div class="box-bl"><div class="box-br"><div class="box-content">

{section show=eq( $ui_context, 'edit' )}

<ul>
    <li><div><span class="disabled">{'Customers'|i18n( 'design/admin/parts/shop/menu' )}</span></div></li>
    <li><div><span class="disabled">{'Discounts'|i18n( 'design/admin/parts/shop/menu' )}</span></div></li>
    <li><div><span class="disabled">{'Orders'|i18n( 'design/admin/parts/shop/menu' )}</span></div></li>
    <li><div><span class="disabled">{'Archive'|i18n( 'design/admin/parts/shop/menu' )}</span></div></li>
    <li><div><span class="disabled">{'Order status'|i18n( 'design/admin/parts/shop/menu' )}</span></div></li>
    <li><div><span class="disabled">{'Product statistics'|i18n( 'design/admin/parts/shop/menu' )}</span></div></li>
    <li><div><span class="disabled">{'VAT types'|i18n( 'design/admin/parts/shop/menu' )}</span></div></li>
    <li><div><span class="disabled">{'VAT rules'|i18n( 'design/admin/parts/shop/menu' )}</span></div></li>
    <li><div><span class="disabled">{'Product categories'|i18n( 'design/admin/parts/shop/menu' )}</span></div></li>
    <li><div><span class="disabled">{'Currencies'|i18n( 'design/admin/parts/shop/menu' )}</span></div></li>
    <li><div><span class="disabled">{'Preferred currency'|i18n( 'design/admin/parts/shop/menu' )}</span></div></li>
    <li><div><span class="disabled">{'Products overview'|i18n( 'design/admin/parts/shop/menu' )}</span></div></li>
</ul>

{section-else}

<ul>
    <li><div><a href={'/shop/orderlist/'|ezurl}>{'Orders'|i18n( 'design/admin/parts/shop/menu' )}</a></div></li>

    <li><div><a href={'/shop/statistics/'|ezurl}>{'Product statistics'|i18n( 'design/admin/parts/shop/menu' )}</a></div></li>
    <li><div><a href={'/layout/set/print/orderedit/taxes/'|ezurl} target="_blank">{'Order statistics'|i18n( 'design/admin/parts/shop/menu' )}</a></div></li>

    <li><div><a href={'/infocollector/overview'|ezurl}>{'Customer Feedback'|i18n( 'design/admin/parts/shop/menu' )}</a></div></li>
    <li><div><a href={'/shop/customerlist/'|ezurl}>{'Customers'|i18n( 'design/admin/parts/shop/menu' )}</a></div></li>

    <li><div><a href={'https://www.google.com/analytics/home/report?rid=1494281&scid=169400'}>{'Google Analytics'|i18n( 'design/admin/parts/shop/menu' )}</a></div></li>

    <li><div><a href={'https://account.authorize.net/ui/themes/anet/merch.aspx?page=history&sub=unsettled'}>{'Payments Pending'|i18n( 'design/admin/parts/shop/menu' )}</a></div></li>
    <li><div><a href={'https://account.authorize.net/ui/themes/anet/merch.aspx?page=terminal'}>{'Payment Terminal'|i18n( 'design/admin/parts/shop/menu' )}</a></div></li>

    <li><div><a href={'/shop/archivelist/'|ezurl}>{'Archive'|i18n( 'design/admin/parts/shop/menu' )}</a></div></li>
    <li><div><a href={'/orderedit/product/'|ezurl}>{'Zero weight prods'|i18n( 'design/admin/parts/shop/menu' )}</a></div></li>
    
    <li><div><a href={'/recurringorders/forecast'|ezurl}>{'Recurring order forecast'|i18n( 'design/admin/parts/shop/menu' )}</a></div></li>
    <li><div><a href={'/recurringorders/history'|ezurl}>{'Recurring order history'|i18n( 'design/admin/parts/shop/menu' )}</a></div></li>

</ul>

{/section}

{* DESIGN: Content END *}</div></div></div></div></div></div>
