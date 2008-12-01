            <table>
                 {def $prod=fetch( 'content', 'node', hash( 'node_id', $product_item.node_id ) )}
                 {if $prod.data_map.variation.content.option_list|count|gt(0)}
                 {def $vary=$product_item.item_object.contentobject.data_map.variation.content.option_list[$product_item.item_object.option_list.0.option_item_id]}
                 {section var=option_item loop=$product_item.item_object.option_list}
                    <tr>
                        <td rowspan="4" class="product-cell">
                        {if $vary.image|is_object(true)}
                            {if $vary.image.current.data_map.image.has_content}
                            {attribute_view_gui image_class=small attribute=$vary.image.current.data_map.image}
                            {/if}
                        {else}
                            {if $product_item.item_object.contentobject.data_map.image.has_content}
                            {attribute_view_gui image_class=small attribute=$product_item.item_object.contentobject.data_map.image}
                            {else}
                            <div class="nopic">&nbsp;</div>
                            {/if}
                        {/if}
                        </td>
                        <td>
                        <p><a class="basketlink" href={concat("/content/view/full/",$prod.node_id)|ezurl}>{$prod.name|wash()}</a></p>
                        </td>
                    </tr>
                    <tr>
                        <td>
                        {$prod.data_map.product_id.content|wash()}{$option_item.value}
                        </td>
                    </tr>
                    <tr>
                        <td>
                        {$vary.comment}
                        </td>
                    </tr>
                    {if $vary.weight}
                    <tr>
                        <td>
                        {'Weight'|i18n("design/ezwebin/shop/basket")}: {$vary.weight|wash()} {'lbs'|i18n("design/ezwebin/shop/basket")}
                        </td>
                    </tr>
                    {/if}
                    {/section}
                 {else}
                    <tr>
                        <td rowspan="4" class="product-cell">
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
                        {$prod.data_map.product_id.content|wash()}{$prod.data_map.variation.content.name}
                    </tr>
                    <tr>
                        <td>
                        {def $vary=$product_item.item_object.contentobject.data_map.variation.content.option_list[$product_item.item_object.option_list.0.option_item_id]}
                        {$vary.comment}                        
                        </td>
                    </tr>
                    {if $prod.data_map.weight}
                    <tr>
                        <td>
                        {'Weight'|i18n("design/ezwebin/shop/basket")}: {attribute_view_gui attribute=$prod.data_map.weight} {'lbs'|i18n("design/ezwebin/shop/basket")}
                        </td>
                    </tr>
                    {/if}
                    {/if}
                    
                </table>