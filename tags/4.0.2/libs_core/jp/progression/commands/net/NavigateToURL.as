﻿/**
 * Progression 4
 * 
 * @author Copyright (C) 2007-2010 taka:nium.jp, All Rights Reserved.
 * @version 4.0.2
 * @see http://progression.jp/
 * 
 * Progression Libraries is dual licensed under the "Progression Library License" and "GPL".
 * http://progression.jp/license
 */
package jp.progression.commands.net {
	import flash.net.navigateToURL;
	import flash.net.URLRequest;
	import jp.nium.utils.ObjectUtil;
	import jp.progression.commands.Command;
	
	/**
	 * <span lang="ja">NavigateToURL クラスは、Flash Player のコンテナを含むアプリケーション（通常はブラウザ）でウィンドウを開くか、置き換え操作を行うコマンドクラスです。</span>
	 * <span lang="en"></span>
	 * 
	 * @example <listing version="3.0">
	 * // NavigateToURL インスタンスを作成する
	 * var com:NavigateToURL = new NavigateToURL();
	 * 
	 * // コマンドを実行する
	 * com.execute();
	 * </listing>
	 */
	public class NavigateToURL extends Command {
		
		/**
		 * <span lang="ja">リクエストされる URL を示すストリングを取得します。</span>
		 * <span lang="en"></span>
		 */
		public function get url():String { return _request ? _request.url : null; }
		
		/**
		 * <span lang="ja">リクエストされる URL です。
		 * コマンド実行中に値を変更しても、処理に対して反映されません。</span>
		 * <span lang="en">The URL to be requested.
		 * </span>
		 */
		public function get request():URLRequest { return _request; }
		public function set request( value:URLRequest ):void { _request = value; }
		private var _request:URLRequest;
		
		/**
		 * <span lang="ja">request パラメータで指定されたドキュメントを表示するブラウザウィンドウまたは HTML フレームです。
		 * コマンド実行中に値を変更しても、処理に対して反映されません。</span>
		 * <span lang="en">The browser window or HTML frame in which to display the document indicated by the request parameter.
		 * </span>
		 */
		public function get windowTarget():String { return _windowTarget; }
		public function set windowTarget( value:String ):void { _windowTarget = value; }
		private var _windowTarget:String;
		
		
		
		
		
		/**
		 * <span lang="ja">新しい NavigateToURL インスタンスを作成します。</span>
		 * <span lang="en">Creates a new NavigateToURL object.</span>
		 * 
		 * @param request
		 * <span lang="ja">移動先の URL を指定する URLRequest オブジェクトです。</span>
		 * <span lang="en">A URLRequest object that specifies the URL to navigate to.</span>
		 * @param windowTarget
		 * <span lang="en">request パラメータで指定されたドキュメントを表示するブラウザウィンドウまたは HTML フレームです。</span>
		 * <span lang="en">The browser window or HTML frame in which to display the document indicated by the request parameter.</span>
		 * @param initObject
		 * <span lang="ja">設定したいプロパティを含んだオブジェクトです。</span>
		 * <span lang="en"></span>
		 */
		public function NavigateToURL( request:URLRequest, windowTarget:String = null, initObject:Object = null ) {
			// 引数を設定する
			_request = request;
			_windowTarget = windowTarget;
			
			// 親クラスを初期化する
			super( _executeFunction, null, initObject );
		}
		
		
		
		
		
		/**
		 * 実行されるコマンドの実装です。
		 */
		private function _executeFunction():void {
			// 指定 URL に移動する
			navigateToURL( _request, _windowTarget );
			
			// 処理を終了する
			super.executeComplete();
		}
		
		/**
		 * <span lang="ja">保持しているデータを解放します。</span>
		 * <span lang="en"></span>
		 */
		override public function dispose():void {
			// 親のメソッドを実行する
			super.dispose();
			
			_request = null;
			_windowTarget = null;
		}
		
		/**
		 * <span lang="ja">NavigateToURL インスタンスのコピーを作成して、各プロパティの値を元のプロパティの値と一致するように設定します。</span>
		 * <span lang="en">Duplicates an instance of an NavigateToURL subclass.</span>
		 * 
		 * @return
		 * <span lang="ja">元のオブジェクトと同じプロパティ値を含む新しい NavigateToURL インスタンスです。</span>
		 * <span lang="en">A new NavigateToURL object that is identical to the original.</span>
		 */
		override public function clone():Command {
			return new NavigateToURL( _request, _windowTarget );
		}
		
		/**
		 * <span lang="ja">指定されたオブジェクトのストリング表現を返します。</span>
		 * <span lang="en">Returns the string representation of the specified object.</span>
		 * 
		 * @return
		 * <span lang="ja">オブジェクトのストリング表現です。</span>
		 * <span lang="en">A string representation of the object.</span>
		 */
		override public function toString():String {
			return ObjectUtil.formatToString( this, super.className, super.id ? "id" : null, "url", "windowTarget" );
		}
	}
}
