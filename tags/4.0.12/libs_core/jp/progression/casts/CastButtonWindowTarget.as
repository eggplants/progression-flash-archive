﻿/**
 * Progression 4
 * 
 * @author Copyright (C) 2007-2010 taka:nium.jp, All Rights Reserved.
 * @version 4.0.12
 * @see http://progression.jp/
 * 
 * Progression Libraries is dual licensed under the "Progression Library License" and "GPL".
 * http://progression.jp/license
 */
package jp.progression.casts {
	import jp.nium.core.debug.Logger;
	import jp.nium.core.L10N.L10NNiumMsg;
	import jp.nium.utils.ClassUtil;
	
	/**
	 * <span lang="ja">CastButtonWindowTarget クラスは、CastButton クラスの移動先を展開する対象のブラウザウィンドウを示す値を提供します。</span>
	 * <span lang="en"></span>
	 * 
	 * @see jp.progression.casts.CastButton#windowTarget
	 * @see jp.progression.casts.CastButton#navitateTo()
	 * 
	 * @example <listing version="3.0">
	 * </listing>
	 */
	public final class CastButtonWindowTarget {
		
		/**
		 * <span lang="ja">対象を自身のウィンドウで開くように指定します。</span>
		 * <span lang="en"></span>
		 */
		public static const SELF:String = "_self";
		
		/**
		 * <span lang="ja">対象を最上位のフレームで開くように指定します。</span>
		 * <span lang="en"></span>
		 */
		public static const TOP:String = "_top";
		
		/**
		 * <span lang="ja">対象を親のフレームで開くように指定します。</span>
		 * <span lang="en"></span>
		 */
		public static const PARENT:String = "_parent";
		
		/**
		 * <span lang="ja">対象を新しいウィンドウで開くように指定します。</span>
		 * <span lang="en"></span>
		 */
		public static const BLANK:String = "_blank";
		
		
		
		
		
		/**
		 * @private
		 */
		public function CastButtonWindowTarget() {
			throw new Error( Logger.getLog( L10NNiumMsg.getInstance().ERROR_010 ).toString( ClassUtil.getClassName( this ) ) );
		}
	}
}
