package main

import (
	"errors"
	"fmt"
	"io/ioutil"
	"os"
	"strconv"
	"strings"
)

// package maxPairProduct

func check(e error) {
	if e != nil {
		panic(e)
	}
}

func toAtoi(s []string) []int {
	i := make([]int, 0, len(s))
	for _, v := range s {
		a, err := strconv.Atoi(v)
		check(err)
		i = append(i, a)
	}
	return i
}

func parseInput() (int, []int, error) {
	data, err := ioutil.ReadAll(os.Stdin)
	check(err)

	lines := strings.Split(string(data), "\n")
	n, err := strconv.Atoi(lines[0])
	check(err)
	arr := toAtoi(strings.Split(lines[1], " "))

	if len(data) < 1 {
		return n, arr, errors.New("no input")
	}

	return n, arr, nil
}

func maxPairProduct() {
}

func main() {
	n, arr, err := parseInput()
	check(err)

	fmt.Println(n)
	fmt.Println(arr)
}
