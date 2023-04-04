package main

import (
	"fmt"
	"github.com/eiannone/keyboard"
)

var pressAnyKey chan rune

func main() {
	pressAnyKey = make(chan rune)
	go listenForKeyPress()

	_ = keyboard.Open()
	defer func() {
		_ = keyboard.Close()
	}()

	for {
		char, _, _ := keyboard.GetSingleKey()
		if char == 'q' || char == 'Q' {
			fmt.Println("Bye...")
			break
		}
		pressAnyKey <- char
	}
}

func listenForKeyPress() {
	for {
		char := <-pressAnyKey
		fmt.Println("You pressed", string(char))
	}
}
