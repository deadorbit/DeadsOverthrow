OT_ShopStockData = createHashMap;
//For importable items
OT_allShopItems = createHashMap;

private _directory = "\overthrow_main\data\shopstock\";

//name of files with  return data: [shop tag, items for sale]
private _allShopStockData = [
	"general",
	"pharmacy",
	//"electronics",
	//"hardware",
	"surplus"
];

{
	private _key = toUpper(_x);
	private _dir = _directory + _key + ".sqf";
	private _data = call compile preprocessFileLineNumbers _dir;
	
	{
		OT_allShopItems set [_x, true];
		diag_log (_x);
	}foreach(_data);
	
	OT_ShopStockData set [_key, _data];
}foreach(_allShopStockData);