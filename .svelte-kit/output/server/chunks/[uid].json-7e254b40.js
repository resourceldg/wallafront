import { a as api } from "./_api-cf43c630.js";
const patch = async (request) => {
  return api(request, `todos/${request.locals.userid}/${request.params.uid}`, {
    text: request.body.get("text"),
    done: request.body.has("done") ? !!request.body.get("done") : void 0
  });
};
const del = async (request) => {
  return api(request, `todos/${request.locals.userid}/${request.params.uid}`);
};
export { del, patch };
