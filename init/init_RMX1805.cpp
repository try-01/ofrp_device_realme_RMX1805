#include <cstdlib>
#include <unistd.h>
#include <fcntl.h>
#include <android-base/logging.h>
#include <android-base/properties.h>

#include "property_service.h"
#include "log.h"

namespace android {
namespace init {

void load_properties(const char *model) {
    property_set("ro.product.model", model);
}

void vendor_load_properties() {
    // Mengambil nilai dari properti 'ro.boot.serialno'.
    std::string serial_no = android::base::GetProperty("ro.boot.serialno", "");

    // Membandingkan nilai properti dengan nomor seri unik perangkat Anda.
    if (serial_no == "af5bf840")
    {
        // Ganti "Nama Perangkat Saya" dengan nama model yang Anda inginkan.
        load_properties("RMX1805");
    }
    else
    {
        // Perangkat lain dengan nomor seri berbeda akan jatuh ke sini.
        load_properties("RMX1805");
    }
}

}  // namespace init
}  // namespace android