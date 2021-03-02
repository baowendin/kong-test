local typedefs = require "kong.db.schema.typedefs"

return {
  name = "fair-balance",
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