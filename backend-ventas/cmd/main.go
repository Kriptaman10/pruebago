package main

import (
    "github.com/gin-gonic/gin"
    "log"
    "os"
)

func main() {
    r := gin.Default()

    r.GET("/ping", func(c *gin.Context) {
        c.JSON(200, gin.H{"message": "pong"})
    })

    port := os.Getenv("PORT")
    if port == "" {
        port = "3001"
    }

    log.Fatal(r.Run(":" + port))
}
