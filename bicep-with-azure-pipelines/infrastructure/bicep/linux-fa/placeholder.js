module.exports = async function (context, req) {
    const name = (req.query.name || (req.body && req.body.name));
    const responseMessage = `<html>Placeholder. this app has not been deployed yet.</html>`

    context.res = {
        headers: {
            "Content-Type": "text/html"
        },
        body: responseMessage
    };
}
