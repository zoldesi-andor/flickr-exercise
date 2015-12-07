package com.docler.chat.message.protobuf;
import protohx.Protohx;
class ReceiveCloseConversation extends protohx.Message {

	/** LABEL_REQUIRED conversation_name : TYPE_STRING = 1 */
	@:isVar public var conversationName(get, set):PT_String;
	public inline function setConversationName(value:PT_String):ReceiveCloseConversation{
		this.conversationName = value;
		return this;
	}

	public function set_conversationName(value:PT_String):PT_String{
		return this.conversationName = value;
	}

	public function get_conversationName():PT_String {
		return this.conversationName;
	}


	/** LABEL_REQUIRED from : TYPE_STRING = 2 */
	@:isVar public var from(get, set):PT_String;
	public inline function setFrom(value:PT_String):ReceiveCloseConversation{
		this.from = value;
		return this;
	}

	public function set_from(value:PT_String):PT_String{
		return this.from = value;
	}

	public function get_from():PT_String {
		return this.from;
	}


	/** LABEL_REQUIRED reason : TYPE_STRING = 3 */
	@:isVar public var reason(get, set):PT_String;
	public inline function setReason(value:PT_String):ReceiveCloseConversation{
		this.reason = value;
		return this;
	}

	public function set_reason(value:PT_String):PT_String{
		return this.reason = value;
	}

	public function get_reason():PT_String {
		return this.reason;
	}

	public function new(){
		super();
		this.conversationName = "";
		this.from = "";
		this.reason = "";
	}

	/** @private */
	override public function writeToBuffer(output:PT_OutputStream):Void {
		protohx.WriteUtils.writeTag(output, protohx.WireType.LENGTH_DELIMITED, 1);
		protohx.WriteUtils.write__TYPE_STRING(output, this.conversationName);
		protohx.WriteUtils.writeTag(output, protohx.WireType.LENGTH_DELIMITED, 2);
		protohx.WriteUtils.write__TYPE_STRING(output, this.from);
		protohx.WriteUtils.writeTag(output, protohx.WireType.LENGTH_DELIMITED, 3);
		protohx.WriteUtils.write__TYPE_STRING(output, this.reason);
		super.writeExtensionOrUnknownFields(output);
	}

	override public function forEachFields(fn:String->Dynamic->Void):Void {
			fn("conversationName", this.conversationName);
			fn("from", this.from);
			fn("reason", this.reason);
	}

	/** @private */
	override public function readFromSlice(input:PT_InputStream, bytesAfterSlice:PT_UInt):Void {
		var conversation_name__count:PT_UInt = 0;
		var from__count:PT_UInt = 0;
		var reason__count:PT_UInt = 0;
		while (hasBytes(input, bytesAfterSlice)) {
			var tag:PT_UInt = protohx.ReadUtils.read__TYPE_UINT32(input);
			switch (tag >> 3) {
			case 1:
				if (conversation_name__count != 0) {
					throw new PT_IOError('Bad data format: ReceiveCloseConversation.conversationName cannot be set twice.');
				}
				++conversation_name__count;
				this.conversationName = protohx.ReadUtils.read__TYPE_STRING(input);
			case 2:
				if (from__count != 0) {
					throw new PT_IOError('Bad data format: ReceiveCloseConversation.from cannot be set twice.');
				}
				++from__count;
				this.from = protohx.ReadUtils.read__TYPE_STRING(input);
			case 3:
				if (reason__count != 0) {
					throw new PT_IOError('Bad data format: ReceiveCloseConversation.reason cannot be set twice.');
				}
				++reason__count;
				this.reason = protohx.ReadUtils.read__TYPE_STRING(input);
			default:
				super.readUnknown(input, tag);
			}
		}
	}

}

