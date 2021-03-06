{* DO NOT EDIT THIS FILE! Use an override template instead. *}
{default attribute_base=ContentObjectAttribute}

<div class="block">
<label>{'Name'|i18n( 'design/standard/content/datatype' )}:</label>
<input class="box" type="text" name="{$attribute_base}_data_option_name_{$attribute.id}" value="{$attribute.content.name}" />
</div>

<div class="block">
<label>{'Options'|i18n( 'design/standard/content/datatype' )}:</label>

{section show=$attribute.content.option_list}
<table class="list" cellspacing="0">
<tr>
    <th class="tight">&nbsp;</th>
    <th>{'No'|i18n( 'design/standard/content/datatype' )}</th>
    <th>{'Name'|i18n( 'design/standard/content/datatype' )}</th>
    <th>{'Description'|i18n( 'design/standard/content/datatype' )}</th>
    {section show=$attribute.is_information_collector|not}
    	<th>{'Additional price'|i18n( 'design/standard/content/datatype' )}</th>
    {/section}
    <th>{'Weight'|i18n( 'design/standard/content/datatype' )}</th>
    <th>{'Image'|i18n( 'design/standard/content/datatype' )}</th>
</tr>

{section var=Options loop=$attribute.content.option_list sequence=array( bglight, bgdark )}
<tr class="{$Options.sequence}">

{* Remove. *}
<td>
<input type="checkbox" name="{$attribute_base}_data_option_remove_{$attribute.id}[]" value="{$Options.item.id}" title="{'Select option for removal.'|i18n( 'design/standard/content/datatype' )}" />
<input type="hidden" name="{$attribute_base}_data_option_id_{$attribute.id}[]" value="{$Options.item.id}" />
</td>

{* Option. *}
<td><input class="box" type="text" name="{$attribute_base}_data_option_value_{$attribute.id}[]" value="{$Options.item.value}" /></td>

<td><input class="box" type="text" name="{$attribute_base}_data_option_comment_{$attribute.id}[]" value="{$Options.item.comment}" /></td>

{* Description. *}
<td><textarea class="box" name="{$attribute_base}_data_option_description_{$attribute.id}[]">{$Options.item.description}</textarea></td>


{section show=$attribute.is_information_collector|not}
{* Price. *}
<td><input class="box" type="text" name="{$attribute_base}_data_option_additional_price_{$attribute.id}[]" value="{$Options.item.additional_price}" /></td>
{/section}
<td><input id="variation_weight_{$attribute.id}" class="box" type="text" name="{$attribute_base}_data_option_weight_{$attribute.id}[]" value="{$Options.item.weight}" /></td>
{* Object relation *}
<td>
<input id="variation_image_id_{$attribute.id}_{$Options.item.id}" type="hidden" name="{$attribute_base}_data_option_image_{$attribute.id}[]" value="{$Options.item.image.id}" />
<div id="variation_image_div_{$attribute.id}_{$Options.item.id}">
{if and($Options.item.image.content_class.identifier|eq('image'),$Options.item.image|is_object)}
<a id="variation_image_link_{$attribute.id}_{$Options.item.id}" href={$Options.item.image.main_node.url_alias|ezurl()} target="_blank">{attribute_view_gui image_class=small attribute=$Options.item.image.current.data_map.image}</a>
</div>
{else}
</div>
<div id="variation_noimage_div_{$attribute.id}_{$Options.item.id}">{'No image'|i18n( 'design/standard/content/datatype' )}</div>
{/if}
{if $Options.item.image|is_object}<input class="button" type="submit" name="CustomActionButton[{$attribute.id}_remove_object-{$Options.item.id}]" value="{'Remove'|i18n( 'design/standard/content/datatype' )}" />{/if}
<input class="button" type="submit" name="CustomActionButton[{$attribute.id}_browse_object-{$Options.item.id}]" value="{'Add'|i18n( 'design/standard/content/datatype' )}" />
<input class="button" type="button" name="Uploadbutton" value="Upload" onClick="javascript:variationupload(  '{$attribute.contentobject_id}', '{$attribute.version}', 'object', '{$attribute.id}', '{$Options.item.id}' );" />
</td></tr>
{/section}

</table>
{section-else}
<p>{'There are no options.'|i18n( 'design/standard/content/datatype' )}</p>
{/section}


{section show=$attribute.content.option_list}
<input class="button" type="submit" name="CustomActionButton[{$attribute.id}_remove_selected]" value="{'Remove selected'|i18n('design/standard/content/datatype')}" title="{'Remove selected options.'|i18n( 'design/standard/content/datatype' )}" />
{section-else}
<input class="button-disabled" type="submit" name="CustomActionButton[{$attribute.id}_remove_selected]" value="{'Remove selected'|i18n('design/standard/content/datatype')}" title="{'Remove selected options.'|i18n( 'design/standard/content/datatype' )}" disabled="disabled" />
{/section}

<input class="button" type="submit" name="CustomActionButton[{$attribute.id}_new_option]" value="{'Add option'|i18n('design/standard/content/datatype')}" title="{'Add a new option.'|i18n( 'design/standard/content/datatype' )}" />

</div>
{/default}
{def $url='/'|ezurl('no','full')}
{run-once}
{literal}
<script type="text/javascript">
function variationupload (id, version, type, varname, varid) {
  NewWindow = window.open("http://" + window.location.hostname + "/mutual_admin/variationupload/upload/"+ id +"/"+ version +"/"+ type +"/" + varname + "/" + varid, "Uploadwindow", "width=400,height=400,left=100,top=200");
  NewWindow.focus();
}
</script>
{/literal}
{/run-once}
