<?php
/**
 * @copyright Copyright (c) 2021 深圳市酷瓜软件有限公司
 * @license https://opensource.org/licenses/GPL-2.0
 * @link https://www.koogua.com
 */

namespace App\Http\Api\Controllers;

use App\Services\Logic\Answer\AnswerAccept as AnswerAcceptService;
use App\Services\Logic\Answer\AnswerCreate as AnswerCreateService;
use App\Services\Logic\Answer\AnswerDelete as AnswerDeleteService;
use App\Services\Logic\Answer\AnswerInfo as AnswerInfoService;
use App\Services\Logic\Answer\AnswerLike as AnswerLikeService;
use App\Services\Logic\Answer\AnswerUpdate as AnswerUpdateService;
use App\Services\Logic\Answer\CommentList as CommentListService;

/**
 * @RoutePrefix("/api/answer")
 */
class AnswerController extends Controller
{

    /**
     * @Get("/{id:[0-9]+}/info", name="api.answer.info")
     */
    public function infoAction($id)
    {
        $service = new AnswerInfoService();

        $answer = $service->handle($id);

        return $this->jsonSuccess(['answer' => $answer]);
    }

    /**
     * @Get("/{id:[0-9]+}/comments", name="api.answer.comments")
     */
    public function commentsAction($id)
    {
        $service = new CommentListService();

        $pager = $service->handle($id);

        return $this->jsonPaginate($pager);
    }

    /**
     * @Post("/create", name="api.answer.create")
     */
    public function createAction()
    {
        $service = new AnswerCreateService();

        $answer = $service->handle();

        $content = [
            'answer' => $answer,
            'msg' => '创建回答成功',
        ];

        return $this->jsonSuccess($content);
    }

    /**
     * @Post("/{id:[0-9]+}/update", name="api.answer.update")
     */
    public function updateAction($id)
    {
        $service = new AnswerUpdateService();

        $answer = $service->handle($id);

        $content = [
            'answer' => $answer,
            'msg' => '更新回答成功',
        ];

        return $this->jsonSuccess($content);
    }

    /**
     * @Post("/{id:[0-9]+}/delete", name="api.answer.delete")
     */
    public function deleteAction($id)
    {
        $service = new AnswerDeleteService();

        $service->handle($id);

        return $this->jsonSuccess(['msg' => '删除回答成功']);
    }

    /**
     * @Post("/{id:[0-9]+}/accept", name="api.answer.accept")
     */
    public function acceptAction($id)
    {
        $service = new AnswerAcceptService();

        $data = $service->handle($id);

        $msg = $data['action'] == 'do' ? '采纳成功' : '取消采纳成功';

        return $this->jsonSuccess(['data' => $data, 'msg' => $msg]);
    }

    /**
     * @Post("/{id:[0-9]+}/unaccept", name="api.answer.unaccept")
     */
    public function unacceptAction($id)
    {
        $service = new AnswerAcceptService();

        $data = $service->handle($id);

        $msg = $data['action'] == 'do' ? '采纳成功' : '取消采纳成功';

        return $this->jsonSuccess(['data' => $data, 'msg' => $msg]);
    }

    /**
     * @Post("/{id:[0-9]+}/like", name="api.answer.like")
     */
    public function likeAction($id)
    {
        $service = new AnswerLikeService();

        $data = $service->handle($id);

        $msg = $data['action'] == 'do' ? '点赞成功' : '取消点赞成功';

        return $this->jsonSuccess(['data' => $data, 'msg' => $msg]);
    }

    /**
     * @Post("/{id:[0-9]+}/like", name="api.answer.unlike")
     */
    public function unlikeAction($id)
    {
        $service = new AnswerLikeService();

        $data = $service->handle($id);

        $msg = $data['action'] == 'do' ? '点赞成功' : '取消点赞成功';

        return $this->jsonSuccess(['data' => $data, 'msg' => $msg]);
    }

}
