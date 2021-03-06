/**
-------------------------------------------------
   File Name：     main.go
   Date：          2021/1/21
   Author:        xiaozhang@xd.com
-------------------------------------------------
**/
package main

import "github.com/gin-gonic/gin"

func main() {
	r := gin.Default()
	r.GET("/ping", func(c *gin.Context) {
		c.JSON(200, gin.H{
			"message": "xiaozhang",
		})
	})
	_ = r.Run() // listen and serve on 0.0.0.0:8080
}
