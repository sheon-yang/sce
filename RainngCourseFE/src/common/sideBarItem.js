import UserType from "./userType";
import Permission from "./permission";

let SideBarItem = {};

SideBarItem.items = [
  {
    icon: "el-icon-fa fa-bar-chart",
    index: "/student",
    title: "学生首页",
    userType: UserType.student,
    permission: Permission.no
  },
  {
    icon: "el-icon-fa fa-book",
    index: "/student/course/select",
    title: "选修课程",
    userType: UserType.student,
    permission: Permission.no
  },
  {
    icon: "el-icon-fa fa-edit",
    index: "/student/course",
    title: "已选课程",
    userType: UserType.student,
    permission: Permission.no
  },
  {
    icon: "el-icon-fa fa-newspaper-o",
    index: "/student/score",
    title: "成绩查询",
    userType: UserType.student,
    permission: Permission.no
  },
  {
    icon: "el-icon-fa fa-id-badge",
    index: "/student/info",
    title: "信息维护",
    userType: UserType.student,
    permission: Permission.no
  },
  {
    icon: "el-icon-fa fa-bar-chart",
    index: "/teacher",
    title: "教师首页",
    userType: UserType.teacher,
    permission: Permission.no
  },
  {
    icon: "el-icon-fa fa-book",
    index: "/teacher/course",
    title: "授课查询",
    userType: UserType.teacher,
    permission: Permission.no
  },
  {
    icon: "el-icon-fa fa-edit",
    index: "/teacher/grade",
    title: "成绩录入",
    userType: UserType.teacher,
    permission: Permission.no
  },
  {
    icon: "el-icon-fa fa-bar-chart",
    index: "/admin",
    title: "管理员首页",
    userType: UserType.admin,
    permission: Permission.no
  },
  {
    icon: "el-icon-fa fa-user",
    index: "/admin/student",
    title: "学生管理",
    userType: UserType.admin,
    permission: Permission.student
  },
  {
    icon: "el-icon-fa fa-user-plus",
    index: "/admin/teacher",
    title: "教师管理",
    userType: UserType.admin,
    permission: Permission.teacher
  },
  {
    icon: "el-icon-fa fa-book",
    index: "/admin/course",
    title: "课程管理",
    userType: UserType.admin,
    permission: Permission.course
  }
];

export default SideBarItem;
