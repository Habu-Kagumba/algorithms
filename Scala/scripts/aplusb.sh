#!/bin/sh
exec scala -savecompiled "$0" "$@"
!#

import scala.io.StdIn.readLine

object APlusB {
    def prompt {
       println("APlusB")
	   println("---------------------")

       while(true) {
           val arguments = readLine("APlusB >> ").split(" ").map(_.toInt)

           println(arguments.reduceLeft(_ + _))
	   }

    }
}

APlusB.prompt
