﻿import mx.utils.Delegate;class com.script{	public static var mainButtonImages:Array = new Array("empty");	public static var xmlImages:XML = new XML();	function script()	{		loadSettingMenu();		loadMainButton();		//createContainer();	}	function createContainer()	{		_root.attachMovie("main_container","main_container",_root.getNextHighestDepth());		_root.main_container._x = 31;		_root.main_container._y = 73;	}	//membuat menu setting	function loadSettingMenu():Void	{		//setting nama-nama button utama		var nama_btn:Array = new Array("bantuan", "pengaturan", "keluar");		for (var i:Number = 0; i < 3; i++)		{			var mc_name:String = "sb_" + i;			_root.attachMovie("settings_button",mc_name,_root.getNextHighestDepth());			//set namanya			_root[mc_name].text_button_w.text = nama_btn[i];			_root[mc_name]._x = 110 * i + 15;			_root[mc_name]._y = 40;			//play movie rollover			_root[mc_name].onRollOver = function()			{				this.play();			};			//play movie rollout			_root[mc_name].onRollOut = function()			{				this.gotoAndStop(1);			};		}		//bantuan		_root.sb_0.onPress = function()		{			trace("bantuan");		};		//pengaturan		_root.sb_1.onPress = function()		{			trace("pengaturan");		};		//keluar		_root.sb_2.onPress = function()		{			trace("keluar");			fscommand("quit", "true");		};	}	function loadMainButton():Void	{		//load the xml file		var myXML:XML = new XML();		myXML.ignoreWhite = true;		myXML.onLoad = function(succeed)		{			if (succeed)			{				var nama_btn:Array = new Array();				var gambar_btn:Array = new Array();				var myXMLChildNodes = this.firstChild.firstChild.childNodes;				for (var i:Number = 0; i < myXMLChildNodes.length; i++)				{					//push the names of button					nama_btn.push(myXMLChildNodes[i].attributes.nodename);					//push the images of button					gambar_btn.push(myXMLChildNodes[i].attributes.image);				}				var i:Number = 0;				var j:Number = 0;				var counter:Number = 0;//mengakses button ke x				var globalMainButtonY:Number = 125;				var globalMainButtonX:Number = 70;				//bagian kiri				for (i = 0; i < 2; i++)				{					for (j = 0; j < 2; j++)					{						//mb = main button						var mcName:String = "mb_" + counter;						//buttonType						//1 : long						//2 : short						_root.attachMovie("main_button",mcName,_root.getNextHighestDepth());						_root[mcName]._x = (j * 136) + globalMainButtonX;						_root[mcName]._y = i * 172 + globalMainButtonY;						_root[mcName].text_button_w = nama_btn[counter];						//add the image						_root[mcName].imageContainer.loadMovie(gambar_btn[counter]);						//buttonType						_root[mcName].gotoAndStop(1);						counter++;					}				}				//bagian kanan				for (i = 0; i < 3; i++)				{					var mcName:String = "mb_" + counter;					//buttonType					//1 : long					//2 : short					_root.attachMovie("main_button",mcName,_root.getNextHighestDepth());					_root[mcName]._x = globalMainButtonX + 270;					_root[mcName]._y = i * 115 + globalMainButtonY;					_root[mcName].text_button_w = nama_btn[counter];					//add the image					_root[mcName].imageContainer.loadMovie(gambar_btn[counter]);					//buttonType					_root[mcName].gotoAndStop(2);					counter++;				}				//ilkom stuff				_root.mb_0.onRelease = function()				{					trace("_ilkom");					//menandakan menu apa yang sedang diakses					_root.currentMenu = "ilkom";					//mengakses target xml untuk isi dari target					_root.XMLTarget = "assets/prodi/ilkom/ilkom.xml";					_root.main_container.loadMovie("assets/container/container_a.swf");					//remove the button					for (var i:Number = 0; i <= 6; i++)					{						_root["mb_" + i]._visible = false;					}				};				//p.ilkom stuff				_root.mb_1.onRelease = function()				{					trace("_p.ilkom");					//menandakan menu apa yang sedang diakses					_root.currentMenu = "pilkom";					//mengakses target xml untuk isi dari target					_root.XMLTarget = "assets/prodi/p_ilkom/p_ilkom.xml";					_root.main_container.loadMovie("assets/container/container_a.swf");					//remove the button					for (var i:Number = 0; i <= 6; i++)					{						_root["mb_" + i]._visible = false;					}				};				//staff stuff				_root.mb_2.onRelease = function()				{					trace("staff");					//menandakan menu apa yang sedang diakses					_root.currentMenu = "staff";					//mengakses target xml untuk isi dari target					_root.XMLTarget = "assets/staff/staff.xml";					_root.main_container.loadMovie("assets/container/container_b.swf");					//remove the button					for (var i:Number = 0; i <= 6; i++)					{						_root["mb_" + i]._visible = false;					}				};				//fasilitas stuff				_root.mb_3.onRelease = function()				{					trace("fasilitas");					//menandakan menu apa yang sedang diakses					_root.currentMenu = "fasilitas";					//mengakses target xml untuk isi dari target					_root.XMLTarget = "assets/fasilitas/fasilitas.xml";					trace("the target of XML " + _root.XMLTarget);					_root.main_container.loadMovie("assets/container/container_b.swf");					//_root.main_container.loadMovie("assets/staff/staff_container.swf");					//remove the button					for (var i:Number = 0; i <= 6; i++)					{						_root["mb_" + i]._visible = false;					}				};				//video profil stuff				_root.mb_4.onRelease = function()				{					trace("video profil");					//menandakan menu apa yang sedang diakses					_root.currentMenu = "video profil";					//mengakses target xml untuk isi dari target					//_root.XMLTarget = "assets/kemahasiswaan/kemahasiswaan/kemahasiswaan.xml";					_root.main_container.loadMovie("assets/container/video_container.swf");					//remove the button					for (var i:Number = 0; i <= 6; i++)					{						_root["mb_" + i]._visible = false;					}				};				//kemahasiswaan stuff				_root.mb_5.onRelease = function()				{					trace("kemahasiswaan");					//menandakan menu apa yang sedang diakses					_root.currentMenu = "kemahasiswaan";					//mengakses target xml untuk isi dari target					_root.XMLTarget = "assets/kemahasiswaan/kemahasiswaan/kemahasiswaan.xml";					_root.main_container.loadMovie("assets/container/container_a.swf");					//remove the button					for (var i:Number = 0; i <= 6; i++)					{						_root["mb_" + i]._visible = false;					}				};				//galeri stuff				_root.mb_6.onRelease = function()				{					trace("kontak");					//menandakan menu apa yang sedang diakses					_root.currentMenu = "kontak";					//mengakses target xml untuk isi dari target					_root.XMLTarget = "assets/kontak/kontak/kontak.xml";					_root.main_container.loadMovie("assets/container/container_a.swf");					//remove the button					for (var i:Number = 0; i <= 6; i++)					{						_root["mb_" + i]._visible = false;					}				};			}			else			{				trace("error in loading xml for main menu");			}		};		myXML.load("assets/main_menu/main_menu.xml");		//actions for buttons	}	function moveMainButtonOut()	{		var speed:Number = 5;		trace("moveMainButtonOut working");		for (var i:Number = 1; i <= 6; i++)		{			_root["mb_" + i]._x -= speed;			trace("nguik");		}	}}