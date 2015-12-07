package com.docler.chat.message.protobuf;
import protohx.Protohx;
class OpenSessionRequest extends protohx.Message {

	/** LABEL_REQUIRED host : TYPE_STRING = 1 */
	@:isVar public var host(get, set):PT_String;
	public inline function setHost(value:PT_String):OpenSessionRequest{
		this.host = value;
		return this;
	}

	public function set_host(value:PT_String):PT_String{
		return this.host = value;
	}

	public function get_host():PT_String {
		return this.host;
	}


	/** LABEL_REQUIRED resource : TYPE_STRING = 2 */
	@:isVar public var resource(get, set):PT_String;
	public inline function setResource(value:PT_String):OpenSessionRequest{
		this.resource = value;
		return this;
	}

	public function set_resource(value:PT_String):PT_String{
		return this.resource = value;
	}

	public function get_resource():PT_String {
		return this.resource;
	}


	/** LABEL_REQUIRED session_id : TYPE_STRING = 3 */
	@:isVar public var sessionId(get, set):PT_String;
	public inline function setSessionId(value:PT_String):OpenSessionRequest{
		this.sessionId = value;
		return this;
	}

	public function set_sessionId(value:PT_String):PT_String{
		return this.sessionId = value;
	}

	public function get_sessionId():PT_String {
		return this.sessionId;
	}


	/** LABEL_REQUIRED message_id : TYPE_STRING = 4 */
	@:isVar public var messageId(get, set):PT_String;
	public inline function setMessageId(value:PT_String):OpenSessionRequest{
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
		this.resource = "";
		this.sessionId = "";
		this.messageId = "";
	}

	/** @private */
	override public function writeToBuffer(output:PT_OutputStream):Void {
		protohx.WriteUtils.writeTag(output, protohx.WireType.LENGTH_DELIMITED, 1);
		protohx.WriteUtils.write__TYPE_STRING(output, this.host);
		protohx.WriteUtils.writeTag(output, protohx.WireType.LENGTH_DELIMITED, 2);
		protohx.WriteUtils.write__TYPE_STRING(output, this.resource);
		protohx.WriteUtils.writeTag(output, protohx.WireType.LENGTH_DELIMITED, 3);
		protohx.WriteUtils.write__TYPE_STRING(output, this.sessionId);
		protohx.WriteUtils.writeTag(output, protohx.WireType.LENGTH_DELIMITED, 4);
		protohx.WriteUtils.write__TYPE_STRING(output, this.messageId);
		super.writeExtensionOrUnknownFields(output);
	}

	override public function forEachFields(fn:String->Dynamic->Void):Void {
			fn("host", this.host);
			fn("resource", this.resource);
			fn("sessionId", this.sessionId);
			fn("messageId", this.messageId);
	}

	/** @private */
	override public function readFromSlice(input:PT_InputStream, bytesAfterSlice:PT_UInt):Void {
		var host__count:PT_UInt = 0;
		var resource__count:PT_UInt = 0;
		var session_id__count:PT_UInt = 0;
		var message_id__count:PT_UInt = 0;
		while (hasBytes(input, bytesAfterSlice)) {
			var tag:PT_UInt = protohx.ReadUtils.read__TYPE_UINT32(input);
			switch (tag >> 3) {
			case 1:
				if (host__count != 0) {
					throw new PT_IOError('Bad data format: OpenSessionRequest.host cannot be set twice.');
				}
				++host__count;
				this.host = protohx.ReadUtils.read__TYPE_STRING(input);
			case 2:
				if (resource__count != 0) {
					throw new PT_IOError('Bad data format: OpenSessionRequest.resource cannot be set twice.');
				}
				++resource__count;
				this.resource = protohx.ReadUtils.read__TYPE_STRING(input);
			case 3:
				if (session_id__count != 0) {
					throw new PT_IOError('Bad data format: OpenSessionRequest.sessionId cannot be set twice.');
				}
				++session_id__count;
				this.sessionId = protohx.ReadUtils.read__TYPE_STRING(input);
			case 4:
				if (message_id__count != 0) {
					throw new PT_IOError('Bad data format: OpenSessionRequest.messageId cannot be set twice.');
				}
				++message_id__count;
				this.messageId = protohx.ReadUtils.read__TYPE_STRING(input);
			default:
				super.readUnknown(input, tag);
			}
		}
	}

}

