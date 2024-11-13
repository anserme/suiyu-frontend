class LanguageService {
  final Map<String, Map<String, String>> _translations = {
    'zh': {
      'login_title': 'Hi！欢迎登录比特浏览器',
      'user_login': '用户登录',
      'register_now': '立即注册',
      'please_input_user_name': '请输入用户名',
      'please_input_pwd': '请输入密码',
      'please_input_code': '验证码',
      'remember_password': '记住密码',
      'forgot_password': '忘记密码?',
      'login': '登录',
      'browser_name': '比特浏览器',
      'home': '首页',
      'browser_window': '浏览器窗口',
      'cloud_mobile_environment': '云手机环境',
      'automate': 'RPA自动化',
      'group_management': '分组管理',
      'agency_ip': '代理IP',
      'expansion_center': '扩展中心',
      'employee_management': '员工管理',
      'promotion_incentive': '推广奖励',
      'expense_center': '费用中心',
      'setting': '系统设置',
      'operation_log': '操作日志',
      'user_help': '使用帮助',
      'simplified_chinese': '简体中文',
      'welcome_cloud_mobile_phone': '云手机全新上线，欢迎体验！！！',
      'contact_us': '联系我们',
      'official_website': '官方网站',
      'group_control_system': '群控系统',
      'group_control_system_content': '1控多窗口同步操作',
      'proxy_ip_recommendation': '代理IP推荐',
      'marine_resource_pooling': '出海资源汇集',
      'script_market': '脚本市场',
      'use_info': '用户信息',
      'user': '用户：',
      'identity': '身份：',
      'account_balance': '账户余额：',
      'top_up': '充值',
      'document': '文档',
      'faq': '常见问题',
      'faq_content': 'API对接文档(支持操作窗口及Selenium/Puppeteer自动化脚本)',
      'notification': '通知',
      'total_amount': '总额度：',
      'use': '已使用：',
      'authorized': '已授权：',
      'notify_info': '云手机全新上线，欢迎体验！！！',
      'select_employee_attendance_search': '选择员工账号搜索',
      'all': '全部',
      'window_name': '窗口名称：',
      'search': '搜索',
      'create_window': '新建窗口',
      'more_controls': '更多操作',
      'order': '序号',
      'group': '分组',
      'account_platform': '账号平台',
      'proxy_ip': '代理IP',
      'remark': '备注',
      'create_time': '创建时间',
      'disposition': '配置',
      'open': '打开',
      'in_common_use': '常用',
      'group_name': '分组名称：',
      'group_name2': '分组名称',
      'query': '查询',
      'add': '添加',
      'window_group': '窗口分组',
      'cell_phone_environment_grouping': '手机环境分组',
      'number_grouped_windows': '分组窗口数',
      'ownership': '归属',
      'controls': '操作',
      'role_management': '角色管理',
      'employee': '员工',
      'role': '角色',
      'user_name': '用户名',
      'add_employee': '添加员工',
      'user_name_2': '用户名称',
      'window_number': '窗户数',
      'cell_phone_environment_number': '手机环境数',
      'role_identity': '角色(身份)',
      'statue': '状态',
      'basic_setup': '基础设置',
      'proxy_setup': '代理设置',
      'common_settings': '常用设置',
      'fingerprint_setting': '指纹设置',
      'generate_fingerprint_configuration': '一键生成指纹配置',
      'cancel': '取消',
      'sure': '确定',
      'custom_window_name': '自定义窗口名称',
      'selective_grouping': '选择分组',
      'please_select': '请选择',
      'setting_login_name': '设置登录用户名',
      'password': '密码',
      'setting_login_pwd': '设置登录密码',
      'check_duplicates': '校验重复项',
      'verify_user_name': '根据用户名校验',
      'multiple_open_settings': '多开设置',
      'allow': '允许',
      'not_allow': '不允许',
      '2fa_secret_key': '2FA秘钥',
      'please_inout': '请输入',
      'add_other_cookie': '添加其他cookie',
      'open_specified_url': '打开指定网址',
      'proxy_way': '代理方式',
      'custom_proxy': '自定义代理',
      'proxy_tip': '使用代理 IP平台API提取链接提取',
      'proxy_ip_manage': '代理IP管理',
      'ip_query_channel': 'IP查询渠道',
      'agent_type': '代理类型',
      'browser_window_workbench_page': '浏览器窗口工作台页面',
      'local_page': '本地页面',
      'not_show': '不显示',
      'not_show_tip': '使用本地页面或不显示可省流量',
      'disable_image_loading': '禁止加载图片',
      'disable_loading': '禁止加载',
      'disable_loading_tip': '以上的图片，可省流量',
      'allow_login_chrome': '允许登录Chrome',
      'allow_login_chrome_tip':
          '关闭后，无需登录 Chrome 即可登录 Gmail 等 Google 网站(同时不同电脑之间可以同步Gmail等Google网站登录状态)',
      'use_hardware_acceleration_mode': '使用硬件加速模式',
      'use_hardware_acceleration_mode_tip': '开启后，在系统支持情况下将自动启用GPU硬件加速，提升浏览器性能',
      'provincial_storage_mode': '省内存模式',
      'provincial_storage_mode_tip':
          '开启后，会释放闲置标签页占用的内存。这可让使用中的标签页和其他应用获得更多计算机资源，保持快速运行',
      'chrome': '浏览器',
      'browser_kernel_version': '浏览器内核版本',
      'browser_kernel_version_tip': '建议选最新内核，若切换不同内核请清除缓存，避免异常',
      'devices': '设备',
      'operating_system_version': '操作系统版本',
      'browser_version': '浏览器版本',
      'refresh': '换一批',
      'language': '语言',
      'language_tip': '基于IP生成对应国家的浏览器语言，不开启可自定义',
      'interface_language': '界面语言',
      'interface_language_tip': '基于IP生成对应国家的浏览器界面语言，不开启可自定义',
      'time_zone': '时区',
      'time_zone_tip': '基于IP生成对应时区，不开启可自定义',
      'web_rtc_tip': '开启WebRTC，但禁止获取IP',
      'window_size': '窗口尺寸',
      'window_size_tip': '设置浏览器窗口时大小',
      'resolution': '分辨率',
      'follow_computer': '跟随电脑',
      'custom': '自定义',
      'random': '随机',
      'font': '字体',
      'system_default': '系统默认',
      'close': '关闭',
      'canvas_tip': '同一电脑每个浏览器生成不同的Canvas',
      'web_gl_image': 'Web GL图像',
      'web_gl_image_tip': '同一电脑每个浏览器生成不同Web GL',
      'web_gl_metadata': 'Web GL元数据',
      'select_employee_account_search': '选择员工账号搜索：',
      'reset': '重置',
      'selective_category_search': '选择分类搜索：',
      'enter_action_content_search': '输入操作内容搜索',
      'time_search': '日期搜索：',
      'mask_operation_log': '屏蔽操作日志',
      'sort': '分类',
      'operation_content': '操作内容',
      'operating_user': '操作用户',
      'operating_time': '操作时间',
      'your_promotional_link': '您的推广链接',
      'open_package_tip': '请您先开通套餐，即可永久展示您的推广链接',
      'liberal': '开通',
      'your_invitation_code': '您的邀请码',
      'show_after_becoming_promoter': '成为推广者后展示',
      'data_overview': '数据概览',
      'view_coupons': '查看优惠券',
      'withdraw': '提现',
      'promotion_details': '推广详情',
      'withdrawal_record': '提现记录',
      'number_invited_users': '邀请用户数',
      'cumulative_share_amount': '累计分成金额',
      'cumulative_withdrawal': '累计提现',
      'can_withdraw': '可提现',
      'promotion_incentive_mechanism': '推广奖励机制',
      'copy': '复制',
      'browser_cache_tip': '变更缓存目录，清空全部本地缓存，清空全部云端缓存，清空全部云扩展缓存，查询云端是否存在扩展缓存',
      'browser_cache': '浏览器缓存',
      'synchronous_data_tip': '开启后，在窗口的“常用设置”项中，开启“同步扩展应用数据”，开关后，将展示此开关项！',
      'synchronous_data': '展示“跨窗口同步扩展应用数据”开关',
      'select_directory': '选择目录',
      'select_directory_tip': '设置后，文件选择及上传时，将默认使用此目录',
      'update_directory': '文件选择上传载目录',
      'update_directory_tip': '设置后所有的窗口文件保存及下载目录，将自动化使用此目录下的对应窗口序号文件夹',
      'save_directory': '文件保存及下载目录',
      'default_upper_left_corner': '"默认左上角(X;0 Y:0)',
      'screen_maximization': '屏幕最大化',
      'taskbar_minimization': '任务栏最小化',
      'y_value': 'Y值',
      'x_value': 'X值',
      'normal_open': '指定位置正常打开',
      'normal_open_tip': '设置后所有的窗口将以您的设置方式打开',
      'add_boot': '加入开机启动',
      'restore_default_settings': '恢复默认设置',
      'save_basic_settings': '保存基础设置',
      'minimize_software_opens': '软件打开后最小化托盘',
      'support_google': '支持中国代理IP使用谷歌翻译',
      'support_google_tip': '开启后，浏览器窗口在使用中国代理IP的情况下，也可以谷歌翻译',

      'window_billing': '窗口账单',
      'cloud_mobile_phone_bill' : '云手机账单',
      'online_recharge' : '在线充值',
      'balance': '余额',
      'billing_monthly_fee' : '账单月费',
      'billing_monthly_fee_tip' : '0元/月       ',
      'billing_monthly_fee_tip2' : '免费套餐 永久使用',
      'billing_details': '账单详情',
      'billing_details_tip': '经典套餐：窗口 10 员工 1',
      'billing_details_tip1' : '额外员工  1',
      'access_statistics' : '访问统计',
      'open_times_today' : '今日打开次数',
      'open_times_today_tip' : '  5次',
      'open_times_today_tip1' : '每天打开窗口最大次数=总窗口数x5，超过总次数当天无法打开，第二天恢复。',
      'time' : '时间',
      'transaction_amount' : '交易金额',
      'account_balance2' : '账户余额',
      'payment_method': '支付方式',
      'order_type': '订单类型',
      'transaction_details': '交易详情',
      'key_account_manager': '大客户经理',
      'consulting_product': '扫微信客服咨询产品',
      'phone': '电话：',
      'phone_tip': '（微信同号）',
      'environment_number' : '环境数：',
      'environment_number_tip' :'约 ￥0/环境',
      'extra_members': '额外成员数',
      'extra_members_tip' : '约 +￥19/人',
      'original_package_information': '原套餐信息：',
      'browser_environment_number': '浏览器环境数：',
      'package_price': '套餐价格：',
      'maturity_time': '到期时间：',
      'maturity_time_tip': '（剩余18天）',
      'maturity_time_tip2': '原套餐抵扣金额： ￥100（套餐总价/总天数*剩余天数）',
      'go_renew' : '去续费',
      'payment_method2': '支付方式：',
      'extra_members2': '额外成员数：',
      'pay_zfb': '支付宝',
      'pay_wx': '微信',
      'pay_method': '到期自动续费（请确认扣款账户余额充足）',
      'amount_payable': '应付金额：',
      'commit_pay': '提交支付',
      'member_rights_interests': '超级会员臻享权益',
      'member_rights_interests1': '终身免费10个环境数量',
      'cloud_coin_payment': '云币支付（云币：0.00）',
      'rearrange_resize': '重新排列及调整大小',
      'grid_sort': '宫格排序',
      'sort_diagonally': '对角线排序',
      'display': '显示器：',
      'initial_value': '起始值：',
      'window_size1': '窗口大小：',
      'wide': '宽：',
      'high': '高：',
      'number_windows_per_row': '每行窗口数：',
      'window_spacing': '窗口间距：',
      'lateral_spacing': '横向间距：',
      'longitudinal_spacing': '纵向间距：',
      'ordinal_sort': '按序号排序：',
      'positive_sequence': '正序',
      'antithesis': '反序',
      'one_key_adaptive_arrangement': '一键自适应排列',
      'phone_number': '手机号',
      'phone_code': '手机验证码',
      'register': '注册',
      'have_account_login': '已经注册，立即登录',
      'please_input': '请输入',

    },

    'en': {
      'login_title': 'Hi! Welcome to the Bit Browser',
      'user_login': 'user login',
      'register_now': 'register now',
      'please_input_user_name': 'please input user name',
      'please_input_pwd': 'please input pwd',
      'please_input_code': 'please input code',
      'remember_password': 'remember password',
      'forgot_password': 'forgot password?',
      'login': 'login',
      'browser_name': 'browser name',
      'home': 'home',
      'browser_window': 'browser window',
      'cloud_mobile_environment': 'cloud mobile environment',
      'automate': 'RPA automate',
      'group_management': 'group management',
      'agency_ip': 'agency ip',
      'expansion_center': 'expansion center',
      'employee_management': 'employee management',
      'promotion_incentive': 'promotion incentive',
      'expense_center': 'expense center',
      'setting': 'setting',
      'operation_log': 'operation log',
      'user_help': 'user help',
      'simplified_chinese': "simplified Chinese",
      'welcome_cloud_mobile_phone':
          'Cloud mobile phone new online, welcome to experience!!!',
      'contact_us': 'contact Us',
      'official_website': 'official Website',
      'group_control_system': 'group Control System',
      'group_control_system_content': '1控多窗口同步操作',
      'proxy_ip_recommendation': 'proxy IP Recommendation',
      'marine_resource_pooling': 'marine Resource Pooling',
      'script_market': 'script Market',
      'use_info': 'use Info',
      'user': 'user：',
      'identity': 'identity：',
      'account_balance': 'account Balance',
      'top_up': 'top Up',
      'document': 'document',
      'faq': 'faq',
      'faq_content': 'API对接文档(支持操作窗口及Selenium/Puppeteer自动化脚本)',
      'notification': 'notification',
      'total_amount': 'total Amount：',
      'use': 'use：',
      'authorized': 'authorized：',
      'notify_info': 'notify_info',
      'select_employee_attendance_search': 'select_employee_attendance_search',
      'all': 'all',
      'window_name': 'window_name：',
      'search': 'search',
      'create_window': 'create_window',
      'more_controls': 'more_controls',
      'order': 'order',
      'group': 'group',
      'account_platform': 'account_platform',
      'proxy_ip': 'proxy_ip',
      'remark': 'remark',
      'create_time': 'create_time',
      'disposition': 'disposition',
      'open': 'open',
      'in_common_use': 'in_common_use',
      'group_name': 'group_name：',
      'group_name2': 'group_name2',
      'query': 'query',
      'add': 'add',
      'window_group': 'window_group',
      'cell_phone_environment_grouping': 'cell_phone_environment_grouping',
      'number_grouped_windows': 'number_grouped_windows',
      'ownership': 'ownership',
      'controls': 'controls',
      'role_management': 'role_management',
      'employee': 'employee',
      'role': 'role',
      'user_name': 'user_name',
      'add_employee': 'add_employee',
      'user_name_2': 'user_name_2',
      'window_number': 'window_number',
      'cell_phone_environment_number': 'cell_phone_environment_number',
      'role_identity': 'role_identity',
      'statue': 'statue',
      'basic_setup': 'basic_setup',
      'proxy_setup': 'proxy_setup',
      'common_settings': 'common_settings',
      'fingerprint_setting': 'fingerprint_setting',
      'generate_fingerprint_configuration': 'generate_fingerprint_configuration',
      'cancel': 'cancel',
      'sure': 'sure',
      'custom_window_name': 'custom_window_name',
      'selective_grouping': 'selective_grouping',
      'please_select': 'please_select',
      'setting_login_name': 'setting_login_name',
      'password': 'password',
      'setting_login_pwd': 'setting_login_pwd',
      'check_duplicates': 'check_duplicates',
      'verify_user_name': 'verify_user_name',
      'multiple_open_settings': 'multiple_open_settings',
      'allow': 'allow',
      'not_allow': 'not_allow',
      '2fa_secret_key': '2FA秘钥',
      'please_inout': '请输入',
      'add_other_cookie': '添加其他cookie',
      'open_specified_url': '打开指定网址',
      'proxy_way': '代理方式',
      'custom_proxy': '自定义代理',
      'proxy_tip': '使用代理 IP平台API提取链接提取',
      'proxy_ip_manage': '代理IP管理',
      'ip_query_channel': 'IP查询渠道',
      'agent_type': '代理类型',
      'browser_window_workbench_page': '浏览器窗口工作台页面',
      'local_page': '本地页面',
      'not_show': '不显示',
      'not_show_tip': '使用本地页面或不显示可省流量',
      'disable_image_loading': '禁止加载图片',
      'disable_loading': '禁止加载',
      'disable_loading_tip': '以上的图片，可省流量',
      'allow_login_chrome': '允许登录Chrome',
      'allow_login_chrome_tip':
          '关闭后，无需登录 Chrome 即可登录 Gmail 等 Google 网站(同时不同电脑之间可以同步Gmail等Google网站登录状态)',
      'use_hardware_acceleration_mode': '使用硬件加速模式',
      'use_hardware_acceleration_mode_tip': '开启后，在系统支持情况下将自动启用GPU硬件加速，提升浏览器性能',
      'provincial_storage_mode': '省内存模式',
      'provincial_storage_mode_tip':
          '开启后，会释放闲置标签页占用的内存。这可让使用中的标签页和其他应用获得更多计算机资源，保持快速运行',
      'chrome': '浏览器',
      'browser_kernel_version': '浏览器内核版本',
      'browser_kernel_version_tip': '建议选最新内核，若切换不同内核请清除缓存，避免异常',
      'devices': '设备',
      'operating_system_version': '操作系统版本',
      'browser_version': '浏览器版本',
      'refresh': '换一批',
      'language': '语言',
      'language_tip': '基于IP生成对应国家的浏览器语言，不开启可自定义',
      'interface_language': '界面语言',
      'interface_language_tip': '基于IP生成对应国家的浏览器界面语言，不开启可自定义',
      'time_zone': '时区',
      'time_zone_tip': '基于IP生成对应时区，不开启可自定义',
      'web_rtc_tip': '开启WebRTC，但禁止获取IP',
      'window_size': '窗口尺寸',
      'window_size_tip': '设置浏览器窗口时大小',
      'resolution': '分辨率',
      'follow_computer': '跟随电脑',
      'custom': '自定义',
      'random': '随机',
      'font': '字体',
      'system_default': '系统默认',
      'close': '关闭',
      'canvas_tip': '同一电脑每个浏览器生成不同的Canvas',
      'web_gl_image': 'Web GL图像',
      'web_gl_image_tip': '同一电脑每个浏览器生成不同Web GL',
      'web_gl_metadata': 'Web GL元数据',
      'select_employee_account_search': 'select_employee_account_search：',
      'reset': 'reset',
      'selective_category_search': 'selective_category_search：',
      'enter_action_content_search': 'enter_action_content_search',
      'time_search': 'time_search：',
      'mask_operation_log': 'mask_operation_log',
      'sort': '分类',
      'operation_content': '操作内容',
      'operating_user': '操作用户',
      'operating_time': '操作时间',
      'your_promotional_link': '您的推广链接',
      'open_package_tip': '请您先开通套餐，即可永久展示您的推广链接',
      'liberal': '开通',
      'your_invitation_code': '您的邀请码',
      'show_after_becoming_promoter': '成为推广者后展示',
      'data_overview': '数据概览',
      'view_coupons': '查看优惠券',
      'withdraw': '提现',
      'promotion_details': '推广详情',
      'withdrawal_record': '提现记录',
      'number_invited_users': '邀请用户数',
      'cumulative_share_amount': '累计分成金额',
      'cumulative_withdrawal': '累计提现',
      'can_withdraw': '可提现',
      'promotion_incentive_mechanism': '推广奖励机制',
      'copy': '复制',
      'browser_cache_tip': '变更缓存目录，清空全部本地缓存，清空全部云端缓存，清空全部云扩展缓存，查询云端是否存在扩展缓存',
      'browser_cache': '浏览器缓存',
      'synchronous_data_tip': '开启后，在窗口的“常用设置”项中，开启“同步扩展应用数据”，开关后，将展示此开关项！',
      'synchronous_data': '展示“跨窗口同步扩展应用数据”开关',
      'select_directory': '选择目录',
      'select_directory_tip': '设置后，文件选择及上传时，将默认使用此目录',
      'update_directory': '文件选择上传载目录',
      'update_directory_tip': '设置后所有的窗口文件保存及下载目录，将自动化使用此目录下的对应窗口序号文件夹',
      'save_directory': '文件保存及下载目录',
      'default_upper_left_corner': '"默认左上角(X;0 Y:0)',
      'screen_maximization': '屏幕最大化',
      'taskbar_minimization': '任务栏最小化',
      'y_value': 'Y值',
      'x_value': 'X值',
      'normal_open': '指定位置正常打开',
      'normal_open_tip': '设置后所有的窗口将以您的设置方式打开',
      'add_boot': '加入开机启动',
      'restore_default_settings': '恢复默认设置',
      'save_basic_settings': '保存基础设置',
      'minimize_software_opens': '软件打开后最小化托盘',
      'support_google': '支持中国代理IP使用谷歌翻译',
      'support_google_tip': '开启后，浏览器窗口在使用中国代理IP的情况下，也可以谷歌翻译',
      'window_billing': '窗口账单',
      'cloud_mobile_phone_bill' : '云手机账单',
      'online_recharge' : '在线充值',
      'balance': '余额',
      'billing_monthly_fee' : '账单月费',
      'billing_monthly_fee_tip' : '0元/月       ',
      'billing_monthly_fee_tip2' : '免费套餐 永久使用',
      'billing_details': '账单详情',
      'billing_details_tip': '经典套餐：窗口 10 员工 1',
      'billing_details_tip1' : '额外员工  1',
      'access_statistics' : '访问统计',
      'open_times_today' : '今日打开次数',
      'open_times_today_tip' : '  5次',
      'open_times_today_tip1' : '每天打开窗口最大次数=总窗口数x5，超过总次数当天无法打开，第二天恢复。',
      'time' : '时间',
      'transaction_amount' : '交易金额',
      'account_balance2' : '账户余额',
      'payment_method': '支付方式',
      'order_type': '订单类型',
      'transaction_details': '交易详情',
      'key_account_manager': 'key_account_manager',
      'consulting_product': '扫微信客服咨询产品',
      'phone': '电话：',
      'phone_tip': '（微信同号）',
      'environment_number' : '环境数：',
      'environment_number_tip' :'约 ￥0/环境',
      'extra_members': '额外成员数',
      'extra_members_tip' : '约 +￥19/人',
      'original_package_information': '原套餐信息：',
      'browser_environment_number': '浏览器环境数：',
      'package_price': '套餐价格：',
      'maturity_time': '到期时间：',
      'maturity_time_tip': '（剩余18天）',
      'maturity_time_tip2': '原套餐抵扣金额： ￥100（套餐总价/总天数*剩余天数）',
      'go_renew' : '去续费',
      'payment_method2': '支付方式：',
      'extra_members2': '额外成员数：',
      'pay_zfb': '支付宝',
      'pay_wx': '微信',
      'pay_method': '到期自动续费（请确认扣款账户余额充足）',
      'amount_payable': '应付金额：',
      'commit_pay': '提交支付',
      'member_rights_interests': '超级会员臻享权益',
      'member_rights_interests1': '终身免费10个环境数量',
      'cloud_coin_payment': '云币支付（云币：0.00）',
      'rearrange_resize': '重新排列及调整大小',
      'grid_sort': '宫格排序',
      'sort_diagonally': '对角线排序',
      'display': '显示器：',
      'initial_value': '起始值：',
      'window_size1': '窗口大小：',
      'wide': '宽：',
      'high': '高：',
      'number_windows_per_row': '每行窗口数：',
      'window_spacing': '窗口间距：',
      'lateral_spacing': '横向间距：',
      'longitudinal_spacing': '纵向间距：',
      'ordinal_sort': '按序号排序：',
      'positive_sequence': '正序',
      'antithesis': '反序',
      'one_key_adaptive_arrangement': '一键自适应排列',
      'please_input': 'please input',
    },
  };

  String translate(String key, {String locale = 'zh'}) {
    return _translations[locale]?[key] ?? key;
  }
}