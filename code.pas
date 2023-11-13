var
  MyForm:TclForm;
  color1Pnl,
  color2Pnl,
  color3Pnl:TclProPanel;
  
  color1Lbl,
  color2Lbl,
  color3Lbl:TclProLabel;
  
  firstColor,
  lastColor:string;
  mainPnlHeight,
  mainPnlWidth:integer;
  formLayout:TclLayout;
  
  Procedure SetupFormLayout;
  begin
     formLayout := MyForm.AddNewLayout(MyForm,'formLayout');
     formLayout.Align:=alContents;
     mainPnlHeight := (formLayout.Height)/3;
     mainPnlWidth := (formLayout.Width)/3;
  end;
  
  function GenerateRandomHexColor: string;
  var
     Red, Green, Blue: Byte;

  begin
     Red := clMath.GenerateRandom(0,256);
     Green := clMath.GenerateRandom(0,256);
     Blue := clMath.GenerateRandom(0,256);
     Result := '#' + IntToHex(Red, 2) + IntToHex(Green, 2) + IntToHex(Blue, 2);
  end;

  Procedure color1PnlOnClick;
  var
     rndmColor:string;

  begin
     rndmColor := GenerateRandomHexColor;
     firstColor := rndmColor;
     MyForm.SetFormColor(firstColor,lastColor,clGVertical);
     clComponent.SetupComponent(color1Pnl,'{"Align" : "Top",
     "Width" :'+IntToStr(mainPnlWidth)+', 
     "Height":'+IntToStr(mainPnlHeight)+',
     "BackgroundColor":"'+rndmColor+'"}');
     color1Lbl.Text := rndmColor; 
     clComponent.SetupComponent(color1Lbl,'{"Align" : 
     "Right","MarginTop":90,"RoundHeight":0,"RoundWidth":0,"BorderColor":"null",
     "BorderWidth":2,"BackgroundColor":"#ffffff","Width" :110, 
     "Height":50,"TextColor":"'+rndmColor+'","TextSize":24,"TextVerticalAlign":"center",
     "TextHorizontalAlign":"center","TextBold":"yes"}');  
  end;

  Procedure color2PnlOnClick;
  var
     rndmColor:string;

  begin
     rndmColor := GenerateRandomHexColor;
     clComponent.SetupComponent(color2Pnl,'{"Align" : "Top",
     "Width" :'+IntToStr(mainPnlWidth)+', 
     "Height":'+IntToStr(mainPnlHeight)+',
     "BackgroundColor":"'+rndmColor+'"}');
     color2Lbl.Text := rndmColor;
     clComponent.SetupComponent(color2Lbl,'{"Align" : 
     "Right","MarginTop":120,"RoundHeight":0,"RoundWidth":0,"BorderColor":"null",
     "BorderWidth":2,"BackgroundColor":"#ffffff","Width" :110, 
     "Height":50,"TextColor":"'+rndmColor+'","TextSize":24,"TextVerticalAlign":"center",
     "TextHorizontalAlign":"center","TextBold":"yes"}');
  end;

  Procedure color3PnlOnClick;
  var
     rndmColor:string;

  begin
     rndmColor := GenerateRandomHexColor;
     lastColor := rndmColor;
     MyForm.SetFormColor(firstColor,lastColor,clGVertical);
     clComponent.SetupComponent(color3Pnl,'{"Align" : "Top",
     "Width" :'+IntToStr(mainPnlWidth)+', 
     "Height":'+IntToStr(mainPnlHeight)+',
     "BackgroundColor":"'+rndmColor+'"}');
     color3Lbl.Text := rndmColor;
     clComponent.SetupComponent(color3Lbl,'{"Align" :  
     "Right","MarginTop":120,"RoundHeight":10,"RoundWidth":10,"BorderColor":"null",
     "BorderWidth":2,"BackgroundColor":"#ffffff","Width" :110, 
     "Height":50,"TextColor":"'+rndmColor+'","TextSize":24,"TextVerticalAlign":"center",
     "TextHorizontalAlign":"center","TextBold":"yes"}');
  end;

  Procedure colorLblOnClick;
  begin
     clUtils.SaveToClipBoard(color1Lbl.Text);
     ShowMessage ('Kopyalandı');
  end;

  Procedure colorLbl2OnClick;
  begin
    clUtils.SaveToClipBoard(color2Lbl.Text);
    ShowMessage ('Kopyalandı');
  end;

  Procedure colorLbl3OnClick;
  begin
    clUtils.SaveToClipBoard(color3Lbl.Text);
    ShowMessage ('Kopyalandı');
  end;
  
