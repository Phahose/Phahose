using System;

namespace ConsoleApp1
{
    class Program
    {
        static void Main(string[] args)
        {
            double leanght;
            double Area;
            double height = 8;
            double Width;
            double windowLeanght;
            double windowBreath;
            double numberOfWindows;
            double totalWindowArea;
            double doorLeangth;
            double doorWidth;
            double numberOfDoors;
            double doorArea;
            double closetWidth;
            double closetLeanght;
            double closetnumber;
            double closetArea;
            double numberofallextras;
            double basic = 29.99;
            double premium = 39.99;
            double deluxe = 49.99;
            double carpet = 2.75;
            double tile = 3.50;
            double Hardwood = 4.85;
            double floorLeanght;
            double floorWidth;
            double floorprice;
            double floorArea;
            double typeOfFloor;
            char T;
            char H;
            char C;
            Console.WriteLine("Enter your Leanght in feet here");
            leanght=double.Parse(Console.ReadLine());
            Console.WriteLine("Enter the value of your width in feet here");
            Width = double.Parse(Console.ReadLine());
            Console.WriteLine("Enter the value of the window Leangth here");
            windowLeanght=double.Parse(Console.ReadLine());
            Console.WriteLine("Enter the breath of your window here");
            windowBreath = double.Parse(Console.ReadLine());
            Console.WriteLine("Enter the Number of windows you have");
            numberOfWindows = double.Parse(Console.ReadLine());
            Console.WriteLine("Enter the leanght of your door in Feet");
            doorLeangth = double.Parse(Console.ReadLine());
            Console.WriteLine("Enter the Width if your door here");
            doorWidth = double.Parse(Console.ReadLine());
            Console.WriteLine("Enter the Number of Doors you have");
            numberOfDoors = double.Parse(Console.ReadLine());
            Console.WriteLine("Enter the Width of your Closet here");
            closetWidth = double.Parse(Console.ReadLine());
            Console.WriteLine("Enter the leanth of your Closet here");
            closetLeanght = double.Parse(Console.ReadLine());
            Console.WriteLine("Enter the number of your Closets here");
            closetnumber = double.Parse(Console.ReadLine());
            Console.WriteLine("Enter the leanght of the Floor Here");
            floorLeanght = double.Parse(Console.ReadLine());
            Console.WriteLine("Enter the Width of the Floor Here");
            floorWidth = double.Parse(Console.ReadLine());
            Console.WriteLine("Enter the type of floor you want here T for tile H for Hard wood and C for carpet");
            if (typeOfFloor=C)
            {
                floorprice = floorArea * carpet;
            }
            if (typeOfFloor=T)
            {
                floorprice = floorArea * tile;
            }
            if (typeOfFloor=H)
            {
                floorprice = floorArea * Hardwood;
            }
            totalWindowArea = (windowBreath * windowLeanght) * numberOfWindows;
            doorArea = (doorLeangth * doorWidth) * numberOfDoors;
            closetArea = (closetLeanght * closetWidth) * closetnumber;
            numberofallextras = totalWindowArea + closetArea + doorArea;
            Area = (leanght * Width * height) - numberofallextras;
            floorArea = floorLeanght * floorWidth;
                if (Area<=300)
            {
                Console.WriteLine($"Area={Area}         Cost= {basic}");

            }
               if (Area<=400)
            {
                Console.WriteLine($"Area= {Area}        Cost= {premium}");
            }
               if (Area<= 500)
            {
                Console.WriteLine($"Area={Area}         Cost= {deluxe}");  
            }
               if (floorArea )



            }
        }   
    }
}
