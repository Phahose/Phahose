using System;

namespace ConsoleApp2
{
    class Program
    {
        static void Main(string[] args)
        {
            double adjecentLeangth, oppositeLeanght, hypotenusLeangth;
            
            Console.WriteLine("Enter Adjescent leanght here");
            adjecentLeangth = double.Parse(Console.ReadLine());

            Console.WriteLine("Enter Opposite Leangth Here");
            oppositeLeanght = double.Parse(Console.ReadLine());

            hypotenusLeangth = Math.Sqrt((adjecentLeangth * (adjecentLeangth)) + ( oppositeLeanght * oppositeLeanght));

            Console.WriteLine($"Your Hypotenus Leanght is {hypotenusLeangth}");


        }
    }
}
