{* DO NOT EDIT THIS FILE! Use an override template instead. *}

<div class="element">
{def $selectedGatewaysTypes=$event.selected_gateways}
{"Type"|i18n("extension/xrowecommerce/productvariation")}:

{if $selectedGatewaysTypes|contains(-1)}
    {"Any"|i18n("extension/xrowecommerce")}
{else}

    {foreach $selectedGatewaysTypes as $type}
        {$type.Name|wash}{delimiter}, {/delimiter}
    {/foreach}

{/if}

</div>
{undef}