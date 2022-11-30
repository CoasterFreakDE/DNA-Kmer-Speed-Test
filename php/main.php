<?php
function convert($c) {
  if ($c === "A") {
    return "C";
  }
  if ($c === "C") {
    return "G";
  }
  if ($c === "G") {
    return "T";
  }
  if ($c === "T") {
    return "A";
  }
  return " ";
}

$lenStr = (int) $argv[1];
$timeStart = microtime(true);

$opt = "ACGT";
$s = "";
$sLast = "";

for ($i = 0; $i < $lenStr; $i++) {
  $s .= $opt[0];
}

for ($i = 0; $i < $lenStr; $i++) {
  $sLast .= $opt[strlen($opt) - 1];
}

$ss = str_split($s);
$ssLast = str_split($sLast);

$counter = 1;

function arrayEquals($a, $b) {
  return $a == $b;
}

while (!arrayEquals($ss, $ssLast)) {
  $counter++;
  // echo implode("", $ss) . PHP_EOL;
  for ($i = 0; $i < $lenStr; $i++) {
    $old = $ss[$i];
    $ss[$i] = convert($old);
    if ($old !== $opt[strlen($opt) - 1]) {
      break;
    }
  }
}

$timeElapsed = microtime(true) - $timeStart;
echo "Number of generated k-mers: ${counter} - took ${timeElapsed}ms" . PHP_EOL;