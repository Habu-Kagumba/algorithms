package main

import (
	"bufio"
	"fmt"
	"os"
	"strconv"
	"strings"
)

func toAtoi(s []string) []int {
	i := make([]int, 0, len(s))
	for _, v := range s {
		a, err := strconv.Atoi(v)
		if err != nil {
			fmt.Println(err)
		}
		i = append(i, a)
	}
	return i
}

func addSlice(i []int) int {
	total := 0
	for _, v := range i {
		total = total + v
	}

	return total
}

func main() {
	reader := bufio.NewReader(os.Stdin)
	fmt.Println("APlusB")
	fmt.Println("---------------------")

	for {
		fmt.Println("APlusB >> ")
		text, _ := reader.ReadString('\n')
		s := strings.Fields(text)
		i := toAtoi(s)

		fmt.Println(addSlice(i))
	}
}
