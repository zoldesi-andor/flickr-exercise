package com.docler.chat.message.protobuf;
import protohx.Protohx;
import com.docler.chat.message.protobuf.ResultBase;
class SubscribeRoomResult extends protohx.Message {

	/** LABEL_REQUIRED result : TYPE_MESSAGE = 1 */
	@:isVar public var result(get, set):com.docler.chat.message.protobuf.ResultBase;
	public inline function setResult(value:com.docler.chat.message.protobuf.ResultBase):SubscribeRoomResult{
		this.result = value;
		return this;
	}

	public function set_result(value:com.docler.chat.message.protobuf.ResultBase):com.docler.chat.message.protobuf.ResultBase{
		return this.result = value;
	}

	public function get_result():com.docler.chat.message.protobuf.ResultBase {
		return this.result;
	}


	/** LABEL_OPTIONAL nick : TYPE_STRING = 2 */
	@:isVar public var nick(get, set):PT_String;
	public inline function setNick(value:PT_String):SubscribeRoomResult{
		this.nick = value;
		return this;
	}

	public function clearNick():Void {
		this.nick = null;
	}

	inline public function hasNick():Bool {
		return this.nick != null;
	}

	public function set_nick(value:PT_String):PT_String{
		return this.nick = value;
	}

	public function get_nick():PT_String {
		return this.nick;
	}

	public function new(){
		super();
		this.result = new com.docler.chat.message.protobuf.ResultBase();
	}

	/** @private */
	override public function writeToBuffer(output:PT_OutputStream):Void {
		protohx.WriteUtils.writeTag(output, protohx.WireType.LENGTH_DELIMITED, 1);
		protohx.WriteUtils.write__TYPE_MESSAGE(output, this.result);
		if (hasNick()) {
			protohx.WriteUtils.writeTag(output, protohx.WireType.LENGTH_DELIMITED, 2);
			protohx.WriteUtils.write__TYPE_STRING(output, this.nick);
		}
		super.writeExtensionOrUnknownFields(output);
	}

	override public function forEachFields(fn:String->Dynamic->Void):Void {
			fn("result", this.result);
		if (hasNick()) {
			fn("nick", this.nick);
		}
	}

	/** @private */
	override public function readFromSlice(input:PT_InputStream, bytesAfterSlice:PT_UInt):Void {
		var result__count:PT_UInt = 0;
		var nick__count:PT_UInt = 0;
		while (hasBytes(input, bytesAfterSlice)) {
			var tag:PT_UInt = protohx.ReadUtils.read__TYPE_UINT32(input);
			switch (tag >> 3) {
			case 1:
				if (result__count != 0) {
					throw new PT_IOError('Bad data format: SubscribeRoomResult.result cannot be set twice.');
				}
				++result__count;
				this.result = new com.docler.chat.message.protobuf.ResultBase();
				protohx.ReadUtils.read__TYPE_MESSAGE(input, this.result);
			case 2:
				if (nick__count != 0) {
					throw new PT_IOError('Bad data format: SubscribeRoomResult.nick cannot be set twice.');
				}
				++nick__count;
				this.nick = protohx.ReadUtils.read__TYPE_STRING(input);
			default:
				super.readUnknown(input, tag);
			}
		}
	}

}

