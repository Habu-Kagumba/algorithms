import Dependencies._

lazy val root = (project in file(".")).
  settings(
    inThisBuild(List(
      organization     := "HabuDev",
      scalaVersion     := "2.12.2",
      version          := "0.1.0-SNAPSHOT"
    )),
    name := "Algorithms",
    libraryDependencies += scalaTest % Test
  )
