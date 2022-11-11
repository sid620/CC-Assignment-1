#!/bin/bash

#curl -X POST http://localhost:8080/build/spark --header "Content-Type:application/json;charset=UTF-8" --data '{
#  "appResource": "${SPARK_APP}/demo-1.0.0.jar",
#  "sparkProperties": {
#    "spark.executor.memory": "4g",
#    "spark.master": "spark://localhost:8080",
#    "spark.driver.memory": "4g",
#    "spark.driver.cores": "2",
#    "spark.eventLog.enabled": "false",
#    "spark.app.name": "Spark REST API201804291717022",
#    "spark.submit.deployMode": "cluster",
#    "spark.jars": "${SPARK_APP}/demo-1.0.0.jar",
#    "spark.driver.supervise": "true"
#  },
#  "clientSparkVersion": "3.3.1",
#  "mainClass": "com.example.IndexCreate",
#  "environmentVariables": {
#    "SPARK_ENV_LOADED": "1"
#  },
#  "action": "CreateSubmissionRequest",
#  "appArgs": [
#  ]
#}
