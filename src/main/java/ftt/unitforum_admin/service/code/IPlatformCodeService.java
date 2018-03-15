package ftt.unitforum_admin.service.code;

import java.util.List;
import java.util.Map;

import ftt.unitforum_admin.types.CodeObject;
import ftt.unitforum_admin.types.UnitforumGame;

public interface IPlatformCodeService {
	public List<UnitforumGame> getAvailableGameList();
	public List<CodeObject> getLangCodeList();
	public Map<Integer, String> getGameCodeTable();
    public Map<Integer, String> getLangCodeTable();
}
