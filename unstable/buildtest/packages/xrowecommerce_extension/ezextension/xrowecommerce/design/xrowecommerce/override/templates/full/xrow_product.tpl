<div class="border-box">
<div class="border-tl"><div class="border-tr"><div class="border-tc"></div></div></div>
<div class="border-ml"><div class="border-mr"><div class="border-mc float-break">
<div class="content-view-full">
        <div class="class-xrow-commerce">
            <div class="xrow-product">
                    <div class="attribute-header">
                        <h1>{$node.name|wash()}</h1>
                    </div>
                    <div class="image-description-wrap">
                    {if $node.data_map.image.has_content}
                        <div class="attribute-image">
                            <a href="javascript:;" onclick="return enlargeImage('/{$node.data_map.image.content.original.full_path}',{$node.data_map.image.content.original.width},{$node.data_map.image.content.original.height},'{$node.data_map.image.content.original.text|wash(javascript)}');" title="{$node.data_map.image.content.original.text|wash} | {"A click on the image enlarges the image in a popup"|i18n( 'extension/xrowecommerce')}">
                                {attribute_view_gui attribute=$node.data_map.image image_class=medium show_alt=false()}
                            </a>
                            {if $node.data_map.caption.has_content}
                                <div class="caption">
                                    {attribute_view_gui attribute=$node.data_map.caption}
                                </div>
                            {/if}
                        </div>
                    {else}
                        <div class="nopic attribute-image"><img src={'shop/nopic_130.gif'|ezimage()} alt="{'No image available'|i18n('extension/xrowecommerce')}" /></div>
                    {/if}
                    <div class="description-wrap">
                        <div class="attribute-short">
                           {attribute_view_gui attribute=$node.object.data_map.short_description}
                        </div>
                        <div class="attribute-long">
                           {attribute_view_gui attribute=$node.object.data_map.description}
                        </div>
                    </div>
                    <div class="xrow-feature-list">
                        <div class="xrow-product-wishlist">
                            <form method="post" action={"content/action"|ezurl}>
                                <input type="hidden" name="ContentNodeID" value="{$node.node_id}" />
                                <input type="hidden" name="ContentObjectID" value="{$node.object.id}" />
                                <input type="hidden" name="ViewMode" value="full" />
                                <input class="button" type="submit" name="ActionAddToWishList" value="{"Add to wish list"|i18n("design/ezwebin/full/product")}" />
                            </form>
                        </div>
                        <p>
                            {def $tipafriend_access=fetch( 'user', 'has_access_to', hash( 'module', 'content',
                                                           'function', 'tipafriend' ) )}
                            {if and( ezmodule( 'content/tipafriend' ), $tipafriend_access )}
                            <a href={concat( "/content/tipafriend/", $node.node_id )|ezurl} title="{'Tip a friend'|i18n( 'design/ezwebin/full/article' )}">{'Tip a friend'|i18n( 'design/ezwebin/full/article' )}</a> | {/if}<a href="#related-products" >{'Related products'|i18n( 'design/ezwebin/full/article' )}</a> | <a href="#product-reviews">{'Product reviews'|i18n( 'design/ezwebin/full/article' )}</a>
                        </p>
                        <div class="star-rating">
                        {attribute_view_gui attribute=$node.data_map.rating}
                        </div>
                    </div>
                </div>
                <div class="productwrapper float-break">
                    <form name="buy" id="buy" method="post" action={"xrowecommerce/multiadd"|ezurl}>
                        <input type="hidden" name="ContentNodeID" value="{$node.node_id}" />
                        <input type="hidden" name="ContentObjectID" value="{$node.object.id}" />
                        <input type="hidden" name="ViewMode" value="full" />
        			<div>
                        <table class="list" summary="This table contains information about the product, like image, product number, description and the form to orderthe product.">
                            <tr>
                            	{if $node.data_map.options.content.option_list|count|gt(0)}
                                    <th>{'Image'|i18n('extension/xrowecommerce')}</th>
                                {/if}
                                <th>{'Number'|i18n('extension/xrowecommerce')}</th>
                                {if $node.data_map.options.content.option_list|count|gt(0)}
                                    <th>{'Item'|i18n('extension/xrowecommerce')}</th>
                                {/if}
                                <th>{'Description'|i18n('extension/xrowecommerce')}</th>
                                <th class="quantity">{'Quantity'|i18n('extension/xrowecommerce')}</th>
                                <th class="price">{'Price'|i18n('extension/xrowecommerce')}</th>
                            </tr>
                            {if $node.data_map.options.content.option_list|count|gt(0)}
        	                    {section var=Options loop=$node.data_map.options.content.option_list}
        	                    <tr>
        							<td>
        								{if $Options.item.image.current.data_map.image.content.is_valid}
        									{attribute_view_gui image_class=galleryline attribute=$Options.item.image.current.data_map.image}
        								{else}
        									<div class="s_nopic"><img src={'shop/nopic_tiny.jpg'|ezimage()} alt="{'No image available'|i18n('extension/xrowecommerce')}" /></div>
        								{/if}
        							</td>
        							<td>
        								{$Options.item.value}                  
        							</td>
        							<td>
        								{$Options.item.comment|wash()}
        							</td>
        							<td>
        								{$Options.item.description|wash|nl2br}
        							</td>
        	                        <td align="right" class="quantity">
        	                           <input type="hidden" name="AddToBasketList[{$Options.index}][object_id]" value="{$node.object.id}" />
        	                           <input type="hidden" name="AddToBasketList[{$Options.index}][variations][{$node.data_map.options.id}]" value="{$Options.item.id}" />
        	                           <input type="text" name="AddToBasketList[{$Options.index}][quantity]" value="{if eq($Options.index,0)}1{else}0{/if}" />
        	                        </td>
        	                        <td class="price" align="right">
        		                        {if $Options.multi_price}
                                            {if $Options.multi_price.price|ne('0.00')}
                                                {$Options.multi_price.price|l10n(currency)}
            			                    {else}
                                                {foreach $Options.multi_price.currency_list as $price}
                                                    {$price.value|l10n( currency )}
                                                {/foreach}
        			                        {/if}
        		                        {else}
        		                            {section show=ne( $Options.item.additional_price, '' )}
        		                                {$Options.item.additional_price|l10n( currency )}
        		                            {/section}
        		                        {/if}
        	                        </td>
        	                    </tr>
        	                    {/section}
                            {else}
        	                    <tr>
        	                        <td>
        	                           {$node.object.data_map.product_id.data_text}
        	                        </td>
                                    <td>
                                       {attribute_view_gui attribute=$node.object.data_map.short_description}
                                    </td>
        	                        <td align="right" class="quantity">
        	                            <input type="hidden" name="AddToBasketList[{$Options.index}][object_id]" value="{$node.object.id}" />
        	                            <input type="hidden" name="AddToBasketList[{$Options.index}][variations][{$node.data_map.options.id}]" value="{$Options.item.id}" />
        	                            <input type="text" name="AddToBasketList[0][quantity]" value="1" />
        	                        </td>
        	                        <td align="right">
        	                           {$node.data_map.price.content.price|l10n(currency)}
        	                        </td>
        	                    </tr>
                            {/if}
                        </table>
                        <div class="block">
                            <div class="right">
                                <input type="submit" class="button right-arrow" name="ActionAddToBasket" value="{"Add to Shopping Cart"|i18n("extension/xrowecommerce")}" />
                            </div>
                        </div>
                    </div>
        			{if eq(ezini( 'AutomaticDeliverySettings', 'AutomaticDelivery', 'automaticdelivery.ini' ), 'enabled' )}
        	            <div id="overlay-text">
        		            {def $user=fetch( 'user', 'current_user' )}
        		            {if and($node.data_map.no_auto_delivery.content|not(), $user.is_logged_in)}
        		                <p>{'Add your selections to'|i18n( 'extension/xrowecommerce')} <a id="show_auto_tip">{'Automatic Delivery'|i18n( 'extension/xrowecommerce')}</a>?</p>
        		                <input class="flat-right2 button" type="submit" onclick="document.buy.action='{"recurringorders/add"|ezurl(no)}'; document.buy.submit(); return true;" name="ActionAddToRecurring" value="{"Add to Automatic Delivery"|i18n("extension/xrowecommerce")}" />
        		            {elseif $node.data_map.no_auto_delivery.content|not()}
        		                <p>{'This product is available for'|i18n( 'extension/xrowecommerce')} <a id="show_auto_tip">{'Automatic Delivery'|i18n( 'extension/xrowecommerce')}</a>. {'To add this product to your Automatic Delivery you have to'|i18n( 'extension/xrowecommerce')} <a href={'user/login'|ezurl}>{'login'|i18n( 'extension/xrowecommerce')}</a>.</p>
        		            {/if}
        	            </div>

        			{/if}
    			</form>
            </div>
        </div>
        <div class="xrow-product-features">
            <a name="related-products"></a>
            {include node=$node uri="design:shop/related_products.tpl"}
            <a name="product-reviews"></a>
            {include node=$node uri="design:shop/review_children.tpl"}
        </div>

</div>
</div>
</div></div></div>
<div class="border-bl"><div class="border-br"><div class="border-bc"></div></div></div>
</div>

{if eq(ezini( 'AutomaticDeliverySettings', 'AutomaticDelivery', 'automaticdelivery.ini' ), 'enabled' )}
                        <div id="AutomaticDeliveryTooltip">
                            <h3>{'What is Automatic Delivery?'|i18n( 'extension/xrowecommerce')}</h3>
                            <p>{"Use our Automatic Delivery service to have this item sent to you as often as you like. You'll get priority on our inventory and save time."|i18n( 'extension/xrowecommerce')}</p>
                            <p>{'By placing your initial Automatic Delivery order and setting up an Automatic Delivery schedule, you authorize us to charge the same credit card for future Automatic Delivery orders until you cancel.'|i18n( 'extension/xrowecommerce')}</p>
                            <p>{'Since the accuracy of your credit card, shipping and billing information is vital to Automatic Delivery, please promptly submit changes through the my account section.'|i18n( 'extension/xrowecommerce')}</p>
                        </div>
{/if}
                