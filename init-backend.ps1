param (
    [string]$name = "backend-default"
)

mkdir $name
cd $name

go mod init "github.com/tuusuario/$name"

go get -u github.com/gin-gonic/gin
go get -u gorm.io/gorm
go get -u gorm.io/driver/postgres
go get github.com/joho/godotenv

mkdir cmd,config,controllers,models,routes,middleware,utils

@"
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
        port = "8080"
    }
    log.Fatal(r.Run(":" + port))
}
"@ | Out-File .\cmd\main.go -Encoding utf8
