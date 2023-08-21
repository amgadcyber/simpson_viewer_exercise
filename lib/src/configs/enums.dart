enum Flavor {
  /// [variantOne] -- Variant One
  variantOne,

  /// [variantTwo] -- Variant Two
  variantTwo,
}

enum ConnectionState {
  /// [done] -- Connection is Done
  done,

  /// [waiting] -- is Connecting, Fetching data
  waiting,

  /// [empty] -- Response was empty
  empty,

  /// [failed] -- Failed to connect,
  failed,
}
