import { Room, Client } from "@colyseus/core";
import { MyRoomState, Player } from "./schema/MyRoomState";

export class MyRoom extends Room<MyRoomState> {
  maxClients = 6; // 3 on 3 battles
  state = new MyRoomState();

  onCreate (options: any) {  }

  onJoin (client: Client, options: any) {
    console.log(client.sessionId, "TRUE");
    this.state.players.set(client.sessionId, new Player());
  }

  onLeave (client: Client, consented: boolean) {
    console.log(client.sessionId, "FALSE");
    this.state.players.delete(client.sessionId);
  }

  onDispose() {  }

}
