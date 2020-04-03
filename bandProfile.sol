pragma solidity ^0.4.18;

import "/bandowner.sol";
// import "onlyOwner"


contract bandProfile is bandOwner{
   
    struct Band {
        uint id;
        string bandName;
        // string- formed at what year - timestamp?
        string bio;
        string location;
        string genre;
        uint members;
    }
    mapping (address => Band) bandprofile;
    address[] public bandAccts;
   
      function setBand(address  _bandAddress, uint _id, string _bandName, string _bio, string _location, string _genre) public isbandOwner {
        var band = bandprofile[_bandAddress];
       
        band.id = _id;
        band.bandName = _bandName;
        band.bio = _bio;
        band.location=_location;
        band.genre=_genre;
       
        bandAccts.push(_bandAddress) -1;
    }
   
    function getBand() view public returns(address[]) {
        return bandAccts;
    }
   
    function getBand(address _bandAddress) view public returns (uint, string, string,string, string) {
        return (bandprofile[_bandAddress].id, bandprofile[_bandAddress].bandName, bandprofile[_bandAddress].bio, bandprofile[_bandAddress].location, bandprofile[_bandAddress].genre);
    }
   
    function deleteband(address _bandAddress) public {
        delete bandprofile[_bandAddress];
    }
   
                        //ADDING BAND MEMEBRS
   
   struct addbandMembers{ // adding a member only with generated QR code
                          // created only by the bandleader- like MEOW wallet
       uint idNumber;
       string fName;
       string lName;
       string instrument;
       string JoinedtheBandat;
   }
   
    mapping ( uint => addbandMembers) memberprofile;
    uint[] public bandMembers;
   
   function setMembers(uint _index,uint _idNumber, string _fName, string _lName, string _instrument, string _JoinedtheBandat) public isbandOwner{
        var member= memberprofile[_index];
       
        member.idNumber=_idNumber;
        member.fName = _fName;
        member.lName = _lName;
        member.instrument=_instrument;
        member.JoinedtheBandat=_JoinedtheBandat;
       
        bandMembers.push(_index) -1;
    }
   
   function getMembers(uint _index) view public returns (uint, string,string,string, string) {
        return (memberprofile[_index].idNumber, memberprofile[_index].fName, memberprofile[_index].lName, memberprofile[_index].instrument, memberprofile[_index].JoinedtheBandat);
    }
   
    function bandMembers() view public returns (uint) {
        return bandMembers.length;
    }
   
     function deleteMember(uint _idNumber) public {
        delete bandMembers[_idNumber];
    }
   
   
}
