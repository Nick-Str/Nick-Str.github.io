pragma solidity ^0.4.18;


import "/Founder.sol";


contract editorHire is Founder {
   
    struct Editor {
        uint id;
        string fName;
        string lName;
        string location;
        string genre;
    }
   
    mapping (address => Editor) editors;
    address[] public editorAccts;
   
    function setEditor(address _editorAddress, uint _id, string _fName, string _lName, string _location, string _genre) public {
        var editor = editors[_editorAddress];
       
        editor.id = _id;
        editor.fName = _fName;
        editor.lName = _lName;
        editor.location=_location;
        editor.genre=_genre;
       
        editorAccts.push(_editorAddress) -1;
    }
   
    function getEditor() view public returns(address[]) {
        return editorAccts;
    }
   
    function getEditor(address _editorAddress) view public returns (uint, string, string,string, string) {
        return (editors[_editorAddress].id, editors[_editorAddress].fName, editors[_editorAddress].lName, editors[_editorAddress].location, editors[_editorAddress].genre);
    }
   
    function countEditor() view public returns (uint) {
        return editorAccts.length;
    }
   
    function deleteEditor(address _editorAddress) public {
        delete editors[_editorAddress];
    }
}
