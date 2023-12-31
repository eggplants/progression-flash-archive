﻿/**
 * Progression 3
 * 
 * @author Copyright (C) 2007-2010 taka:nium.jp, All Rights Reserved.
 * @version 3.1.92
 * @see http://progression.jp/
 * 
 * Progression Libraries is dual licensed under the "Progression Library License" and "GPL".
 * http://progression.jp/license
 */
package jp.progression.events {
	import flash.display.InteractiveObject;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	/**
	 * <span lang="ja">CastButton クラスを継承したオブジェクトで MouseEvent が送出された際に CastMouseEvent オブジェクトが送出されます。</span>
	 * <span lang="en"></span>
	 * 
	 * @example <listing version="3.0">
	 * </listing>
	 */
	public class CastMouseEvent extends MouseEvent {
		
		/**
		 * <span lang="ja">castMouseDown イベントオブジェクトの type プロパティ値を定義します。</span>
		 * <span lang="en">The CastMouseEvent.CAST_MOUSE_DOWN constant defines the value of the type property of an castMouseDown event object.</span>
		 */
		public static const CAST_MOUSE_DOWN:String = "castMouseDown";
		
		/**
		 * <span lang="ja">castMouseUp イベントオブジェクトの type プロパティ値を定義します。</span>
		 * <span lang="en">The CastMouseEvent.CAST_MOUSE_UP constant defines the value of the type property of an castMouseUp event object.</span>
		 */
		public static const CAST_MOUSE_UP:String = "castMouseUp";
		
		/**
		 * <span lang="ja">castRollOver イベントオブジェクトの type プロパティ値を定義します。</span>
		 * <span lang="en">The CastMouseEvent.CAST_ROLL_OVER constant defines the value of the type property of an castRollOver event object.</span>
		 */
		public static const CAST_ROLL_OVER:String = "castRollOver";
		
		/**
		 * <span lang="ja">castRollOut イベントオブジェクトの type プロパティ値を定義します。</span>
		 * <span lang="en">The CastMouseEvent.CAST_ROLL_OUT constant defines the value of the type property of an castRollOut event object.</span>
		 */
		public static const CAST_ROLL_OUT:String = "castRollOut";
		
		
		
		
		
		/**
		 * <span lang="ja">新しい CastMouseEvent インスタンスを作成します。</span>
		 * <span lang="en">Creates a new CastMouseEvent object.</span>
		 * 
		 * @param type
		 * <span lang="ja">CastMouseEvent.type としてアクセス可能なイベントタイプです。</span>
		 * <span lang="en">The type of the event, accessible as CastMouseEvent.type.</span>
		 * @param bubbles
		 * <span lang="ja">CastMouseEvent インスタンスがイベントフローのバブリング段階で処理されるかどうかを判断します。デフォルト値は false です。</span>
		 * <span lang="en">Determines whether the CastMouseEvent object participates in the bubbling stage of the event flow. The default value is false.</span>
		 * @param cancelable
		 * <span lang="ja">CastMouseEvent インスタンスがキャンセル可能かどうかを判断します。デフォルト値は false です。</span>
		 * <span lang="en">Determines whether the CastMouseEvent object can be canceled. The default values is false.</span>
		 * @param localX
		 * <span lang="ja">スプライトを基準とするイベント発生位置の水平座標です。</span>
		 * <span lang="en">The horizontal coordinate at which the event occurred relative to the containing sprite.</span>
		 * @param localY
		 * <span lang="ja">スプライトを基準とするイベント発生位置の垂直座標です。</span>
		 * <span lang="en">The vertical coordinate at which the event occurred relative to the containing sprite.</span>
		 * @param relatedObject
		 * <span lang="ja">イベントの影響を受ける補完的な InteractiveObject インスタンスです。たとえば、mouseOut イベントが発生した場合、relatedObject はポインティングデバイスが現在指している表示リストオブジェクトを表します。</span>
		 * <span lang="en">The complementary InteractiveObject instance that is affected by the event. For example, when a mouseOut event occurs, relatedObject represents the display list object to which the pointing device now points.</span>
		 * @param ctrlKey
		 * <span lang="ja">Ctrl キーがアクティブになっているかどうかを示します。</span>
		 * <span lang="en">On Windows, indicates whether the Ctrl key is activated. On Mac, indicates whether either the Ctrl key or the Command key is activated.</span>
		 * @param altKey
		 * <span lang="ja">将来の使用のために予約されています。</span>
		 * <span lang="en">Indicates whether the Alt key is activated (Windows only).</span>
		 * @param shiftKey
		 * <span lang="ja">Shift キーがアクティブになっているかどうかを示します。</span>
		 * <span lang="en">Indicates whether the Shift key is activated.</span>
		 * @param buttonDown
		 * <span lang="ja">マウスの主ボタンが押されているか押されていないかを示します。</span>
		 * <span lang="en">Indicates whether the primary mouse button is pressed.</span>
		 * @param delta
		 * <span lang="ja">ユーザーがマウスホイールを 1 目盛り回すごとにスクロールする行数を示します。正の delta 値は上方向へのスクロールを表します。負の値は下方向へのスクロールを表します。一般的な値は 1 ～ 3 の範囲ですが、ホイールの回転が速くなると、delta の値は大きくなります。このパラメータは、CastMouseEvent.mouseWheel イベントのみで使用されます。</span>
		 * <span lang="en">Indicates how many lines should be scrolled for each unit the user rotates the mouse wheel. A positive delta value indicates an upward scroll; a negative value indicates a downward scroll. Typical values are 1 to 3, but faster rotation may produce larger values. This parameter is used only for the MouseEvent.mouseWheel event.</span>
		 */
		public function CastMouseEvent( type:String, bubbles:Boolean = false, cancelable:Boolean = false, localX:Number = 0, localY:Number = 0, relatedObject:InteractiveObject = null, ctrlKey:Boolean = false, altKey:Boolean = false, shiftKey:Boolean = false, buttonDown:Boolean = false, delta:int = 0 ) {
			// スーパークラスを初期化する
			super( type, bubbles, cancelable, localX, localY, relatedObject, ctrlKey, altKey, shiftKey, buttonDown, delta );
		}
		
		
		
		
		
		/**
		 * <span lang="ja">CastMouseEvent インスタンスのコピーを作成して、各プロパティの値を元のプロパティの値と一致するように設定します。</span>
		 * <span lang="en">Duplicates an instance of an CastMouseEvent subclass.</span>
		 * 
		 * @return
		 * <span lang="ja">元のオブジェクトと同じプロパティ値を含む新しい CastMouseEvent インスタンスです。</span>
		 * <span lang="en">A new CastMouseEvent object that is identical to the original.</span>
		 */
		public override function clone():Event {
			return new CastMouseEvent( type, bubbles, cancelable, localX, localY, relatedObject, ctrlKey, altKey, shiftKey, buttonDown, delta );
		}
		
		/**
		 * <span lang="ja">指定されたオブジェクトのストリング表現を返します。</span>
		 * <span lang="en">Returns the string representation of the specified object.</span>
		 * 
		 * @return
		 * <span lang="ja">オブジェクトのストリング表現です。</span>
		 * <span lang="en">A string representation of the object.</span>
		 */
		public override function toString():String {
			return formatToString( "CastMouseEvent", "type", "bubbles", "cancelable", "localX", "localY", "relatedObject", "ctrlKey", "altKey", "shiftKey", "buttonDown", "delta" );
		}
	}
}
