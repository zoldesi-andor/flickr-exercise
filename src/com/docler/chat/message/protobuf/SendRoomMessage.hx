package com.docler.chat.message.protobuf;
import protohx.Protohx;
class SendRoomMessage extends protohx.Message {

	/** LABEL_REQUIRED host : TYPE_STRING = 1 */
	@:isVar public var host(get, set):PT_String;
	public inline function setHost(value:PT_String):SendRoomMessage{
		this.host = value;
		return this;
	}

	public function set_host(value:PT_String):PT_String{
		return this.host = value;
	}

	public function get_host():PT_String {
		return this.host;
	}


	/** LABEL_REQUIRED room_name : TYPE_STRING = 2 */
	@:isVar public var roomName(get, set):PT_String;
	public inline function setRoomName(value:PT_String):SendRoomMessage{
		this.roomName = value;
		return this;
	}

	public function set_roomName(value:PT_String):PT_String{
		return this.roomName = value;
	}

	public function get_roomName():PT_String {
		return this.roomName;
	}


	/** LABEL_REQUIRED message : TYPE_STRING = 3 */
	@:isVar public var message(get, set):PT_String;
	public inline function setMessage(value:PT_String):SendRoomMessage{
		this.message = value;
		return this;
	}

	public function set_message(value:PT_String):PT_String{
		return this.message = value;
	}

	public function get_message():PT_String {
		return this.message;
	}


	/** LABEL_REQUIRED message_id : TYPE_STRING = 4 */
	@:isVar public var messageId(get, set):PT_String;
	public inline function setMessageId(value:PT_String):SendRoomMessage{
		this.messageId = value;
		return this;
	}

	public function set_messageId(value:PT_String):PT_String{
		return this.messageId = value;
	}

	public function get_messageId():PT_String {
		return this.messageId;
	}

	public function new(){
		super();
		this.host = "";
		this.roomName = "";
		this.message = "";
		this.messageId = "";
	}

	/** @private */
	override public function writeToBuffer(output:PT_OutputStream):Void {
		protohx.WriteUtils.writeTag(output, protohx.WireType.LENGTH_DELIMITED, 1);
		protohx.WriteUtils.write__TYPE_STRING(output, this.host);
		protohx.WriteUtils.writeTag(output, protohx.WireType.LENGTH_DELIMITED, 2);
		protohx.WriteUtils.write__TYPE_STRING(output, this.roomName);
		protohx.WriteUtils.writeTag(output, protohx.WireType.LENGTH_DELIMITED, 3);
		protohx.WriteUtils.write__TYPE_STRING(output, this.message);
		protohx.WriteUtils.writeTag(output, protohx.WireType.LENGTH_DELIMITED, 4);
		protohx.WriteUtils.write__TYPE_STRING(output, this.messageId);
		super.writeExtensionOrUnknownFields(output);
	}

	override public function forEachFields(fn:String->Dynamic->Void):Void {
			fn("host", this.host);
			fn("roomName", this.roomName);
			fn("message", this.message);
			fn("messageId", this.messageId);
	}

	/** @private */
	override public function readFromSlice(input:PT_InputStream, bytesAfterSlice:PT_UInt):Void {
		var host__count:PT_UInt = 0;
		var room_name__count:PT_UInt = 0;
		var message__count:PT_UInt = 0;
		var message_id__count:PT_UInt = 0;
		while (hasBytes(input, bytesAfterSlice)) {
			var tag:PT_UInt = protohx.ReadUtils.read__TYPE_UINT32(input);
			switch (tag >> 3) {
			case 1:
				if (host__count != 0) {
					throw new PT_IOError('Bad data format: SendRoomMessage.host cannot be set twice.');
				}
				++host__count;
				this.host = protohx.ReadUtils.read__TYPE_STRING(input);
			case 2:
				if (room_name__count != 0) {
					throw new PT_IOError('Bad data format: SendRoomMessage.roomName cannot be set twice.');
				}
				++room_name__count;
				this.roomName = protohx.ReadUtils.read__TYPE_STRING(input);
			case 3:
				if (message__count != 0) {
					throw new PT_IOError('Bad data format: SendRoomMessage.message cannot be set twice.');
				}
				++message__count;
				this.message = protohx.ReadUtils.read__TYPE_STRING(input);
			case 4:
				if (message_id__count != 0) {
					throw new PT_IOError('Bad data format: SendRoomMessage.messageId cannot be set twice.');
				}
				++message_id__count;
				this.messageId = protohx.ReadUtils.read__TYPE_STRING(input);
			default:
				super.readUnknown(input, tag);
			}
		}
	}

}

