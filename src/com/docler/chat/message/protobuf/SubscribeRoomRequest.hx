package com.docler.chat.message.protobuf;
import protohx.Protohx;
class SubscribeRoomRequest extends protohx.Message {

	/** LABEL_REQUIRED host : TYPE_STRING = 1 */
	@:isVar public var host(get, set):PT_String;
	public inline function setHost(value:PT_String):SubscribeRoomRequest{
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
	public inline function setRoomName(value:PT_String):SubscribeRoomRequest{
		this.roomName = value;
		return this;
	}

	public function set_roomName(value:PT_String):PT_String{
		return this.roomName = value;
	}

	public function get_roomName():PT_String {
		return this.roomName;
	}


	/** LABEL_REQUIRED message_id : TYPE_STRING = 3 */
	@:isVar public var messageId(get, set):PT_String;
	public inline function setMessageId(value:PT_String):SubscribeRoomRequest{
		this.messageId = value;
		return this;
	}

	public function set_messageId(value:PT_String):PT_String{
		return this.messageId = value;
	}

	public function get_messageId():PT_String {
		return this.messageId;
	}


	/** LABEL_OPTIONAL resource : TYPE_STRING = 4 */
	@:isVar public var resource(get, set):PT_String;
	public inline function setResource(value:PT_String):SubscribeRoomRequest{
		this.resource = value;
		return this;
	}

	public function clearResource():Void {
		this.resource = null;
	}

	inline public function hasResource():Bool {
		return this.resource != null;
	}

	public function set_resource(value:PT_String):PT_String{
		return this.resource = value;
	}

	public function get_resource():PT_String {
		return this.resource;
	}


	/** LABEL_OPTIONAL session_id : TYPE_STRING = 5 */
	@:isVar public var sessionId(get, set):PT_String;
	public inline function setSessionId(value:PT_String):SubscribeRoomRequest{
		this.sessionId = value;
		return this;
	}

	public function clearSessionId():Void {
		this.sessionId = null;
	}

	inline public function hasSessionId():Bool {
		return this.sessionId != null;
	}

	public function set_sessionId(value:PT_String):PT_String{
		return this.sessionId = value;
	}

	public function get_sessionId():PT_String {
		return this.sessionId;
	}

	public function new(){
		super();
		this.host = "";
		this.roomName = "";
		this.messageId = "";
	}

	/** @private */
	override public function writeToBuffer(output:PT_OutputStream):Void {
		protohx.WriteUtils.writeTag(output, protohx.WireType.LENGTH_DELIMITED, 1);
		protohx.WriteUtils.write__TYPE_STRING(output, this.host);
		protohx.WriteUtils.writeTag(output, protohx.WireType.LENGTH_DELIMITED, 2);
		protohx.WriteUtils.write__TYPE_STRING(output, this.roomName);
		protohx.WriteUtils.writeTag(output, protohx.WireType.LENGTH_DELIMITED, 3);
		protohx.WriteUtils.write__TYPE_STRING(output, this.messageId);
		if (hasResource()) {
			protohx.WriteUtils.writeTag(output, protohx.WireType.LENGTH_DELIMITED, 4);
			protohx.WriteUtils.write__TYPE_STRING(output, this.resource);
		}
		if (hasSessionId()) {
			protohx.WriteUtils.writeTag(output, protohx.WireType.LENGTH_DELIMITED, 5);
			protohx.WriteUtils.write__TYPE_STRING(output, this.sessionId);
		}
		super.writeExtensionOrUnknownFields(output);
	}

	override public function forEachFields(fn:String->Dynamic->Void):Void {
			fn("host", this.host);
			fn("roomName", this.roomName);
			fn("messageId", this.messageId);
		if (hasResource()) {
			fn("resource", this.resource);
		}
		if (hasSessionId()) {
			fn("sessionId", this.sessionId);
		}
	}

	/** @private */
	override public function readFromSlice(input:PT_InputStream, bytesAfterSlice:PT_UInt):Void {
		var host__count:PT_UInt = 0;
		var room_name__count:PT_UInt = 0;
		var message_id__count:PT_UInt = 0;
		var resource__count:PT_UInt = 0;
		var session_id__count:PT_UInt = 0;
		while (hasBytes(input, bytesAfterSlice)) {
			var tag:PT_UInt = protohx.ReadUtils.read__TYPE_UINT32(input);
			switch (tag >> 3) {
			case 1:
				if (host__count != 0) {
					throw new PT_IOError('Bad data format: SubscribeRoomRequest.host cannot be set twice.');
				}
				++host__count;
				this.host = protohx.ReadUtils.read__TYPE_STRING(input);
			case 2:
				if (room_name__count != 0) {
					throw new PT_IOError('Bad data format: SubscribeRoomRequest.roomName cannot be set twice.');
				}
				++room_name__count;
				this.roomName = protohx.ReadUtils.read__TYPE_STRING(input);
			case 3:
				if (message_id__count != 0) {
					throw new PT_IOError('Bad data format: SubscribeRoomRequest.messageId cannot be set twice.');
				}
				++message_id__count;
				this.messageId = protohx.ReadUtils.read__TYPE_STRING(input);
			case 4:
				if (resource__count != 0) {
					throw new PT_IOError('Bad data format: SubscribeRoomRequest.resource cannot be set twice.');
				}
				++resource__count;
				this.resource = protohx.ReadUtils.read__TYPE_STRING(input);
			case 5:
				if (session_id__count != 0) {
					throw new PT_IOError('Bad data format: SubscribeRoomRequest.sessionId cannot be set twice.');
				}
				++session_id__count;
				this.sessionId = protohx.ReadUtils.read__TYPE_STRING(input);
			default:
				super.readUnknown(input, tag);
			}
		}
	}

}

