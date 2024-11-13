import 'package:flutter/foundation.dart' show immutable;
import 'package:fpbrowser/resources/app_assets/app_image_assets.dart';
import 'package:riverpod/riverpod.dart';

import '../../../resources/lations/languages.dart';

@immutable
class EmployeeManagementAddPeople {
  const EmployeeManagementAddPeople( {
    required this.userName,
  });

  final String userName;
}

class EmployeeManagementAddPeopleList extends Notifier<List<EmployeeManagementAddPeople>> {

  @override
  List<EmployeeManagementAddPeople> build() => [
    EmployeeManagementAddPeople(userName: "2023-08-10 12:12:12"),
  ];

  void addPeople({required String  userName}) {
    state = [
      EmployeeManagementAddPeople(userName: userName)
    ];
  }

  final languageService = LanguageService();
   LanguageService language() {
     return languageService;
   }
}

@immutable
class EmployeeManagementContent {

  final int id;
  final String userName;
  final String windowNumber;
  final String mobilePhoneEnvironmentNumber;
  final bool statue;
  final String time;
  final String identity;
  final bool isSelect;
  final bool isHover;
  final bool isEnter;

  const EmployeeManagementContent({required this.id, required this.userName, required this.windowNumber, required this.mobilePhoneEnvironmentNumber, required this.statue, required this.time, required this.identity, required this.isSelect, required this.isHover, required this.isEnter});

}
final employeeManagementProvider = NotifierProvider<EmployeeManagementContentList, List<EmployeeManagementContent>>((ref) {
  return EmployeeManagementContentList();
} as EmployeeManagementContentList Function());
class EmployeeManagementContentList extends Notifier<List<EmployeeManagementContent>> {

  @override
  List<EmployeeManagementContent> build() => [
    const EmployeeManagementContent(id: 0, userName: "MB00001", windowNumber: "1/1", mobilePhoneEnvironmentNumber: "1/1", statue: true, time: "2023-08-10 12:12:12", identity: "15671718898", isSelect: false, isHover: false, isEnter: false),
    const EmployeeManagementContent(id: 1, userName: "MB00001", windowNumber: "1/1", mobilePhoneEnvironmentNumber: "1/1", statue: true, time: "2023-08-10 12:12:12", identity: "15671718898", isSelect: false, isHover: false, isEnter: false),
    const EmployeeManagementContent(id: 2, userName: "MB00001", windowNumber: "1/1", mobilePhoneEnvironmentNumber: "1/1", statue: true, time: "2023-08-10 12:12:12", identity: "15671718898", isSelect: false, isHover: false, isEnter: false),
    const EmployeeManagementContent(id: 3, userName: "MB00001", windowNumber: "1/1", mobilePhoneEnvironmentNumber: "1/1", statue: true, time: "2023-08-10 12:12:12", identity: "15671718898", isSelect: false, isHover: false, isEnter: false),
    const EmployeeManagementContent(id: 4, userName: "MB00001", windowNumber: "1/1", mobilePhoneEnvironmentNumber: "1/1", statue: true, time: "2023-08-10 12:12:12", identity: "15671718898", isSelect: false, isHover: false, isEnter: false),
    const EmployeeManagementContent(id: 5, userName: "MB00001", windowNumber: "1/1", mobilePhoneEnvironmentNumber: "1/1", statue: true, time: "2023-08-10 12:12:12", identity: "15671718898", isSelect: false, isHover: false, isEnter: false),
    const EmployeeManagementContent(id: 6, userName: "MB00001", windowNumber: "1/1", mobilePhoneEnvironmentNumber: "1/1", statue: true, time: "2023-08-10 12:12:12", identity: "15671718898", isSelect: false, isHover: false, isEnter: false),
    const EmployeeManagementContent(id: 7, userName: "MB00001", windowNumber: "1/1", mobilePhoneEnvironmentNumber: "1/1", statue: true, time: "2023-08-10 12:12:12", identity: "15671718898", isSelect: false, isHover: false, isEnter: false),
    const EmployeeManagementContent(id: 8, userName: "MB00001", windowNumber: "1/1", mobilePhoneEnvironmentNumber: "1/1", statue: true, time: "2023-08-10 12:12:12", identity: "15671718898", isSelect: false, isHover: false, isEnter: false),
    const EmployeeManagementContent(id: 9, userName: "MB00001", windowNumber: "1/1", mobilePhoneEnvironmentNumber: "1/1", statue: true, time: "2023-08-10 12:12:12", identity: "15671718898", isSelect: false, isHover: false, isEnter: false),
    const EmployeeManagementContent(id: 10, userName: "MB00001", windowNumber: "1/1", mobilePhoneEnvironmentNumber: "1/1", statue: true, time: "2023-08-10 12:12:12", identity: "15671718898", isSelect: false, isHover: false, isEnter: false),
  ];

  void editSelect({required int id}) {
    state = [
      for (final menu in state)
        if (menu.id == id)
          EmployeeManagementContent(
              id: menu.id,
              userName: menu.userName,
              windowNumber: menu.windowNumber,
              mobilePhoneEnvironmentNumber: menu.mobilePhoneEnvironmentNumber,
              statue: menu.statue,
            time: menu.time,
            identity: menu.identity,
            isSelect: !menu.isSelect,
            isHover: false,
            isEnter: false
          )
        else
          EmployeeManagementContent(
              id: menu.id,
              userName: menu.userName,
              windowNumber: menu.windowNumber,
              mobilePhoneEnvironmentNumber: menu.mobilePhoneEnvironmentNumber,
              statue: menu.statue,
              time: menu.time,
              identity: menu.identity,
              isSelect: false,
              isHover: false,
              isEnter: false
          )
    ];
  }
  void editOut({required int id}) {
    state = [
      for (final menu in state)
        EmployeeManagementContent(
            id: menu.id,
            userName: menu.userName,
            windowNumber: menu.windowNumber,
            mobilePhoneEnvironmentNumber: menu.mobilePhoneEnvironmentNumber,
            statue: menu.statue,
            time: menu.time,
            identity: menu.identity,
            isSelect: false,
            isHover: false,
            isEnter: false
        )
    ];
  }
  void editEnter({required int id}) {
    state = [
      for (final menu in state)
        if (menu.id == id)
          EmployeeManagementContent(
              id: menu.id,
              userName: menu.userName,
              windowNumber: menu.windowNumber,
              mobilePhoneEnvironmentNumber: menu.mobilePhoneEnvironmentNumber,
              statue: menu.statue,
              time: menu.time,
              identity: menu.identity,
              isSelect: false,
              isHover: false,
              isEnter: !menu.isEnter
          )
        else
          EmployeeManagementContent(
              id: menu.id,
              userName: menu.userName,
              windowNumber: menu.windowNumber,
              mobilePhoneEnvironmentNumber: menu.mobilePhoneEnvironmentNumber,
              statue: menu.statue,
              time: menu.time,
              identity: menu.identity,
              isSelect: false,
              isHover: false,
              isEnter: false
          )
    ];
  }

}
