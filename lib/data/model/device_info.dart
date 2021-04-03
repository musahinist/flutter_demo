class DeviceInfo {
  String board;
  String bootloader;
  String brand;
  String device;
  String display;
  String fingerprint;
  String hardware;
  String host;
  String id;
  String manufacturer;
  String model;
  String product;
  String tags;
  String type;
  DeviceInfo({
    required this.board,
    required this.bootloader,
    required this.brand,
    required this.device,
    required this.display,
    required this.fingerprint,
    required this.hardware,
    required this.host,
    required this.id,
    required this.manufacturer,
    required this.model,
    required this.product,
    required this.tags,
    required this.type,
  });

  factory DeviceInfo.fromMap(Map<dynamic, dynamic> map) {
    return DeviceInfo(
      board: map['board'],
      bootloader: map['bootloader'],
      brand: map['brand'],
      device: map['device'],
      display: map['display'],
      fingerprint: map['fingerprint'],
      hardware: map['hardware'],
      host: map['host'],
      id: map['id'],
      manufacturer: map['manufacturer'],
      model: map['model'],
      product: map['product'],
      tags: map['tags'],
      type: map['type'],
    );
  }

  @override
  String toString() {
    return 'DeviceInfo(board: $board, bootloader: $bootloader, brand: $brand, device: $device, display: $display, fingerprint: $fingerprint, hardware: $hardware, host: $host, id: $id, manufacturer: $manufacturer, model: $model, product: $product, tags: $tags, type: $type)';
  }
}
