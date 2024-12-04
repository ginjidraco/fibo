﻿using System.Diagnostics;
using Demo.Fibo;

var stopwatch = new Stopwatch();
stopwatch.Start();
var results = await Fibonacci.RunAsync(args);
stopwatch.Stop();
Console.WriteLine($"Elapsed time: {stopwatch.ElapsedMilliseconds}ms");
foreach (var result in results)
{
    Console.WriteLine($"Fibonacci of {result.Result} is {result.Result}");
}