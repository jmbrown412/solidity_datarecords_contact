pragma solidity ^0.4.4;

contract DataRecords {

    mapping (bytes32=>Data[]) private _records;

    struct Data{
        string name;
        string description;
        string value;
    }

    function StoreRecord(bytes32 key, string name, string description, string value) public returns (uint256 result) {
        var record = Data(name, description, value);
        return _records[key].push(record);
    }

    function GetRecord(bytes32 key, uint256 index) public view returns (string name, string description, string value) {
        if (RecordExists(key, index))
        {
            return(
                _records[key][index].name,
                _records[key][index].description,
                _records[key][index].value
            );
        }
        revert();
    }

    function RecordExists(bytes32 key, uint256 index) private view returns (bool exists) {
        return _records[key].length >= index;
    } 
}