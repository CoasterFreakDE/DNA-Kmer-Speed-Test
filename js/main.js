const { performance } = require("perf_hooks");

const convert = c => {
  if (c === "A") {
    return "C";
  }
  if (c === "C") {
    return "G";
  }
  if (c === "G") {
    return "T";
  }
  if (c === "T") {
    return "A";
  }
  return " ";
};

const lenStr = parseInt(process.argv[2]);
const timeStart = performance.now();

const opt = "ACGT";
let s = "";
let sLast = "";

for (let i = 0; i < lenStr; i++) {
  s += opt[0];
}

for (let i = 0; i < lenStr; i++) {
  sLast += opt[opt.length - 1];
}

const ss = s.split("");
const ssLast = sLast.split("");

let counter = 1;

function arrayEquals(a, b) {
  return a.every((val, index) => val === b[index]);
}

while (!arrayEquals(ss, ssLast)) {
  counter++;
  //console.log(ss.join(""));
  for (let i = 0; i < lenStr; i++) {
    let old = ss[i];
    ss[i] = convert(old);
    if (old !== opt[opt.length - 1]) {
      break;
    }
  }
}

const timeElapsed = performance.now() - timeStart;
console.log(`Number of generated k-mers: ${counter} - took ${timeElapsed}ms`);
