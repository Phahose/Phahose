using System;

namespace ConsoleApp3
{
    class Program
    {
        static void Main(string[] args)
        {
            int selection;
            double gateHeight;
            double gateLeangth;
            double fenceLeangth;
            double fenceWidth;
            double typeOfPaint;
            double typeOfFence;
            double fenceArea;
            double paintingPrice;
            double post;
            double fencingPrice;
            double playGroundLeangth;
            double playGroundWidth;
            double distanceBetwweenPosts = 7;
            do
            {
                Console.WriteLine("1.Playground Dimensions -1 \n2.Gate Dimensions -2 \n3.Distance Between Posts -3 \n4.Fence Type -4 \n5.Paint Type -5 \n6.Make a Payslip -6\n7.exit -7\nMake a Selection ");

                selection = int.Parse(Console.ReadLine());
            }
            while (selection == 2);
            { 
                    Console.WriteLine("Enter the Height of your gate here");
                    Console.WriteLine("Enter the Gate leangth Here");
                    gateLeangth = double.Parse(Console.ReadLine());
                    Console.WriteLine("Enter the Leangth of the Fence Here");
                    fenceLeangth = double.Parse(Console.ReadLine());
                    Console.WriteLine("Enter the Width of the fence here");
                    fenceWidth = double.Parse(Console.ReadLine());
            } //end of while 
            if(selection >7)
            { 
            do
            {
                Console.WriteLine("1.Playground Dimensions -1 \n2.Gate Dimensions -2 \n3.Distance Between Posts -3 \n4.Fence Type -4 \n5.Paint Type -5 \n6.Make a Payslip -6\n7.exit -7\nMake a Selection ");

                selection = int.Parse(Console.ReadLine());
            }
            while (selection == 1);
            {

               Console.WriteLine("Playground Leangth:");
               playGroundLeangth = double.Parse(Console.ReadLine());
               Console.WriteLine("Plaayground width:");
               playGroundWidth = double.Parse(Console.ReadLine());
                
             }
          
            do
            {
                Console.WriteLine("1.Playground Dimensions -1 \n2.Gate Dimensions -2 \n3.Distance Between Posts -3 \n4.Fence Type -4 \n5.Paint Type -5 \n6.Make a Payslip -6\n7.exit -7\nMake a Selection ");

                selection = int.Parse(Console.ReadLine());
            }
            while (selection == 3);
            { 

              Console.WriteLine("How many In Between Posts do you have ");
              post = double.Parse(Console.ReadLine());
              Console.WriteLine($"Distance Between Posts:{distanceBetwweenPosts}");
             }
           
            do
            {
                Console.WriteLine("1.Playground Dimensions -1 \n2.Gate Dimensions -2 \n3.Distance Between Posts -3 \n4.Fence Type -4 \n5.Paint Type -5 \n6.Make a Payslip -6\n7.exit -7\nMake a Selection ");

                selection = int.Parse(Console.ReadLine());
            }

            while (selection == 5);
            { 
               Console.WriteLine("What Type of Paint will you Like enter: 1 for basic 2 for Premium And 3 for Deluxe");
               typeOfPaint = double.Parse(Console.ReadLine());
             }
           if (typeOfPaint == 1)
                {
                    typeOfPaint == Console.WriteLine("Basic");
                }
           else if (typeOfPaint ==2)
                {
                    typeOfPaint == Console.WriteLine("Premium");
                }
           else if (typeOfPaint == 3)
                {
                    typeOfPaint == Console.WriteLine("Deluxe");
                }
           else
                {
                    Console.WriteLine("Invalid Input");
                }
            do
            {
                Console.WriteLine("1.Playground Dimensions -1 \n2.Gate Dimensions -2 \n3.Distance Between Posts -3 \n4.Fence Type -4 \n5.Paint Type -5 \n6.Make a Payslip -6\n7.exit -7\nMake a Selection ");

                selection = int.Parse(Console.ReadLine());
            }
            while (selection == 4);
            {
               Console.WriteLine("Enter the type of Fencing you would like enter: 1 for Pressure treated spruce 2 for Cedar and 3 for Chain Link");
               typeOfFence = double.Parse(Console.ReadLine());
            }
                if (typeOfFence == 1)
                {
                    typeOfFence == Console.WriteLine("Spruce");
                }
                else if (typeOfFence == 2)
                {
                    typeOfFence == Console.WriteLine("Cedar");
                }
                else if (typeOfFence == 3)
                {
                    typeOfFence == Console.WriteLine("Chain Link");
                }
                else
                {
                    Console.WriteLine("Invalid Input");
                }

                while (selection == 6) 
                {
                    Console.WriteLine($"Fence leangth:{fenceLeangth,30}            Fencing Price:{fencingPrice,56}");   
                }
         } // end of if
            else
            {
                Console.WriteLine("Invalid Input");
            }

            /*
             Console.WriteLine($"Hello Welcome to RenoCalc Please enter the Gate Height here ");


            
           
             fenceArea = (fenceLeangth * fenceWidth) * 4;
             switch (typeOfPaint)
             {
                 case 1:
                     Console.WriteLine("You have Chosen The Basic paint");
                     paintingPrice = (fenceArea * 11.99);
                     Console.WriteLine($"Your Price is {paintingPrice:N}");
                break;

                 case 2:
                     Console.WriteLine("You have Chosen the Premium paint");
                     paintingPrice = (fenceArea * 15.99);
                     Console.WriteLine($"Your Price is {paintingPrice:N}");
                 break;

                 case 3:
                     Console.WriteLine("You have Chosen the Deluxe paint");
                     paintingPrice = (fenceArea * 19.99);
                     Console.WriteLine($"Your Price is {paintingPrice:N}");
                     break;
                 default:
                     Console.WriteLine("Paint Input:Invalid Input");
                     break;
             }// end of the type of paint switch 
             switch (typeOfFence)
             {
                 case 1:
                     Console.WriteLine("You Have choosen the Pressure treated spruce \nPricing:$4.50 / square foot + $17.20 per post + $0.49 / linear foot of railing");
                     fencingPrice = (fenceArea * 4) * 4.50 + (17.20 * post);
                     Console.WriteLine($"Your Fencing PRice is:${fencingPrice}");
                     break;

                 case 2:
                     Console.WriteLine("You have Choosen Cedar \nPricing:$4.50 / square foot + $17.20 per post + $0.49 / linear foot of railing");
                     fencingPrice = (fenceArea * 4) * 7.75 + (17.20 * post);
                     Console.WriteLine($"Your Fencing PRice is:${fencingPrice}");
                     break;

                 case 3:
                     Console.WriteLine("You have Choosen Chain Link \nPricing:$13.50 / square foot + $50.79 per post + $2.49 / linear foot of railing");
                     fencingPrice = (fenceArea * 4) * 13.50 + (17.20 * post);
                     Console.WriteLine($"Your Fencing PRice is:${fencingPrice}");
                     break;

             }*/

        }// end of methiod 
    }// end of class
}// end of namespace 
