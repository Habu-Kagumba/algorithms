import repl from 'repl';

function aplusb(cmd, context, filename, callback) {
  const sn = cmd.split(' ').map(s => parseInt(s, 10));
  callback(null, sn.reduce((a, b) => a + b, 0));
}

repl.start({ prompt: 'AplusB >> ', eval: aplusb });
