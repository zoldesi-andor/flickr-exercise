package com.docler.chat.message.protobuf;
import protohx.Protohx;
class CloseConversationRequest extends protohx.Message {

	/** LABEL_REQUIRED host : TYPE_STRING = 1 */
	@:isVar public var host(get, set):PT_String;
	public inline function setHost(value:PT_String):CloseConversationRequest{
		this.host = value;
		return this;
	}

	public function set_host(value:PT_String):PT_String{
		return this.host = value;
	}

	public function get_host():PT_String {
		return this.host;
	}


	/** LABEL_REQUIRED conversation_name : TYPE_STRING = 2 */
	@:isVar public var conversationName(get, set):PT_String;
	public inline function setConversationName(value:PT_String):CloseConversationRequest{
		this.conversationName = value;
		return this;
	}

	public function set_conversationName(value:PT_String):PT_String{
		return this.conversationName = value;
	}

	public function get_conversationName():PT_String {
		return this.conversationName;
	}


	/** LABEL_OPTIONAL reason : TYPE_STRING = 3 */
	@:isVar public var reason(get, set):PT_String;
	public inline function setReason(value:PT_String):CloseConversationRequest{
		this.reason = value;
		return this;
	}

	public function clearReason():Void {
		this.reason = null;
	}

	inline public function hasReason():Bool {
		return this.reason != null;
	}

	public function set_reason(value:PT_String):PT_String{
		return this.reason = value;
	}

	public function get_reason():PT_String {
		return this.reason;
	}


	/** LABEL_REQUIRED message_id : TYPE_STRING = 4 */
	@:isVar public var messageId(get, set):PT_String;
	public inline function setMessageId(value:PT_String):CloseConversationRequest{
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
		this.conversationName = "";
		this.messageId = "";
	}

	/** @private */
	override public function writeToBuffer(output:PT_OutputStream):Void {
		protohx.WriteUtils.writeTag(output, protohx.WireType.LENGTH_DELIMITED, 1);
		protohx.WriteUtils.write__TYPE_STRING(output, this.host);
		protohx.WriteUtils.writeTag(output, protohx.WireType.LENGTH_DELIMITED, 2);
		protohx.WriteUtils.write__TYPE_STRING(output, this.conversationName);
		if (hasReason()) {
			protohx.WriteUtils.writeTag(output, protohx.WireType.LENGTH_DELIMITED, 3);
			protohx.WriteUtils.write__TYPE_STRING(output, this.reason);
		}
		protohx.WriteUtils.writeTag(output, protohx.WireType.LENGTH_DELIMITED, 4);
		protohx.WriteUtils.write__TYPE_STRING(output, this.messageId);
		super.writeExtensionOrUnknownFields(output);
	}

	override public function forEachFields(fn:String->Dynamic->Void):Void {
			fn("host", this.host);
			fn("conversationName", this.conversationName);
		if (hasReason()) {
			fn("reason", this.reason);
		}
			fn("messageId", this.messageId);
	}

	/** @private */
	override public function readFromSlice(input:PT_InputStream, bytesAfterSlice:PT_UInt):Void {
		var host__count:PT_UInt = 0;
		var conversation_name__count:PT_UInt = 0;
		var reason__count:PT_UInt = 0;
		var message_id__count:PT_UInt = 0;
		while (hasBytes(input, bytesAfterSlice)) {
			var tag:PT_UInt = protohx.ReadUtils.read__TYPE_UINT32(input);
			switch (tag >> 3) {
			case 1:
				if (host__count != 0) {
					throw new PT_IOError('Bad data format: CloseConversationRequest.host cannot be set twice.');
				}
				++host__count;
				this.host = protohx.ReadUtils.read__TYPE_STRING(input);
			case 2:
				if (conversation_name__count != 0) {
					throw new PT_IOError('Bad data format: CloseConversationRequest.conversationName cannot be set twice.');
				}
				++conversation_name__count;
				this.conversationName = protohx.ReadUtils.read__TYPE_STRING(input);
			case 3:
				if (reason__count != 0) {
					throw new PT_IOError('Bad data format: CloseConversationRequest.reason cannot be set twice.');
				}
				++reason__count;
				this.reason = protohx.ReadUtils.read__TYPE_STRING(input);
			case 4:
				if (message_id__count != 0) {
					throw new PT_IOError('Bad data format: CloseConversationRequest.messageId cannot be set twice.');
				}
				++message_id__count;
				this.messageId = protohx.ReadUtils.read__TYPE_STRING(input);
			default:
				super.readUnknown(input, tag);
			}
		}
	}

}

