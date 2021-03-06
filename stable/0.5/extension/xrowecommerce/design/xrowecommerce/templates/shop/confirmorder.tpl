<div class="shop-basket">
    <form method="post" action={"/shop/confirmorder/"|ezurl}>
        <h2>{"Confirm order"|i18n("design/base/shop")}</h2>
        <div class="shopping_cart_path">
            <div>{'1. Cart'|i18n('design/base/shop')}</div>
            <div>{'2. Billing, Shipping and Coupons'|i18n('design/base/shop')}</div>
            <div class="shopping_cart_path_select">{'3. Confirmation'|i18n('design/base/shop')}</div>
            <div>{'4. Payment info'|i18n('design/base/shop')}</div>
            <div>{'5. Order completed'|i18n('design/base/shop')}</div>
            <div>{'6. Review reciept'|i18n('design/base/shop')}</div>
        </div>
        <div class="break"></div>
        <div class="buttonblock">
            <table>
                <tr>
                    <td>
                        <input class="left-arrow2" type="submit" name="CancelButton" value="{'Cancel'|i18n('design/base/shop')}" /> &nbsp;
                    </td>
                    <td>
                        <input class="right-arrow2" type="submit" name="ConfirmOrderButton" value="{'Confirm'|i18n('design/base/shop')}" /> &nbsp;
                    </td>
                </tr>
            </table>
        </div>
        {shop_account_view_gui view=html order=$order}
        {def $currency = fetch( 'shop', 'currency', hash( 'code', $order.productcollection.currency_code ) )
            $locale = false()
            $symbol = false()}
        {if $currency}
            {set locale = $currency.locale
                 symbol = $currency.symbol}
        {/if}
        {if count($hazardous)|gt(0)}
            <b style="color: red;">{'Hazardous item(s) found in your cart'|i18n('design/base/shop')}</b>
                {'Dear Customer,'|i18n('design/base/shop')}<br />
                {"We've removed the following hazardous items from your shopping cart since we are NOT allowed to ship these items to your destination. For further questions please contact"|i18n('design/base/shop')} {ezini( 'InvoiceSettings', 'CompanyName', 'order.ini'  )}.<br />
                <ul style="background: white;">
                    {foreach $hazardous as $item}
                    <li>{$item.item_count} x <a href={concat("/content/view/full/", $item.contentobject.main_node_id)|ezurl()}>{$item.name}</a></li>
                    {/foreach}
                </ul><br />
        {/if}
        
        {if count( $order.product_items )|gt(0)}
        <h3>{"Product items"|i18n("design/base/shop")}</h3>
        <div class="content-basket">
            <table cellspacing="1">
                <tr class="lightbg">
                    <th>
                        {"Quantity"|i18n("design/base/shop")}
                    </th>
                    <th>
                        {"Item"|i18n("design/base/shop")}
                    </th>
                    <th>
                        {"Tax"|i18n("design/base/shop")}
                    </th>
                    <th>
                        {"Unit Price"|i18n("design/base/shop")}
                    </th>
                    <th align="right">
                        {"Total Price"|i18n("design/base/shop")}
                    </th>
                </tr>
                {section var=product_item loop=$order.product_items sequence=array(bglight,bgdark)}
                <tr>
                   <td class="{$product_item.sequence} product-name basketspace">
                        <b>{$product_item.item_count}</b>
                    </td>
                   <td class="{$product_item.sequence} product-name basketspace">
                        {def $prod=fetch( 'content', 'node', hash( 'node_id', $product_item.node_id ) )}
                        {if $prod.data_map.image_link.content.current.contentobject_attributes.2.content.is_valid}
                            {attribute_view_gui alignment=center image_class=productthumbnail attribute=$prod.data_map.image_link.content.current.contentobject_attributes.2}
                        {elseif $prod.data_map.image.content.is_valid}
                            {attribute_view_gui alignment=center image_class=productthumbnail attribute=$prod.data_map.image_link.content.object}
                          {/if}  

                 
                 {if $prod.data_map.variation.content.option_list|count|gt(0)}
                 <table>
                 {section var=option_item loop=$product_item.item_object.option_list}
                    <tr>
                        <td rowspan="4" width="120">
                        {if $product_item.item_object.contentobject.data_map.image.has_content}
                        {attribute_view_gui image_class=small attribute=$product_item.item_object.contentobject.data_map.image}
                        {else}
                        <div class="nopic">&nbsp;</div>
                        {/if}
                        </td>
                        <td>
                        <p><a class="basketlink" href={concat("/content/view/full/",$prod.node_id)|ezurl}>{$prod.name|wash()}</a></p>
                        </td>
                    </tr>
                    <tr>
                        <td>
                        {$prod.data_map.product_id.content|wash()}-{$option_item.value}
                        </td>
                    </tr>
                    <tr>
                        <td>
                        {def $vary=$product_item.item_object.contentobject.data_map.variation.content.option_list[$product_item.item_object.option_list.0.option_item_id]}
                        {$vary.comment}
                        </td>
                    </tr>
                    <tr>
                        <td>
                        {'Weight'|i18n('design/base/shop')}: {$vary.weight|wash()} {'lbs'|i18n('design/base/shop')}
                        </td>
                    </tr>
                    {/section}
                 {else}
                 <table>
                    <tr>
                        <td rowspan="4" width="120">
                        {if $product_item.item_object.contentobject.data_map.image.has_content}
                        {attribute_view_gui image_class=small attribute=$product_item.item_object.contentobject.data_map.image}
                        {else}
                        <div class="nopic">&nbsp;</div>
                        {/if}
                        </td>
                        <td>
                        <p><a class="basketlink" href={concat("/content/view/full/",$prod.node_id)|ezurl}>{$prod.name|wash()}</a></p>
                        </td>
                    </tr>
                    <tr>
                        <td>
                         {$prod.data_map.product_id.content|wash()}-{$prod.data_map.unicode.data_text|wash()}
                        </td>
                    </tr>
                    <tr>
                        <td>
                        {def $vary=$product_item.item_object.contentobject.data_map.variation.content.option_list[$product_item.item_object.option_list.0.option_item_id]}
                        {$vary.comment}                        
                        </td>
                    </tr>
                    <tr>
                        <td>
                        {'Weight'|i18n('design/base/shop')}: {attribute_view_gui attribute=$prod.data_map.weight} {'lbs'|i18n('design/base/shop')}
                        </td>
                    </tr>
                    {/if}
                </table>
                    </td>

            <td class="{$product_item.sequence} product-name basketspace">
               {$product_item.vat_value} %
            </td>
            <td class="{$product_item.sequence} product-name basketspace">
               {$product_item.price_ex_vat|l10n( 'currency', $locale, $symbol )}
            </td>
            <td class="{$product_item.sequence} product-name basketspace">
                {$product_item.total_price_ex_vat|l10n( 'currency', $locale, $symbol )}
            </td>
         </tr>
         {delimiter}
            <tr><td colspan="5" /></tr>
         {/delimiter}
         {/section}
         {if gt(count($order.product_items),0)}
            <tr><td colspan="5" /></tr>
         {/if}
         <tr>
             <td colspan="5" class="align_right line line3">
             {"Subtotal Ex. TAX"|i18n("design/base/shop")}:
             <b class="price">{$order.product_total_ex_vat|l10n( 'currency', $locale, $symbol )}</b>
             </td>
         </tr>
         <tr><td colspan="5" /></tr>
         </table>
         </div>
    
    <h3>{"Order summary"|i18n("design/base/shop")}:</h3>
    <table cellspacing="0" cellpadding="0" border="0">
    <tr>
        <td class="bgdark">
        {"Subtotal of items ex. Tax"|i18n("design/base/shop")}:
        </td>
        <td class="bgdark align_right">
        {$order.product_total_ex_vat|l10n( 'currency', $locale, $symbol )}
        </td>
    </tr>
    
    {section name=OrderItem loop=$order.order_items show=$order.order_items sequence=array(bglight,bgdark)}
    <tr>
        <td class="{$OrderItem:sequence}">
        {$OrderItem:item.description}:
        </td>
        <td class="{$OrderItem:sequence} align_right">
        {$OrderItem:item.price_ex_vat|l10n( 'currency', $locale, $symbol )}
        </td>
    </tr>
    {/section}
    {def $taxpercent = mul( div(sub($order.total_inc_vat, $order.total_ex_vat), $order.total_ex_vat), 100)
         $percentage = mul( div(sub($order.total_inc_vat, $order.total_ex_vat), $order.total_ex_vat), 100)|l10n('number') }
    {if $taxpercent|eq(0)|not}
    <tr>
        <td colspan ="2"></td>
    </tr>
    <tr>
        <td class="{$OrderItem:sequence} line">
        {"Tax"|i18n("design/base/shop")}:
        </td>
        <td class="{$OrderItem:sequence} line align_right">
        {sub($order.total_inc_vat, $order.total_ex_vat)|l10n( 'currency', $locale, $symbol )}
        </td>
    </tr>
    {/if}
    <tr>
        <td colspan ="2"></td>
    </tr>
    
    <tr>
        <td class="bgdark line price">
        <b>{"Order total"|i18n("design/base/shop")}:</b>
        </td>
        <td class="bgdark line align_right price">
        <b>{$order.total_inc_vat|l10n( 'currency', $locale, $symbol )}</b>
        </td>
    </tr>
    </table>
    {else}{* If the shopping cart is empty after removing hazardous items... *}
    <h3>Sorry, there are no items left in your cart.</h3>
    {/if}
    </form>
</div>