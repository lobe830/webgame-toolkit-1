package statm.dev.mapeditor.dom.objects
{
	import statm.dev.mapeditor.app.MapEditingActions;
	import statm.dev.mapeditor.dom.DomNode;
	import statm.dev.mapeditor.dom.Map;
	import statm.dev.mapeditor.dom.item.MobItemDefinition;

	/**
	 * DOM 对象：怪物。
	 *
	 * @author statm
	 *
	 */
	public class Mob extends Item
	{
		public function Mob(root:DomNode, mobDef:MobItemDefinition = null)
		{
			super(root);
			_name = "怪物";
			this.mobDef = mobDef;
			if (mobDef)
			{
				var props:Object = mobDef.defaultProps;
				props.hasOwnProperty("delay") && (_delay = props.delay);
				props.hasOwnProperty("battleEnabled") && (_battleEnabled = props.battleEnabled);
				props.hasOwnProperty("autoBattle") && (_autoBattle = props.autoBattle);
				props.hasOwnProperty("autoMove") && (_autoMove = props.autoMove);
				props.hasOwnProperty("respawnTime") && (_respawnTme = props.respawnTime);
				props.hasOwnProperty("standByTime") && (_standByTime = props.standByTime);
				props.hasOwnProperty("moveSpeed") && (_moveSpeed = props.moveSpeed);
			}
		}

		private var _mobDef:MobItemDefinition;

		public function get mobDef():MobItemDefinition
		{
			return _mobDef;
		}

		public function set mobDef(value:MobItemDefinition):void
		{
			_mobDef = value;
			value && (_mobID = value.mobID);
		}

		private var _mobID:int;

		public function get mobID():int
		{
			return _mobID;
		}

		public function set modID(value:int):void
		{
			_mobID = value;
			_mobDef = Map(root).itemDefinitionList.getMobDefinitionByID(_mobID);
		}

		private var _delay:int = 1000;

		public function get delay():int
		{
			return _delay;
		}

		public function set delay(value:int):void
		{
			if (value != _delay)
			{
				_delay = value;
				_mobDef.defaultProps.delay = value;
				this.notifyChange(MapEditingActions.OBJECT_PROPS);
			}
		}

		private var _battleEnabled:Boolean = false;

		public function get battleEnabled():Boolean
		{
			return _battleEnabled;
		}

		public function set battleEnabled(value:Boolean):void
		{
			if (value != _battleEnabled)
			{
				_battleEnabled = value;
				_mobDef.defaultProps.battleEnabled = value;
				this.notifyChange(MapEditingActions.OBJECT_PROPS);
			}
		}

		private var _autoBattle:Boolean = false;

		public function get autoBattle():Boolean
		{
			return _autoBattle;
		}

		public function set autoBattle(value:Boolean):void
		{
			if (value != _autoBattle)
			{
				_autoBattle = value;
				_mobDef.defaultProps.autoBattle = value;
				this.notifyChange(MapEditingActions.OBJECT_PROPS);
			}
		}

		private var _autoMove:Boolean = true;

		public function get autoMove():Boolean
		{
			return _autoMove;
		}

		public function set autoMove(value:Boolean):void
		{
			if (value != _autoMove)
			{
				_autoMove = value;
				_mobDef.defaultProps.autoMove = value;
				this.notifyChange(MapEditingActions.OBJECT_PROPS);
			}
		}

		private var _respawnTme:int = 10000;

		public function get respawnTime():int
		{
			return _respawnTme;
		}

		public function set respawnTime(value:int):void
		{
			if (value != _respawnTme)
			{
				_respawnTme = value;
				_mobDef.defaultProps.respawnTime = value;
				this.notifyChange(MapEditingActions.OBJECT_PROPS);
			}
		}

		private var _standByTime:int = 10;

		public function get standByTime():int
		{
			return _standByTime;
		}

		public function set standByTime(value:int):void
		{
			if (value != _standByTime)
			{
				_standByTime = value;
				_mobDef.defaultProps.standByTime = value;
				this.notifyChange(MapEditingActions.OBJECT_PROPS);
			}
		}

		private var _moveSpeed:int = 30;

		public function get moveSpeed():int
		{
			return _moveSpeed;
		}

		public function set moveSpeed(value:int):void
		{
			if (value != _moveSpeed)
			{
				_moveSpeed = value;
				_mobDef.defaultProps.moveSpeed = value;
				this.notifyChange(MapEditingActions.OBJECT_PROPS);
			}
		}

		override public function readXML(xml:XML):void
		{
			_mobID = parseInt(xml.@mobID);
			_mobDef = Map(root).itemDefinitionList.getMobDefinitionByID(_mobID);

			this.x = xml.@x;
			this.y = xml.@y;
			this.delay = xml.@delay;
			this.battleEnabled = xml.@battleEnabled;
			this.autoBattle = xml.@autoBattle;
			this.autoMove = xml.@autoMove;
			this.respawnTime = xml.@respawnTime;
			this.standByTime = xml.@standByTime;
			this.moveSpeed = xml.@moveSpeed;
		}

		override public function toXML():XML
		{
			return <mob x={x} y={y} mobID={_mobID} delay={_delay} battleEnabled={_battleEnabled} autoBattle={_autoBattle} autoMove={_autoMove} respawnTime={_respawnTme} standByTime={_standByTime} moveSpeed={_moveSpeed}/>
		}
	}
}