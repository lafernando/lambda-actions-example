import ballerinax/awslambda;

@awslambda:Function
public function hello(awslambda:Context ctx, json input) returns json|error {
    return "Hello, Jack!";
}
