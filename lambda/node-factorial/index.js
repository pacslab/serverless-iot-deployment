exports.handler = async (event) => {
    // TODO implement
    var rval = 1;
    for (var i = 2; i <= 10000; i++)
        rval = rval * i;
    const response = {
        statusCode: 200,
        body: JSON.stringify('Hello from fac!'),
    };
    return response;
};
