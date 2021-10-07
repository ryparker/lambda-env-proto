import http from 'http';
import ProxyAgent from 'proxy-agent';

var opts = {
  method: 'GET',
  host: 'www.google.com',
  path: '/',
  // this is the important part!
  // If no proxyUri is specified, then https://www.npmjs.com/package/proxy-from-env
  // is used to get the proxyUri.
  agent: new ProxyAgent()
};

console.log(`agent: ${JSON.stringify(opts.agent, null, 2)}`);

// the rest works just like any other normal HTTP request
http.get(opts, onresponse);

function onresponse(res: any) {
  console.log(res.statusCode, res.headers);
  res.pipe(process.stdout);
}
