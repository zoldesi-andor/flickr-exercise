package com.docler.chat.message.protobuf;
import protohx.Protohx;
import com.docler.chat.message.protobuf.ResultBase;
class DeleteRoomResult extends protohx.Message {

	/** LABEL_REQUIRED result : TYPE_MESSAGE = 1 */
	@:isVar public var result(get, set):com.docler.chat.message.protobuf.ResultBase;
	public inline function setResult(value:com.docler.chat.message.protobuf.ResultBase):DeleteRoomResult{
		this.result = value;
		return this;
	}

	public function set_result(value:com.docler.chat.message.protobuf.ResultBase):com.docler.chat.message.protobuf.ResultBase{
		return this.result = value;
	}

	public function get_result():com.docler.chat.message.protobuf.ResultBase {
		return this.result;
	}

	public function new(){
		super();
		this.result = new com.docler.chat.message.protobuf.ResultBase();
	}

	/** @private */
	override public function writeToBuffer(output:PT_OutputStream):Void {
		protohx.WriteUtils.writeTag(output, protohx.WireType.LENGTH_DELIMITED, 1);
		protohx.WriteUtils.write__TYPE_MESSAGE(output, this.result);
		super.writeExtensionOrUnknownFields(output);
	}

	override public function forEachFields(fn:String->Dynamic->Void):Void {
			fn("result", this.result);
	}

	/** @private */
	override public function readFromSlice(input:PT_InputStream, bytesAfterSlice:PT_UInt):Void {
		var result__count:PT_UInt = 0;
		while (hasBytes(input, bytesAfterSlice)) {
			var tag:PT_UInt = protohx.ReadUtils.read__TYPE_UINT32(input);
			switch (tag >> 3) {
			case 1:
				if (result__count != 0) {
					throw new PT_IOError('Bad data format: DeleteRoomResult.result cannot be set twice.');
				}
				++result__count;
				this.result = new com.docler.chat.message.protobuf.ResultBase();
				protohx.ReadUtils.read__TYPE_MESSAGE(input, this.result);
			default:
				super.readUnknown(input, tag);
			}
		}
	}

}

