desired_count     =   3
ecs_task_cpu      =   256
ecs_task_memory   =   512

ecs_web_service_subnet_ids          =   ["subnet-0058a65be57c06665", "subnet-048ee0d4ea1cee752", "subnet-08fa2875f47649259"]
ecs_web_service_security_group_ids  =   ["sg-02f3759656da6e79b"]

nginx_container_image               =   "574261620507.dkr.ecr.us-east-1.amazonaws.com/jhsong-devops-nginx:0.1"
flask_container_image               =   "574261620507.dkr.ecr.us-east-1.amazonaws.com/jhsong-devops-flask:0.1"

ecs_alb_security_groups     = ["sg-02f3759656da6e79b"]
ecs_alb_subnet_ids          = ["subnet-089b16097a1453bc9", "subnet-08cae3721579d033b", "subnet-083e72b2df88cbd2b"]
vpc_id                      = "vpc-0ec9eae2fa6a69673"