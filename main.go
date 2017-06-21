package main

import (
	"bytes"
	"log"
	"net/http"
	"os"
	"strconv"
)

func main() {

	port := os.Getenv("LISTEN_PORT")
	message := os.Getenv("LISTEN_MSG")

	if port == "" {
		log.Printf("No Listen port: Default  45678")
		port = "45678"
	}

	if message == "" {
		log.Printf("No message, default: hello")
		message = "hello kurti kurtis kurtis!!"
	}

	if _, err := strconv.Atoi(port); err != nil {
		log.Fatalf("Invalid port: %s (%s)\n", port, err)
	}

	http.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
		println("---->", port, r.URL.String())
		res := bytes.NewBufferString("App Version: " + message + "\n\n")
		w.WriteHeader(200)
		w.Write(res.Bytes())
	})
	log.Fatal(http.ListenAndServe(":"+port, nil))
}
