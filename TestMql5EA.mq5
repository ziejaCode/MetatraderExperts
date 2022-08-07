#include<Trade\Trade.mqh>
CTrade trade;

 

void OnTick()
  {
   
   
   // Get the ask price
   double Ask = NormalizeDouble(SymbolInfoDouble(_Symbol, SYMBOL_ASK),_Digits);
   
   // Get the account balance
   double Balance = AccountInfoDouble(ACCOUNT_BALANCE);
   
   // Get the account equity
   double Equity = AccountInfoDouble(ACCOUNT_EQUITY);
   
   // test 1 
   //Comment(Ask, " - ",Balance, " - ",Equity);
   
   // if equity and balance are equil and no order exists
   if(Balance==Equity && OrdersTotal()==0){
      // buy stop 10 microlots 100 above ask price 
      // - no StopLoss 30 points Take Profit no comments, exparation time, date
      trade.BuyStop(0.10,Ask+100*_Point,_Symbol,0,Ask+300*_Point,ORDER_TIME_GTC,0,0);
   }
   
   }