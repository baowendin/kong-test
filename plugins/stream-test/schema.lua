local typedefs = require "kong.db.schema.typedefs"

return {
  name = "stream-test",
  fields = {
    {
      protocols = typedefs.protocols { default = { "tcp", "tls"} },
    },
    {
      config = {
        type = "record",
        fields = {
        },
      },
    },
  },
}