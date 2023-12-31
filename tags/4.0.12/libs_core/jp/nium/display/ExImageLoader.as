﻿/**
 * jp.nium Classes
 * 
 * @author Copyright (C) 2007-2010 taka:nium.jp, All Rights Reserved.
 * @version 4.0.12
 * @see http://classes.nium.jp/
 * 
 * jp.nium Classes is released under the MIT License:
 * http://www.opensource.org/licenses/mit-license.php
 */
package jp.nium.display {
	import flash.display.Bitmap;
	import flash.display.PixelSnapping;
	import flash.events.Event;
	import flash.net.URLRequest;
	import flash.system.LoaderContext;
	import flash.utils.ByteArray;
	import jp.nium.core.debug.Logger;
	import jp.nium.core.L10N.L10NNiumMsg;
	
	/**
	 * <span lang="ja">ExImageLoader クラスは、ExLoader クラスに対してイメージの読み込みや制御の機能拡張を追加した表示オブジェクトクラスです。</span>
	 * <span lang="en">ExImageLoader class is a display object class which extends the image reading and control function to the ExLoader class.</span>
	 * 
	 * @see jp.nium.display#getInstanceById()
	 * @see jp.nium.display#getInstancesByGroup()
	 * 
	 * @example <listing version="3.0">
	 * // ExImageLoader インスタンスを作成する
	 * var image:ExImageLoader = new ExImageLoader();
	 * </listing>
	 */
	public class ExImageLoader extends ExLoader {
		
		/**
		 * 画像ファイル形式を判別する正規表現を取得します。
		 */
		private static const _IMAGE_FORMAT_REGEXP:String = "[.](jpg|jpeg|jpe|png|gif)(\\?.*)?$";
		
		
		
		
		
		/**
		 * <span lang="ja">読み込む画像データの横幅を自動調整する際に基準となる値を取得または設定します。</span>
		 * <span lang="en"></span>
		 * 
		 * @see #width
		 * @see #contentWidth
		 * @see #ratio
		 */
		public function get adjustWidth():Number { return _adjustWidth; }
		public function set adjustWidth( value:Number ):void {
			_adjustWidth = value;
			
			if ( _bmp ) {
				_update();
			}
		}
		private var _adjustWidth:Number;
		
		/**
		 * <span lang="ja">読み込む画像データの縦幅を自動調整する際に基準となる値を取得または設定します。</span>
		 * <span lang="en"></span>
		 * 
		 * @see #height
		 * @see #contentHeight
		 * @see #ratio
		 */
		public function get adjustHeight():Number { return _adjustHeight; }
		public function set adjustHeight( value:Number ):void {
			_adjustHeight = value;
			
			if ( _bmp ) {
				_update();
			}
		}
		private var _adjustHeight:Number;
		
		/**
		 * <span lang="ja">ロードされたコンテンツの規格幅を取得します。</span>
		 * <span lang="en">Get the standard width of the loaded contents.</span>
		 */
		public function get contentWidth():Number { return _contentWidth; }
		private var _contentWidth:Number = 0.0;
		
		/**
		 * <span lang="ja">ロードされたファイルの規格高さを取得します。</span>
		 * <span lang="en">Get the standard height of the loaded contents.</span>
		 */
		public function get contentHeight():Number { return _contentHeight; }
		private var _contentHeight:Number = 0.0;
		
		/**
		 * <span lang="ja">画像の基準点を取得または設定します。</span>
		 * <span lang="en">Get or set the reference point of the image.</span>
		 * 
		 * @see jp.nium.display.ExImageLoaderAlign
		 */
		public function get align():int { return _align; }
		public function set align( value:int ):void {
			switch( value ) {
				case 0		:
				case 1		:
				case 2		:
				case 3		:
				case 4		:
				case 5		:
				case 6		:
				case 7		:
				case 8		: { _align = value; break; }
				default		: { throw new Error( Logger.getLog( L10NNiumMsg.getInstance().ERROR_003 ).toString( "align" ) ); }
			}
			
			if ( _bmp ) {
				_update();
			}
		}
		private var _align:int = 0;
		
		/**
		 * <span lang="ja">リサイズ時に比率を維持するかどうかを取得または設定します。</span>
		 * <span lang="en">Get or set whether to maintain the ratio when resizing it.</span>
		 * 
		 * @see jp.nium.display.ExImageLoaderRatio
		 */
		public function get ratio():int { return _ratio; }
		public function set ratio( value:int ):void {
			switch( value ) {
				case 0		:
				case 1		:
				case 2		: { _ratio = value; break; }
				default		: { throw new Error( Logger.getLog( L10NNiumMsg.getInstance().ERROR_003 ).toString( "ratio" ) ); }
			}
			
			if ( _bmp ) {
				_update();
			}
		}
		private var _ratio:int = 0;
		
		/**
		 * <span lang="ja">Bitmap オブジェクトが最も近いピクセルに吸着されるかどうかを指定します。</span>
		 * <span lang="en">Controls whether or not the Bitmap object is snapped to the nearest pixel.</span>
		 */
		public function get pixelSnapping():String { return _pixelSnapping; }
		public function set pixelSnapping( value:String ):void {
			_pixelSnapping = value;
			
			if ( _bmp ) {
				_bmp.pixelSnapping = value;
			}
		}
		private var _pixelSnapping:String = PixelSnapping.ALWAYS;
		
		/**
		 * <span lang="ja">ビットマップを拡大 / 縮小するときにスムージングするかどうかを指定します。</span>
		 * <span lang="en">Controls whether or not the bitmap is smoothed when scaled.</span>
		 */
		public function get smoothing():Boolean { return _smoothing; }
		public function set smoothing( value:Boolean ):void {
			_smoothing = value;
			
			if ( _bmp ) {
				_bmp.smoothing = value;
			}
		}
		private var _smoothing:Boolean = true;
		
		/**
		 * Bitmap インスタンスを取得します。 
		 */
		private var _bmp:Bitmap;
		
		
		
		
		
		/**
		 * <span lang="ja">新しい ExImageLoader インスタンスを作成します。</span>
		 * <span lang="en">Creates a new ExImageLoader object.</span>
		 * 
		 * @param initObject
		 * <span lang="ja">設定したいプロパティを含んだオブジェクトです。</span>
		 * <span lang="en"></span>
		 */
		public function ExImageLoader( initObject:Object = null ) {
			// 親クラスを初期化する
			super( initObject );
		}
		
		
		
		
		
		/**
		 * <span lang="ja">イメージファイルを読み込みます。</span>
		 * <span lang="en">Read the image file.</span>
		 * 
		 * @param request
		 * <span lang="ja">読み込む JPEG、GIF、または PNG ファイルの絶対 URL または相対 URL です。</span>
		 * <span lang="en">Absolute or relative URL of the JPEG , GIF or PNG file to read.</span>
		 * @param context
		 * <span lang="en">LoaderContext オブジェクトです。</span>
		 * <span lang="en">The LoaderContext object.</span>
		 */
		override public function load( request:URLRequest, context:LoaderContext = null ):void {
			// 対象が画像でなければ
			if ( !( new RegExp( _IMAGE_FORMAT_REGEXP, "gi" ).test( request.url ) ) ) { throw new Error( Logger.getLog( L10NNiumMsg.getInstance().ERROR_014 ).toString() ); }
			
			// 破棄処理を実行する
			_dispose();
			
			// イベントリスナーを登録する
			super.contentLoaderInfo.addEventListener( Event.COMPLETE, _complete, false, int.MAX_VALUE );
			
			// 読み込み処理を開始する
			super.load( request, context );
		}
		
		/**
		 * <span lang="ja">ByteArray オブジェクトに保管されているバイナリデータから読み込みます。</span>
		 * <span lang="en">Loads from binary data stored in a ByteArray object.</span>
		 * 
		 * @param bytes
		 * <span lang="en">ByteArray オブジェクトです。ByteArray の内容としては、Loader クラスがサポートする SWF、GIF、JPEG、PNG のうちの任意のファイル形式を使用できます。</span>
		 * <span lang="en">A ByteArray object. The contents of the ByteArray can be any of the file formats supported by the Loader class: SWF, GIF, JPEG, or PNG.</span>
		 * @param context
		 * <span lang="en">LoaderContext オブジェクトです。LoaderContext オブジェクトの applicationDomain プロパティのみが適用され、LoaderContext オブジェクトの checkPolicyFile および securityDomain プロパティは適用されません。</span>
		 * <span lang="en">A LoaderContext object. Only the applicationDomain property of the LoaderContext object applies; the checkPolicyFile and securityDomain properties of the LoaderContext object do not apply.</span>
		 */
		override public function loadBytes( bytes:ByteArray, context:LoaderContext = null ):void {
			// 破棄処理を実行する
			_dispose();
			
			// イベントリスナーを登録する
			super.contentLoaderInfo.addEventListener( Event.COMPLETE, _complete, false, int.MAX_VALUE );
			
			// 読み込み処理を開始する
			super.loadBytes( bytes, context );
		}
		
		/**
		 * <span lang="ja">Loader インスタンスに対して現在進行中の load() メソッドの処理をキャンセルします。</span>
		 * <span lang="en">Cancels a load() method operation that is currently in progress for the Loader instance.</span>
		 */
		override public function close():void {
			// 破棄処理を実行する
			_dispose();
			
			// 親のメソッドを実行する
			super.close();
		}
		
		/**
		 * <span lang="ja">load() メソッドを使用して読み込まれた、この Loader オブジェクトの子を削除します。</span>
		 * <span lang="en">Removes a child of this Loader object that was loaded by using the load() method.</span>
		 */
		override public function unload():void {
			// 破棄処理を実行する
			_dispose();
			
			// 親のメソッドを実行する
			super.unload();
		}
		
		/**
		 * Bitmap を更新する
		 */
		private function _update():void {
			// サイズが指定されていなければオリジナルサイズを設定する
			var width:Number = isNaN( _adjustWidth ) ? _contentWidth : _adjustWidth;
			var height:Number = isNaN( _adjustHeight ) ? _contentHeight : _adjustHeight;
			
			// 縦横比を調整する
			switch ( _ratio ) {
				case 0		: {
					_bmp.width = width;
					_bmp.height = height;
					break;
				}
				case 1		: {
					var scale:Number = Math.max( width / _contentWidth, height / _contentHeight );
				}
				case 2		: {
					scale ||= Math.min( width / _contentWidth, height / _contentHeight );
					_bmp.width = Math.ceil( _contentWidth * scale );
					_bmp.height = Math.ceil( _contentHeight * scale );
					break;
				}
			}
			
			// X 軸の基準点を調整する
			_bmp.x = ( width - _bmp.width ) / 2;
			switch( _align ) {
				case 1	:
				case 4	:
				case 7	: { _bmp.x -= width / 2; break; }
				case 0	:
				case 3	:
				case 6	: { break; }
				case 2	:
				case 5	:
				case 8	: { _bmp.x = -width; break; }
			}
			
			// Y 軸の基準点を調整する
			_bmp.y = ( height - _bmp.height ) / 2;
			switch( _align ) {
				case 6	:
				case 7	:
				case 8	: { _bmp.y -= height; break; }
				case 3	:
				case 4	:
				case 5	: { _bmp.y -= height / 2; break; }
				case 0	:
				case 1	:
				case 2	: { break; }
			}
		}
		
		/**
		 * 破棄処理を実行する。
		 */
		private function _dispose():void {
			// Bitmap を破棄する
			_bmp = null;
			
			// オリジナルサイズを破棄する
			_contentWidth = 0;
			_contentHeight = 0;
		}
		
		
		
		
		
		/**
		 * データが正常にロードされたときに送出されます。
		 */
		private function _complete( e:Event ):void {
			// Bitmap を取得する
			_bmp = super.content as Bitmap;
			
			// Bitmap データではなければ例外をスローする
			if ( !_bmp ) {
				unload();
				throw new Error( Logger.getLog( L10NNiumMsg.getInstance().ERROR_014 ).toString() );
			}
			
			// オリジナルサイズを保存する
			_contentWidth = super.contentLoaderInfo.width;
			_contentHeight = super.contentLoaderInfo.height;
			
			// 初期化する
			_bmp.pixelSnapping = _pixelSnapping;
			_bmp.smoothing = _smoothing;
			
			// Bitmap を更新する
			_update();
		}
	}
}
