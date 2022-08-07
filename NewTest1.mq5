//+------------------------------------------------------------------+
//|                                                     NewTest1.mq5 |
//|                                  Copyright 2022, MetaQuotes Ltd. |
//|                                            https://www.marty.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2022, MetaQuotes Ltd."
#property link      "https://www.marty.com"
#property version   "1.00"
//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+

#include <Trade\Trade.mqh>

double Balance = AccountInfoDouble(ACCOUNT_BALANCE);
double Profit = AccountInfoDouble(ACCOUNT_PROFIT);
double Equity = AccountInfoDouble(ACCOUNT_EQUITY);



void OnTick()
  {
  
  
   
   //MqlTick latest_price;                  //To be used to get the latest information about prices
   MqlTradeRequest mrequest;              //To be used to send trade requests
   MqlTradeResult mresult;                //To be used to access trade results
   ZeroMemory(mrequest);
   
   mrequest.action=TRADE_ACTION_DEAL;
   //mrequest.price=NormalizeDouble(latest_price.ask,_Digits);
   //mrequest.sl = NormalizeDouble(latest_price.ask-STP,_Digits);
   //mrequest.tp = NormalizeDouble(latest_price.ask+TKP,_Digits);
   mrequest.type = ORDER_TYPE_BUY;
   mrequest.symbol = _Symbol;
   mrequest.volume = 0.01;
   //mrequest.magic = EA_Magic;
   mrequest.price=SymbolInfoDouble(_Symbol,SYMBOL_ASK);
   mrequest.type_filling = ORDER_FILLING_FOK;
   mrequest.tp = 0;
   //mrequest.sl = 20;
   mrequest.deviation = 50;
   
   if(!PositionSelect(_Symbol))
      {
       OrderSend(mrequest,mresult);
      }
      
      
   if((Equity - Balance) > 2)
      {
       CloseAllOrders();
      }
   
  }
  
 void CloseAllOrders()
 {
 
   CTrade trade;
   int i = PositionsTotal() - 1;
   while(i>=0)
      {
        if(trade.PositionClose(PositionGetSymbol(i))) i--;
      }
 
 }
  
  
//+------------------------------------------------------------------+
