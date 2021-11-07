//Ekwom Nicholas
using System;
namespace ConsoleApp8
{
    class Program

    {
        static int GetSafeInteger()
        {
            bool validInput = int.TryParse(Console.ReadLine(), out int userInput);
            while (!validInput)
            {
                Console.Write("Invalid input. Please enter a valid integer: ");
                validInput = int.TryParse(Console.ReadLine(), out userInput);
            } // end of while

            Console.WriteLine();

            return userInput;
        } // end of method
        static void Main(string[] args)
        {
            /*
                Purpose: To Calculate and Print the cost of a packing slip for a playground fence.
                Inputs: Dimensions of a rectangular playground,
                        Height and width of a single gate,
                        Distance between the two posts of the gate,
                        Paint type, Fence material
                Outputs: The netTotal, GST, total price, posts, qts of paint required,
                         number of gates, fence type and railings
                Algorithm:
                Test Plan:
	                Test Case	Test Data	Expected Results
	                ---------	---------	--------------
                Written by: Ekwom Nicholas
                Written for: Cody Schellenberger
                Section No: OA03
                Last modified: 2021 10 27
            */

            // Declaration Of variables
            int selection = 0;
            double gateHeight = 0;
            double gateLeangth = 0;
            double fenceLeangth = 0;
            double fenceWidth = 0;
            string typeOfPaint = "unknown";
            string typeOfFence = "unknown";
            double fenceArea;
            double gatePrice;
            double post = 0;
            double fencingPrice;
            double playGroundLeangth = 0;
            double playGroundWidth = 0;
            double distanceBetwweenPosts = 7;
            double paintPrice = 0;
            double netPrice;
            double totalprice;
            double gateArea;
            double playgroundArea;
            double gst;
            int typePaint;
            int typeFence;
            do
            {

                //User Options
                Console.WriteLine("1.Playground Dimensions -1" +
                    " \n2.Gate Dimensions -2 " +
                    "\n3.Distance Between Posts -3" +
                    " \n4.Fence Type -4 \n5.Paint Type -5 " +
                    "\n6.Make a Payslip -6\n7.exit -7" +
                    "\nMake a Selection ");
                selection = int.Parse(Console.ReadLine());
                switch (selection)
                {   //Playground Dimensions
                    case 1:
                        Console.WriteLine("Playground Leangth:");
                        playGroundLeangth = double.Parse(Console.ReadLine());
                        Console.WriteLine("Playground width:");
                        playGroundWidth = double.Parse(Console.ReadLine());

                        break;
                    // Posts Dimensions
                    case 3:
                       
                        Console.WriteLine("How many In Between Posts do you have ");
                        post = double.Parse(Console.ReadLine());
                        Console.WriteLine($"Distance Between Posts:{distanceBetwweenPosts}");
                        break;
                       // Gate Dimensions
                    case 2:
                        Console.WriteLine("Gate dimensions");
                        Console.WriteLine("Gate Height");
                        gateHeight = double.Parse(Console.ReadLine());
                        Console.WriteLine("Gate Width");
                        gateLeangth = double.Parse(Console.ReadLine());
                        gateArea = gateHeight * gateLeangth;
                        break;
                        //Type of fence
                    case 4:
                        while (!int.TryParse(Console.ReadLine(), out typeFence) || typeFence < 1 || typeFence > 3) ;
                            Console.WriteLine("Enter the type of Fencing you would like Pressure treated spruce  Cedar or Chain Link 1 , 2, or 3");
                        typeFence = int.Parse((Console.ReadLine()));
                        break;
                        // Type Of Paint
                    case 5:
                        while (!int.TryParse(Console.ReadLine(), out typePaint) || typePaint< 1 || typePaint > 3) ;
                        Console.WriteLine("What Type of Paint will you Like enter basic Premium or Deluxe 1 ,2 or 3");
                        typePaint =int.Parse(Console.ReadLine());//.ToUpper();
                        break;

                    case 6:
                        //packing slip
                        gateArea = gateHeight * gateLeangth;
                        playgroundArea = playGroundLeangth * playGroundWidth;
                        fenceArea = (fenceLeangth * fenceWidth) * 4;
                        typePaint = 0;
                        Console.WriteLine("What Type of Paint will you Like enter basic Premium or Deluxe 1 ,2 or 3");
                        typePaint = int.Parse(Console.ReadLine());//.ToUpper();
                        switch (typePaint)// type of paint switch
                        {
                            case 1:
                                paintPrice = 11.99;
                            typeOfPaint = "BASIC";
                                break;

                            case 2:
                                paintPrice = 19.99;
                                typeOfPaint = "DELUXE";
                                break;

                            case 4:

                                paintPrice = 15.99;
                                typeOfPaint = "PREMIUM";

                                break;
                        } // end of switch

                        Console.WriteLine("Enter the type of Fencing you would like Pressure treated spruce  Cedar or Chain Link 1,2 0r 3");
                        
                        typeFence = int.Parse((Console.ReadLine()));
                        switch (typeFence)// type of fence switch
                        {
                            case 1:
                                fencingPrice = 4.50;
                                // totalprice = fencingPrice + paintPrice;
                                typeOfFence = "SPRUCE";
                                gatePrice = gateArea * (120 + 15.75);
                                netPrice = ((fencingPrice) * fenceArea + (paintPrice) * fenceArea) + (gateArea * (120 + 15.75));
                                gst = 0.05 * netPrice;
                                totalprice = netPrice + gst;
                                Console.WriteLine($"Fence leangth:{playGroundLeangth,10}^ft     Type:{typeOfFence,12}      Type of paint:{typeOfPaint,3}  @ {paintPrice}");
                                Console.WriteLine($"Fence Height:{fenceLeangth,11}^ft     Type:{typeOfFence,12}      Type Of Paint:{typeOfPaint,3}  @ {fencingPrice}");
                                Console.WriteLine($"Gate Height:{gateHeight,12}^ft");
                                Console.WriteLine($"Gate Width:{gateLeangth,13}^ft     Price:{gatePrice,10}$      Type of Gate:ChainLink");
                                Console.WriteLine($"type of Fence: {typeOfFence,9}^ft     Price:{fencingPrice,10}$");
                                Console.WriteLine($"TYPE OF Paint: {typeOfPaint,9}^ft     Price:{paintPrice,10}$");
                                Console.WriteLine($"Net Price:{netPrice,16}$");
                                Console.WriteLine($"Total Price:{totalprice,14}$");
                                Console.WriteLine($"GST:{gst,22}$");
                                Console.WriteLine($"                                                                                   ");
                                break;

                            case 2:
                                fencingPrice = 7.50;
                                //totalprice = (fencingPrice + paintPrice)+0.1*totalprice;
                                typeOfFence = "CEDAR";
                                gatePrice = gateArea * (120 + 15.75);
                                netPrice = ((fencingPrice) * fenceArea + (paintPrice) * fenceArea) + (gateArea * (120 + 15.75));
                                gst = 0.05 * netPrice;
                                totalprice = netPrice + gst;
                                Console.WriteLine($"Fence leangth:{playGroundLeangth,10}^ft     Type:{typeOfFence,12}      Type of paint:{typeOfPaint,3}  @ {paintPrice}");
                                Console.WriteLine($"Fence Height:{fenceLeangth,11}^ft     Type:{typeOfFence,12}      Type Of Paint:{typeOfPaint,3}  @ {fencingPrice}");
                                Console.WriteLine($"Gate Height:{gateHeight,12}^ft");
                                Console.WriteLine($"Gate Width:{gateLeangth,13}^ft     Price:{gatePrice,10}$      Type of Gate:ChainLink");
                                Console.WriteLine($"type of Fence: {typeOfFence,9}^ft     Price:{fencingPrice,10}$");
                                Console.WriteLine($"TYPE OF Paint: {typeOfPaint,9}^ft     Price:{paintPrice,10}$");
                                Console.WriteLine($"Net Price:{netPrice,16}$");
                                Console.WriteLine($"Total Price:{totalprice,14}$");
                                Console.WriteLine($"GST:{gst,22}$");
                                Console.WriteLine($"                                                                                   ");
                                break;

                            case 3:
                                fencingPrice = 13.50;
                                // totalprice = (fencingPrice + paintPrice) + 0.1 * totalprice;
                                typeOfFence = "CHAIN LINK";
                                gatePrice = gateArea * (120 + 15.75);
                                netPrice = ((fencingPrice) * fenceArea + (paintPrice) * fenceArea) + (gateArea * (120 + 15.75));
                                gst = 0.05 * netPrice;
                                totalprice = netPrice + gst;
                                Console.WriteLine($"Fence leangth:{playGroundLeangth,10}^ft     Type:{typeOfFence,12}      Type of paint:{typeOfPaint,3}  @ {paintPrice}");
                                Console.WriteLine($"Fence Height:{fenceLeangth,11}^ft     Type:{typeOfFence,12}      Type Of Paint:{typeOfPaint,3}  @ {fencingPrice}");
                                Console.WriteLine($"Gate Height:{gateHeight,12}^ft");
                                Console.WriteLine($"Gate Width:{gateLeangth,13}^ft     Price:{gatePrice,10}$      Type of Gate:ChainLink");
                                Console.WriteLine($"type of Fence: {typeOfFence,9}^ft     Price:{fencingPrice,10}$");
                                Console.WriteLine($"TYPE OF Paint: {typeOfPaint,9}^ft     Price:{paintPrice,10}$");
                                Console.WriteLine($"Net Price:{netPrice,16}$");
                                Console.WriteLine($"Total Price:{totalprice,14}$");
                                Console.WriteLine($"GST:{gst,22}$");
                                Console.WriteLine($"                                                                                   ");
                                break;
                        } // end of switch                                                                   
                      break;

                    case 7:
                        Console.WriteLine("Thank you Goodbye");
                        break;
                    default:
                        do
                        {
                            Console.WriteLine(" Invalid Menu Choice Please Try again");
                            Console.WriteLine("1.Playground Dimensions -1" +
                      " \n2.Gate Dimensions -2 " +
                      "\n3.Distance Between Posts -3" +
                      " \n4.Fence Type -4 \n5.Paint Type -5 " +
                      "\n6.Make a Payslip -6\n7.exit -7" +
                      "\nMake a Selection ");
                            selection = int.Parse(Console.ReadLine());
                        } while (selection > 7);
                        
                        break;

                }// end of switch             
            }// end of do
            while (selection < 7);
          
           
        } // end of Method
    }// end of class
}// end of namespace 







