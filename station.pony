use "collections"
use "files"
use "json"
use "time"

class Station is (FromJSON & ToJSON)
  let id: U32
  let name: String
  let system_id: U32
  let landing_pad_size: String

  let distance_to_star: U32 // Ls
  let faction: String
  let government: String
  let allegiance: String
  let state: String // What does this one mean?
  let is_planetary: Bool // Needs Horizons?

  let has_market: Bool
  let has_refuel: Bool
  let has_repair: Bool
  let has_rearm:  Bool
  let has_outfitting: Bool
  let has_shipyard: Bool
  let has_commodities: Bool

  let updated_at: Date
  let market_updated_at: Date

  new val from_json(obj: JsonObject val) =>
    id = try (obj.data("id") as I64).u32() else 0 end
    name = try obj.data("name") as String else "BAD PARSE" end
    system_id = try (obj.data("system_id") as I64).u32() else 0 end
    landing_pad_size = try obj.data("landing_pad_size") as String else "BAD PARSE" end

    distance_to_star = try (obj.data("distance_to_star") as I64).u32() else 0 end
    faction = try obj.data("faction") as String else "BAD PARSE" end
    government = try obj.data("government") as String else "BAD PARSE" end
    allegiance = try obj.data("allegiance") as String else "BAD PARSE" end
    state = try obj.data("state") as String else "BAD PARSE" end
    is_planetary = try obj.data("is_planetary") as Bool else false end

    has_market = try obj.data("has_market") as Bool else false end
    has_refuel = try obj.data("has_refuel") as Bool else false end
    has_repair = try obj.data("has_repair") as Bool else false end
    has_rearm = try obj.data("has_rearm") as  Bool else false end
    has_outfitting = try obj.data("has_outfitting") as Bool else false end
    has_shipyard = try obj.data("has_shipyard") as Bool else false end
    has_commodities = try obj.data("has_commodities") as Bool else false end

    updated_at = Date(try obj.data("updated_at") as I64 else 0 end)
    market_updated_at = Date(try obj.data("updated_at") as I64 else 0 end)

  fun as_map(): Map[String, JsonType] =>
    var map = Map[String, JsonType]()
    map("id") = id.i64()
    map("name") = name
    map("system_id") = system_id.i64()
    map("landing_pad_size") = landing_pad_size

    map("distance_to_star") = distance_to_star.i64()
    map("faction") = faction
    map("government") = government
    map("allegiance") = allegiance
    map("state") = state
    map("is_planetary") = is_planetary

    map("has_market") = has_market
    map("has_refuel") = has_refuel
    map("has_repair") = has_repair
    map("has_rearm") = has_rearm
    map("has_outfitting") = has_outfitting
    map("has_shipyard") = has_shipyard
    map("has_commodities") = has_commodities

    map("updated_at") = updated_at.time()
    map("market_updated_at") = market_updated_at.time()
    map

