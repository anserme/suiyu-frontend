class AppUrl {
  static const String baseUrl = 'http://192.168.137.202:5718';
  static const String login = '/user/api/login';//登录
  static const String pullInitQrCodeInfo = '/user/api/pullInitQrCodeInfo'; // 获取初始化二维码信息
  static const String initDevice = '/user/api/initDevice'; // 初始化设备
  static const String appConfig = '/user/api/appConfig'; // 应用配置信息
  static const String listening = '/user/api/listening'; // 获取监听运行的日志
  static const String deviceType = '/user/api/pullInitDeviceType'; // 初始化设备类型
  static const String ping = '/user/api/ping'; // ping地址
  static const String pushFileInitDevice = '/user/api/pushFileInitDevice'; // 上传图片
  static const String qrCodeAnalyze = '/user/api/qrCodeAnalyze'; // 上传图片
  static const String webBase64Analyze = '/user/api/base64ByJson'; // 解析base64数据为JSON
  static const String initDeviceByReadFile = '/user/api/initDeviceByReadFile'; // 读取文件初始化
}