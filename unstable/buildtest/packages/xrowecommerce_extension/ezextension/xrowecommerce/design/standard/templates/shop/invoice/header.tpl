<div id="company-logo" style="width:30%;float: right;">
    <img src={"invoice/logo.png"|ezimage}alt="" />
</div>
<div class="company-address" style="width:30%;float: right;">
<p id="company-name">{ezini( 'InvoiceSettings', 'CompanyName', 'xrowecommmerce.ini' )}</p>
<p id="company-address">
{foreach ezini( 'InvoiceSettings', 'CompanyAddress', 'xrowecommmerce.ini' ) as $line}
{$line|wash}<br />
{/foreach}
</p>
</div>