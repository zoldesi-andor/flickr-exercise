package com.docler.chat.message.protobuf;
import protohx.Protohx;
class ReceiveRoomMessage extends protohx.Message {

	/** LABEL_REQUIRED room_name : TYPE_STRING = 1 */
	@:isVar public var roomName(get, set):PT_String;
	public inline function setRoomName(value:PT_String):ReceiveRoomMessage{
		this.roomName = value;
		return this;
	}

	public function set_roomName(value:PT_String):PT_String{
		return this.roomName = value;
	}

	public function get_roomName():PT_String {
		return this.roomName;
	}


	/** LABEL_REQUIRED from : TYPE_STRING = 2 */
	@:isVar public var from(get, set):PT_String;
	public inline function setFrom(value:PT_String):ReceiveRoomMessage{
		this.from = value;
		return this;
	}

	public function set_from(value:PT_String):PT_String{
		return this.from = value;
	}

	public function get_from():PT_String {
		return this.from;
	}


	/** LABEL_REQUIRED message : TYPE_STRING = 3 */
	@:isVar public var message(get, set):PT_String;
	public inline function setMessage(value:PT_String):ReceiveRoomMessage{
		this.message = value;
		return this;
	}

	public function set_message(value:PT_String):PT_String{
		return this.message = value;
	}

	public function get_message():PT_String {
		return this.message;
	}

	public function new(){
		super();
		this.roomName = "";
		this.from = "";
		this.message = "";
	}

	/** @private */
	override public function writeToBuffer(output:PT_OutputStream):Void {
		protohx.WriteUtils.writeTag(output, protohx.WireType.LENGTH_DELIMITED, 1);
		protohx.WriteUtils.write__TYPE_STRING(output, this.roomName);
		protohx.WriteUtils.writeTag(output, protohx.WireType.LENGTH_DELIMITED, 2);
		protohx.WriteUtils.write__TYPE_STRING(output, this.from);
		protohx.WriteUtils.writeTag(output, protohx.WireType.LENGTH_DELIMITED, 3);
		protohx.WriteUtils.write__TYPE_STRING(output, this.message);
		super.writeExtensionOrUnknownFields(output);
	}

	override public function forEachFields(fn:String->Dynamic->Void):Void {
			fn("roomName", this.roomName);
			fn("from", this.from);
			fn("message", this.message);
	}

	/** @private */
	override public function readFromSlice(input:PT_InputStream, bytesAfterSlice:PT_UInt):Void {
		var room_name__count:PT_UInt = 0;
		var from__count:PT_UInt = 0;
		var message__count:PT_UInt = 0;
		while (hasBytes(input, bytesAfterSlice)) {
			var tag:PT_UInt = protohx.ReadUtils.read__TYPE_UINT32(input);
			switch (tag >> 3) {
			case 1:
				if (room_name__count != 0) {
					throw new PT_IOError('Bad data format: ReceiveRoomMessage.roomName cannot be set twice.');
				}
				++room_name__count;
				this.roomName = protohx.ReadUtils.read__TYPE_STRING(input);
			case 2:
				if (from__count != 0) {
					throw new PT_IOError('Bad data format: ReceiveRoomMessage.from cannot be set twice.');
				}
				++from__count;
				this.from = protohx.ReadUtils.read__TYPE_STRING(input);
			case 3:
				if (message__count != 0) {
					throw new PT_IOError('Bad data format: ReceiveRoomMessage.message cannot be set twice.');
				}
				++message__count;
				this.message = protohx.ReadUtils.read__TYPE_STRING(input);
			default:
				super.readUnknown(input, tag);
			}
		}
	}

}

