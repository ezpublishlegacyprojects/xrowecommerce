<?php /* #?ini charset="iso-8859-1"?

#?ini charset="iso-8859-1"?
# eZ publish configuration file for workflows.

[EventSettings]
RepositoryDirectories[]=extension/xrowecommerce/workflowtypes
ExtensionDirectories[]=xrowecommerce
AvailableEventTypes[]=event_xrowpaymentgateway
AvailableEventTypes[]=event_ezproductcount
AvailableEventTypes[]=event_ezcouponworkflow
AvailableEventTypes[]=event_ezshippinginterface

[CouponWorkflow]
Description=Coupon

# Do we use this?
[SimpleShippingWorkflow]
FreeShipping=Disabled
FreeShippingPrice=50.00
FreeShippingDiscount=8.00
eZoption2ProductVariations=Enabled
ShippingVendorName=AlconeCo
DefaultStandardShipping=9.00
Debug=Disabled


*/ ?>
