module.exports = async function (context, req) {
    const name = (req.query.name || (req.body && req.body.name));
    const responseMessage = `<html><h1>i'm a cat app.</h1><p><img src="" style="width:25%" /></p></html>`

    context.res = {
        headers: {
            "Content-Type": "text/html"
        },
        body: responseMessage
    };
}