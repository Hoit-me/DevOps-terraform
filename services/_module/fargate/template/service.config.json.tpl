[
  {
    "name": "${app_name}",
    "image": "${aws_ecr_repository}:${tag}",
    "essential": true,
    "cpu": ${cpu},
    "memory": ${memory},
    "workingDirectory": "/app",
    "portMappings": [
      {
        "containerPort": ${container_port}
      }
    ]
  }
]
