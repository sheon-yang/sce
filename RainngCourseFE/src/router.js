import Vue from "vue";
import VueRouter from "vue-router";
import Container from "./views/Container.vue";
import Login from "./views/Login";
import StudentCourseSelect from "./views/student/StudentCourseSelect";
import StudentCourse from "./views/student/StudentCourse";
import StudentInfo from "./views/student/StudentInfo";
import StudentScore from "./views/student/StudentScore";
import TeacherCourse from "./views/teacher/TeacherCourse";
import TeacherGrade from "./views/teacher/TeacherGrade";
import AdminStudent from "./views/admin/AdminStudent";
import AdminTeacher from "./views/admin/AdminTeacher";
import AdminCourse from "./views/admin/AdminCourse";
import Home from "./views/Home";

Vue.use(VueRouter);

const routes = [
  {
    path: "/",
    name: "container",
    component: Container,
    children: [
      {
        path: "/student",
        name: "student-home",
        component: Home
      },
      {
        path: "/student/course/select",
        name: "student-course-select",
        component: StudentCourseSelect
      },
      {
        path: "/student/course",
        name: "student-course",
        component: StudentCourse
      },
      {
        path: "/student/score",
        name: "student-score",
        component: StudentScore
      },
      {
        path: "/student/info",
        name: "student-info",
        component: StudentInfo
      },
      {
        path: "/teacher",
        name: "teacher-home",
        component: Home
      },
      {
        path: "/teacher/course",
        name: "teacher-course",
        component: TeacherCourse
      },
      {
        path: "/teacher/grade",
        name: "teacher-grade",
        component: TeacherGrade
      },
      {
        path: "/admin",
        name: "admin-home",
        component: Home
      },
      {
        path: "/admin/student",
        name: "admin-student",
        component: AdminStudent
      },
      {
        path: "/admin/teacher",
        name: "admin-teacher",
        component: AdminTeacher
      },
      {
        path: "/admin/course",
        name: "admin-course",
        component: AdminCourse
      }
    ]
  },
  {
    path: "/login",
    name: "login",
    component: Login
  }
];

const router = new VueRouter({
  mode: "history",
  base: process.env.BASE_URL,
  routes
});

export default router;
