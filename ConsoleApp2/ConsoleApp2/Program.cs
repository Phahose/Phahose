using System;

namespace ConsoleApp2
{
    class Program
    {
        static void Main(string[] args)
        {
            /*decare all the datatypes
             * user inputs the his mesurements 
             * calculate the area of one windowq
             * Multiply by the number of windows in the rooom
             * calucate theSrea of the walls 
             * Muktiply by the number of walls in Each room
             * Multipy the Are by the type of Paint needed
             * Calculate the Floor Area
             * Make them Chhos The flloring price
             * tell them the type of flooring theyll get for that price
             * Calculate the Foorimg Price 
             * calculate the Total Area 
             * Since there were no discounts the net price = the total Price
             * Calculate the atotal GST
             */
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
            double priceofFlooring;
            double numberOfWaals;
            double netPrice;
            double totalprice;
            double totalGST;
            double paintprice;
            double baseboardprice;
            double baseboardcasing;
            Console.WriteLine("Enter the value of your room width in feet here");
            Width = double.Parse(Console.ReadLine());
            Console.WriteLine("Enter the value of the window Leangth here");
            windowLeanght = double.Parse(Console.ReadLine());
            Console.WriteLine("Enter the breath of your window here");
            windowBreath = double.Parse(Console.ReadLine());
            Console.WriteLine("Enter the number of Waals Here");
            numberOfWaals = double.Parse(Console.ReadLine());
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
            Console.WriteLine("Enter the price of flooring here " +
                "$2.75  $3.50   or $4.80");
            priceofFlooring = double.Parse(Console.ReadLine());
            Console.WriteLine("Enter your Baseboard Price here ");
            baseboardprice = double.Parse(Console.ReadLine());
            baseboardcasing = double.Parse(Console.ReadLine());
            Console.WriteLine("Enter your Casing price here ");
            totalWindowArea = (windowBreath * windowLeanght) * numberOfWindows;
            doorArea = (doorLeangth * doorWidth) * numberOfDoors;
            closetArea = (closetLeanght * closetWidth) * closetnumber;
            numberofallextras = totalWindowArea + closetArea + doorArea;
            Area = (height * Width * numberOfWaals) - numberofallextras;
            floorArea = floorLeanght * floorWidth;
            if (Area > 0)
            {
                switch (Area)
                {
                    case <= 300:
                        {
                            Console.WriteLine($"Amount of Paint={Area}         Cost= {basic}");
                            paintprice = Area * basic;
                        }
                        break;
                    case <= 400:
                        {
                            Console.WriteLine($"Amount Of Paint = {Area}        Cost= {premium}");
                            paintprice = Area * premium;

                        }
                        break;
                    case <= 500:
                        {
                            Console.WriteLine($"Amount of Paint={Area}         Cost= {deluxe}");
                            paintprice = Area * deluxe;

                        }
                        break;

                    default:
                        {
                            Console.WriteLine($"Amount of Paint={Area}         Cost= {deluxe}");
                            paintprice = Area * deluxe;
                        }
                        break;

                }
            }
            else
            {
                Console.WriteLine("Invalid Units");
            }
            if (priceofFlooring == 2.75)
            {
                floorprice = floorArea * tile;
                Console.WriteLine($"Floor type = Tile       Flooring Price= {floorprice}");
            }
            else if (priceofFlooring == 3.50)
            {
                floorprice = floorArea * carpet;
                Console.WriteLine($"Floor type =Carpet       Flooring Price = {floorprice}");
            }

            else if (priceofFlooring == 4.80)
            {
                floorprice = floorArea * Hardwood;
                Console.WriteLine($"Floor type = Hardwood      Flooring Price = {floorprice}");

            }
            else
            {
                Console.WriteLine("Invalid Amount");
            }
            floorprice = floorArea * priceofFlooring;
            if (Area <= 300)
            {
                paintprice = Area * basic;
                totalprice = floorprice + paintprice;
                Console.WriteLine($"TotalPrice={totalprice:N2}");
                netPrice = floorprice + paintprice;
                Console.WriteLine($"NetPrice={netPrice:N2}");
                totalGST = totalprice + (totalprice * 0.05);
                Console.WriteLine($"Total GST={Math.Round(totalGST, 2)}");
                baseboardprice = (baseboardprice * 0.01) + baseboardprice;
                Console.WriteLine($"Baseboard Price={baseboardprice:N2}");
                baseboardcasing = (baseboardcasing * 0.01) + baseboardcasing;
                Console.WriteLine($"Casing Price={baseboardcasing:N2}");
                Console.WriteLine($"RoomLeanght={height}" +
                                 $"Room Width={Width}" +
                                 $"Room Area={Area}" +
                                 $"Floor Leanght={floorLeanght}" +
                                 $"Floor Width[={floorWidth}" +
                                 $"Floor Area={floorArea}" +
                                 $"Floor Price={floorprice}");
            }
            if (Area <= 400)
            {
              
                paintprice = Area * premium;
                totalprice = floorprice + paintprice;
                Console.WriteLine($"TotalPrice={totalprice:N2}");
                netPrice = floorprice + paintprice;
                Console.WriteLine($"NetPrice={netPrice:N2}");
                totalGST = totalprice + (totalprice * 0.05);
                Console.WriteLine($"Total GST={Math.Round(totalGST, 2)}");
                baseboardprice = (baseboardprice * 0.01) + baseboardprice;
                Console.WriteLine($"Baseboard Price={baseboardprice:N2}");
                baseboardcasing = (baseboardcasing * 0.01) + baseboardcasing;
                Console.WriteLine($"Casing Price={baseboardcasing:N2}");
                Console.WriteLine($"RoomLeanght={height}" +
                                 $"Room Width={Width}" +
                                 $"Room Area={Area}" +
                                 $"Floor Leanght={floorLeanght}" +
                                 $"Floor Width[={floorWidth}" +
                                 $"Floor Area={floorArea}" +
                                 $"Floor Price={floorprice}");
            }
            if (Area <= 500)
            {
                paintprice = Area * deluxe;
                totalprice = floorprice + paintprice;
                Console.WriteLine($"TotalPrice={totalprice:N2}");
                netPrice = floorprice + paintprice;
                Console.WriteLine($"NetPrice={netPrice:N2}");
                totalGST = totalprice + (totalprice * 0.05);
                Console.WriteLine($"Total GST={Math.Round(totalGST, 2)}");
                baseboardprice = (baseboardprice * 0.01) + baseboardprice;
                Console.WriteLine($"Baseboard Price={baseboardprice:N2}");
                baseboardcasing = (baseboardcasing * 0.01) + baseboardcasing;
                Console.WriteLine($"Casing Price={baseboardcasing:N2}");
                Console.WriteLine($"RoomLeanght={height}" +
                                  $"Room Width={Width}" +
                                  $"Room Area={Area}" +
                                  $"Floor Leanght={floorLeanght}" +
                                  $"Floor Width[={floorWidth}" +
                                  $"Floor Area={floorArea}" +
                                  $"Floor Price={floorprice}");
            }
            else
            {
                Console.WriteLine("Not Availaible");

            }//end of if else


        }// end of String
    }//end of clas
}
