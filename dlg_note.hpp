class dlg_intel_paper
{
	idd = 5000;
	movingenable = 0;

	class ControlsBackground
	{
		class dlg_pic_paper: RscPicture
		{
			idc = 1200;
			text = "pic\paper_sized.paa";
			x = 3 * GUI_GRID_W + GUI_GRID_X;
			y = 3 * GUI_GRID_H + GUI_GRID_Y;
			w = 34 * GUI_GRID_W;
			h = 19 * GUI_GRID_H;
			colorText[] = {"pic\paper_sized.paa"};
		};	


	};
	
	class Controls
	{
		class dlg_txt_paper: RscText
		{
			idc = 1001;
			text = "Menjual,\n2d Lt untuk $ 200,000\nPFC untuk $ 15.000\nLokasi Quienhammel untuk Kertosudiro\nhari ini di 2 jam";
			x = 0.42 * safezoneW + safezoneX;
			y = 0.335 * safezoneH + safezoneY;
			w = 0.309375 * safezoneW;
			h = 0.33 * safezoneH;
		};		
		class dlg_btn_close: RscButton
		{
			idc = 1600;
			text = "Weglegen";
			x = 30.5 * GUI_GRID_W + GUI_GRID_X;
			y = 22.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 6.5 * GUI_GRID_W;
			h = 1.5 * GUI_GRID_H;
			tooltip = "Weglegen";
			action = "closedialog 0;";
		};	
	};
};


