{* DO NOT EDIT THIS FILE! Use an override template instead. *}
{def $access=fetch( 'user', 'has_access_to',
                    hash( 'module',   'xrowecommerce',
                          'function', 'administrate' ) )}
{$attribute.data_text|wash( xhtml )} {if $access}{if $attribute.data_int|eq('0')}( {'not validated'|i18n( 'extension/xrowtin' )} ){/if}{if $attribute.data_int|eq('1')}( {'validated'|i18n( 'extension/xrowtin' )} ){/if} {if $attribute.data_int|eq('2')}( {'validated by administration'|i18n( 'extension/xrowtin' )} ){/if}{/if}
{undef $access}