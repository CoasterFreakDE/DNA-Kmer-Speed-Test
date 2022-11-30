using System.Diagnostics;

char convert(char c) => c switch {
  'A' => 'C',
  'C' => 'G',
  'G' => 'T',
  'T' => 'A',
  _ => default,
};

var len = Int32.Parse(System.Environment.GetCommandLineArgs()[1]);
var sw = Stopwatch.StartNew();
var init = "ACGT";
var end = init[init.Length - 1];
var s = Enumerable.Repeat(init[0], len).ToArray();
var sLast = Enumerable.Repeat(end, len).ToArray();
Int64 counter = 1;
while(!s.SequenceEqual(sLast)) {
  counter++;
  for(var i = 0; i < len; i++) {
    // Console.WriteLine(String.Concat(s));
    var old = s[i];
    s[i] = convert(old);
    if(old != end) {
      break;
    }
  }
}
sw.Stop();
Console.WriteLine("Number of generated k-mers: {0} - took {1}ms", counter, sw.ElapsedMilliseconds);

