#include "esphome/core/component.h"
#include "esphome/components/sensor/sensor.h"

namespace esphome {
namespace open_dtu {


class Open_dtuComponent : public PollingComponent {
  public:

    void setup() override;
    void loop() override;
    void update() override;
};

}
}
