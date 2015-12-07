package com.docler.chat.message.protobuf;
import protohx.Protohx;
class ReceiveKick extends protohx.Message {

	/** LABEL_REQUIRED room_name : TYPE_STRING = 1 */
	@:isVar public var roomName(get, set):PT_String;
	public inline function setRoomName(value:PT_String):ReceiveKick{
		this.roomName = value;
		return this;
	}

	public function set_roomName(value:PT_String):PT_String{
		return this.roomName = value;
	}

	public function get_roomName():PT_String {
		return this.roomName;
	}

	public function new(){
		super();
		this.roomName = "";
	}

	/** @private */
	override public function writeToBuffer(output:PT_OutputStream):Void {
		protohx.WriteUtils.writeTag(output, protohx.WireType.LENGTH_DELIMITED, 1);
		protohx.WriteUtils.write__TYPE_STRING(output, this.roomName);
		super.writeExtensionOrUnknownFields(output);
	}

	override public function forEachFields(fn:String->Dynamic->Void):Void {
			fn("roomName", this.roomName);
	}

	/** @private */
	override public function readFromSlice(input:PT_InputStream, bytesAfterSlice:PT_UInt):Void {
		var room_name__count:PT_UInt = 0;
		while (hasBytes(input, bytesAfterSlice)) {
			var tag:PT_UInt = protohx.ReadUtils.read__TYPE_UINT32(input);
			switch (tag >> 3) {
			case 1:
				if (room_name__count != 0) {
					throw new PT_IOError('Bad data format: ReceiveKick.roomName cannot be set twice.');
				}
				++room_name__count;
				this.roomName = protohx.ReadUtils.read__TYPE_STRING(input);
			default:
				super.readUnknown(input, tag);
			}
		}
	}

}