begin
  MyForm := TclForm.Create(Self);
  firstColor := '#5e61ff';
  SetupFormLayout;
  color1Pnl:=MyForm.AddNewProPanel(MyForm,'color1Pnl');
  clComponent.SetupComponent(color1Pnl,'{"Align" : "Top",
  "Width" :'+IntToStr(mainPnlWidth)+', 
  "Height":'+IntToStr(mainPnlHeight)+',
  "BackgroundColor":"#5e61ff"}');
  MyForm.AddNewEvent(color1Pnl,tbeOnClick,'color1PnlOnClick');
  
  color1Lbl := MyForm.AddNewProLabel(color1Pnl,'color1Lbl','#5e61ff');
  clComponent.SetupComponent(color1Lbl,'{"Align" :  
  "Right","MarginTop":90,"RoundHeight":0,"RoundWidth":0,"BorderColor":"null","BorderWidth":2,"BackgroundColor":"#ffffff","Width" :110, 
  "Height":50,"TextColor":"#f5428d","TextSize":24,"TextVerticalAlign":"center",
  "TextHorizontalAlign":"center","TextBold":"yes"}');  
  MyForm.AddNewEvent(color1Lbl,tbeOnClick,'colorLblOnClick');
  
  color2Pnl:=MyForm.AddNewProPanel(MyForm,'color2Pnl');
  clComponent.SetupComponent(color2Pnl,'{"Align" : "Top",
  "Width" :'+IntToStr(mainPnlWidth)+', 
  "Height":'+IntToStr(mainPnlHeight)+',
  "BackgroundColor":"#AF1B3F"}');
  MyForm.AddNewEvent(color2Pnl,tbeOnClick,'color2PnlOnClick');
  
  color2Lbl := MyForm.AddNewProLabel(color2Pnl,'color2Lbl','#AF1B3F');
  clComponent.SetupComponent(color2Lbl,'{"Align" : 
  "Right","MarginTop":120,"RoundHeight":10,"RoundWidth":10,"BorderColor":"null","BorderWidth":2,"BackgroundColor":"#ffffff","Width" :110, 
  "Height":50,"TextColor":"#AF1B3F","TextSize":24,"TextVerticalAlign":"center",
  "TextHorizontalAlign":"center","TextBold":"yes"}');
  
  MyForm.AddNewEvent(color2Lbl,tbeOnClick,'colorLbl2OnClick');
  
  color3Pnl:=MyForm.AddNewProPanel(MyForm,'color3Pnl');
  clComponent.SetupComponent(color3Pnl,'{"Align" : "Top",
  "Width" :'+IntToStr(mainPnlWidth)+', 
  "Height":'+IntToStr(mainPnlHeight)+',
  "BackgroundColor":"#01FDF6"}');
  MyForm.AddNewEvent(color3Pnl,tbeOnClick,'color3PnlOnClick');
  lastColor := '#01FDF6';
  
  color3Lbl := MyForm.AddNewProLabel(color3Pnl,'color3Lbl','#01FDF6');
  clComponent.SetupComponent(color3Lbl,'{"Align" : "Right","MarginTop":120,"RoundHeight":10,"RoundWidth":10,"BorderColor":"null",
  "BorderWidth":2,"BackgroundColor":"#ffffff","Width" :110, "Height":50,"TextColor":"#01FDF6","TextSize":24,"TextVerticalAlign":"center",
  "TextHorizontalAlign":"center","TextBold":"yes"}');
  
  MyForm.AddNewEvent(color3Lbl,tbeOnClick,'colorLbl3OnClick');
  
  MyForm.Run;
end;