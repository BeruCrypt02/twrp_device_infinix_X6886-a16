#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <android-base/properties.h>

#define _REALLY_INCLUDE_SYS__SYSTEM_PROPERTIES_H_
#include <sys/_system_properties.h>

using android::base::GetProperty;
using std::string;

void property_override(string prop, string value)
{
    auto pi = (prop_info *)__system_property_find(prop.c_str());

    if (pi != nullptr)
        __system_property_update(pi, value.c_str(), value.size());
    else
        __system_property_add(prop.c_str(), prop.size(), value.c_str(), value.size());
}

void vendor_load_properties()
{
    string prop_partitions[] = {"", "vendor.", "odm."};
    for (const string &prop : prop_partitions)
    {
        property_override(string("ro.product.") + prop + string("brand"), "Infinix");
        property_override(string("ro.product.") + prop + string("name"), "X6886-OP");
        property_override(string("ro.product.") + prop + string("device"), "Infinix-X6886");
        property_override(string("ro.product.") + prop + string("model"), "Infinix X6886");
        property_override(string("ro.product.") + prop + string("marketname"), "Infinix HOT 60 PRO PLUS");
        property_override(string("ro.product.system.") + prop + string("device"), "Infinix HOT 60 PRO PLUS");
        property_override("ro.hardware", "mt6789");
        property_override("ro.board.platform", "mt6789");
        property_override("ro.vendor.mtk_tee_gp_support", "1");
        property_override("ro.vendor.mtk_trustonic_tee_support", "1");
    }
}
