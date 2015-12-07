package com.docler.chat.message.protobuf;
import protohx.Protohx;
class ReceiveOpenConversation extends protohx.Message {

	/** LABEL_REQUIRED conversation_name : TYPE_STRING = 1 */
	@:isVar public var conversationName(get, set):PT_String;
	public inline function setConversationName(value:PT_String):ReceiveOpenConversation{
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
	public inline function setFrom(value:PT_String):ReceiveOpenConversation{
		this.from = value;
		return this;
	}

	public function set_from(value:PT_String):PT_String{
		return this.from = value;
	}

	public function get_from():PT_String {
		return this.from;
	}


	/** LABEL_REQUIRED conversation_type : TYPE_STRING = 3 */
	@:isVar public var conversationType(get, set):PT_String;
	public inline function setConversationType(value:PT_String):ReceiveOpenConversation{
		this.conversationType = value;
		return this;
	}

	public function set_conversationType(value:PT_String):PT_String{
		return this.conversationType = value;
	}

	public function get_conversationType():PT_String {
		return this.conversationType;
	}

	public function new(){
		super();
		this.conversationName = "";
		this.from = "";
		this.conversationType = "";
	}

	/** @private */
	override public function writeToBuffer(output:PT_OutputStream):Void {
		protohx.WriteUtils.writeTag(output, protohx.WireType.LENGTH_DELIMITED, 1);
		protohx.WriteUtils.write__TYPE_STRING(output, this.conversationName);
		protohx.WriteUtils.writeTag(output, protohx.WireType.LENGTH_DELIMITED, 2);
		protohx.WriteUtils.write__TYPE_STRING(output, this.from);
		protohx.WriteUtils.writeTag(output, protohx.WireType.LENGTH_DELIMITED, 3);
		protohx.WriteUtils.write__TYPE_STRING(output, this.conversationType);
		super.writeExtensionOrUnknownFields(output);
	}

	override public function forEachFields(fn:String->Dynamic->Void):Void {
			fn("conversationName", this.conversationName);
			fn("from", this.from);
			fn("conversationType", this.conversationType);
	}

	/** @private */
	override public function readFromSlice(input:PT_InputStream, bytesAfterSlice:PT_UInt):Void {
		var conversation_name__count:PT_UInt = 0;
		var from__count:PT_UInt = 0;
		var conversation_type__count:PT_UInt = 0;
		while (hasBytes(input, bytesAfterSlice)) {
			var tag:PT_UInt = protohx.ReadUtils.read__TYPE_UINT32(input);
			switch (tag >> 3) {
			case 1:
				if (conversation_name__count != 0) {
					throw new PT_IOError('Bad data format: ReceiveOpenConversation.conversationName cannot be set twice.');
				}
				++conversation_name__count;
				this.conversationName = protohx.ReadUtils.read__TYPE_STRING(input);
			case 2:
				if (from__count != 0) {
					throw new PT_IOError('Bad data format: ReceiveOpenConversation.from cannot be set twice.');
				}
				++from__count;
				this.from = protohx.ReadUtils.read__TYPE_STRING(input);
			case 3:
				if (conversation_type__count != 0) {
					throw new PT_IOError('Bad data format: ReceiveOpenConversation.conversationType cannot be set twice.');
				}
				++conversation_type__count;
				this.conversationType = protohx.ReadUtils.read__TYPE_STRING(input);
			default:
				super.readUnknown(input, tag);
			}
		}
	}

}

