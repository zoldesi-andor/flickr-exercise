package com.docler.chat.message.protobuf;
import protohx.Protohx;
class ResultBase extends protohx.Message {

	/** LABEL_REQUIRED success : TYPE_BOOL = 1 */
	@:isVar public var success(get, set):PT_Bool;
	public inline function setSuccess(value:PT_Bool):ResultBase{
		this.success = value;
		return this;
	}

	public function set_success(value:PT_Bool):PT_Bool{
		return this.success = value;
	}

	public function get_success():PT_Bool {
		return this.success;
	}


	/** LABEL_REQUIRED message_id : TYPE_STRING = 2 */
	@:isVar public var messageId(get, set):PT_String;
	public inline function setMessageId(value:PT_String):ResultBase{
		this.messageId = value;
		return this;
	}

	public function set_messageId(value:PT_String):PT_String{
		return this.messageId = value;
	}

	public function get_messageId():PT_String {
		return this.messageId;
	}


	/** LABEL_OPTIONAL error_msg : TYPE_STRING = 3 */
	@:isVar public var errorMsg(get, set):PT_String;
	public inline function setErrorMsg(value:PT_String):ResultBase{
		this.errorMsg = value;
		return this;
	}

	public function clearErrorMsg():Void {
		this.errorMsg = null;
	}

	inline public function hasErrorMsg():Bool {
		return this.errorMsg != null;
	}

	public function set_errorMsg(value:PT_String):PT_String{
		return this.errorMsg = value;
	}

	public function get_errorMsg():PT_String {
		return this.errorMsg;
	}

	public function new(){
		super();
		this.success = false;
		this.messageId = "";
	}

	/** @private */
	override public function writeToBuffer(output:PT_OutputStream):Void {
		protohx.WriteUtils.writeTag(output, protohx.WireType.VARINT, 1);
		protohx.WriteUtils.write__TYPE_BOOL(output, this.success);
		protohx.WriteUtils.writeTag(output, protohx.WireType.LENGTH_DELIMITED, 2);
		protohx.WriteUtils.write__TYPE_STRING(output, this.messageId);
		if (hasErrorMsg()) {
			protohx.WriteUtils.writeTag(output, protohx.WireType.LENGTH_DELIMITED, 3);
			protohx.WriteUtils.write__TYPE_STRING(output, this.errorMsg);
		}
		super.writeExtensionOrUnknownFields(output);
	}

	override public function forEachFields(fn:String->Dynamic->Void):Void {
			fn("success", this.success);
			fn("messageId", this.messageId);
		if (hasErrorMsg()) {
			fn("errorMsg", this.errorMsg);
		}
	}

	/** @private */
	override public function readFromSlice(input:PT_InputStream, bytesAfterSlice:PT_UInt):Void {
		var success__count:PT_UInt = 0;
		var message_id__count:PT_UInt = 0;
		var error_msg__count:PT_UInt = 0;
		while (hasBytes(input, bytesAfterSlice)) {
			var tag:PT_UInt = protohx.ReadUtils.read__TYPE_UINT32(input);
			switch (tag >> 3) {
			case 1:
				if (success__count != 0) {
					throw new PT_IOError('Bad data format: ResultBase.success cannot be set twice.');
				}
				++success__count;
				this.success = protohx.ReadUtils.read__TYPE_BOOL(input);
			case 2:
				if (message_id__count != 0) {
					throw new PT_IOError('Bad data format: ResultBase.messageId cannot be set twice.');
				}
				++message_id__count;
				this.messageId = protohx.ReadUtils.read__TYPE_STRING(input);
			case 3:
				if (error_msg__count != 0) {
					throw new PT_IOError('Bad data format: ResultBase.errorMsg cannot be set twice.');
				}
				++error_msg__count;
				this.errorMsg = protohx.ReadUtils.read__TYPE_STRING(input);
			default:
				super.readUnknown(input, tag);
			}
		}
	}

}

