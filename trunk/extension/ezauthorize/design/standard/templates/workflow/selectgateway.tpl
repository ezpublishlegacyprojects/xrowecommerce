<div class="maincontentheader">
<h1>{"Select payment method"|i18n("design/standard/workflow")}</h1>
</div>

<form method="post" action={"shop/checkout"|ezurl}>

    {section name=Gateways loop=$event.selected_gateways|reverse()}
        <input type="radio" name="SelectedGateway" value="{$Gateways:item.value}"
                {run-once}
                    checked="checked"
                {/run-once}
        />{$Gateways:item.Name|wash}
    {/section}
    
    <div class="buttonblock">
        <input class="defaultbutton" type="submit" name="SelectButton"  value="{'Select'|i18n('design/standard/workflow')}" />
        <input class="button"        type="submit" name="CancelButton"  value="{'Cancel'|i18n('design/standard/workflow')}" />
    </div>

</form>
