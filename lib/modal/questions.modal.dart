
class Question {
    int? id;
    dynamic name;
    String? title;
    String? description;
    dynamic difficultyLevel;
    String? topic;
    String? time;
    bool? isPublished;
    String? createdAt;
    String? updatedAt;
    int? duration;
    String? endTime;
    String? negativeMarks;
    String? correctAnswerMarks;
    bool? shuffle;
    bool? showAnswers;
    bool? lockSolutions;
    bool? isForm;
    bool? showMasteryOption;
    dynamic readingMaterial;
    dynamic quizType;
    bool? isCustom;
    dynamic bannerId;
    dynamic examId;
    bool? showUnanswered;
    String? endsAt;
    dynamic lives;
    String? liveCount;
    int? coinCount;
    int? questionsCount;
    String? dailyDate;
    int? maxMistakeCount;
    List<dynamic>? readingMaterials;
    List<Questions>? questions;
    int? progress;

    Question({this.id, this.name, this.title, this.description, this.difficultyLevel, this.topic, this.time, this.isPublished, this.createdAt, this.updatedAt, this.duration, this.endTime, this.negativeMarks, this.correctAnswerMarks, this.shuffle, this.showAnswers, this.lockSolutions, this.isForm, this.showMasteryOption, this.readingMaterial, this.quizType, this.isCustom, this.bannerId, this.examId, this.showUnanswered, this.endsAt, this.lives, this.liveCount, this.coinCount, this.questionsCount, this.dailyDate, this.maxMistakeCount, this.readingMaterials, this.questions, this.progress});

    Question.fromJson(Map<String, dynamic> json) {
        id = json["id"];
        name = json["name"];
        title = json["title"];
        description = json["description"];
        difficultyLevel = json["difficulty_level"];
        topic = json["topic"];
        time = json["time"];
        isPublished = json["is_published"];
        createdAt = json["created_at"];
        updatedAt = json["updated_at"];
        duration = json["duration"];
        endTime = json["end_time"];
        negativeMarks = json["negative_marks"];
        correctAnswerMarks = json["correct_answer_marks"];
        shuffle = json["shuffle"];
        showAnswers = json["show_answers"];
        lockSolutions = json["lock_solutions"];
        isForm = json["is_form"];
        showMasteryOption = json["show_mastery_option"];
        readingMaterial = json["reading_material"];
        quizType = json["quiz_type"];
        isCustom = json["is_custom"];
        bannerId = json["banner_id"];
        examId = json["exam_id"];
        showUnanswered = json["show_unanswered"];
        endsAt = json["ends_at"];
        lives = json["lives"];
        liveCount = json["live_count"];
        coinCount = json["coin_count"];
        questionsCount = json["questions_count"];
        dailyDate = json["daily_date"];
        maxMistakeCount = json["max_mistake_count"];
        readingMaterials = json["reading_materials"] ?? [];
        questions = json["questions"] == null ? null : (json["questions"] as List).map((e) => Questions.fromJson(e)).toList();
        progress = json["progress"];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["id"] = id;
        _data["name"] = name;
        _data["title"] = title;
        _data["description"] = description;
        _data["difficulty_level"] = difficultyLevel;
        _data["topic"] = topic;
        _data["time"] = time;
        _data["is_published"] = isPublished;
        _data["created_at"] = createdAt;
        _data["updated_at"] = updatedAt;
        _data["duration"] = duration;
        _data["end_time"] = endTime;
        _data["negative_marks"] = negativeMarks;
        _data["correct_answer_marks"] = correctAnswerMarks;
        _data["shuffle"] = shuffle;
        _data["show_answers"] = showAnswers;
        _data["lock_solutions"] = lockSolutions;
        _data["is_form"] = isForm;
        _data["show_mastery_option"] = showMasteryOption;
        _data["reading_material"] = readingMaterial;
        _data["quiz_type"] = quizType;
        _data["is_custom"] = isCustom;
        _data["banner_id"] = bannerId;
        _data["exam_id"] = examId;
        _data["show_unanswered"] = showUnanswered;
        _data["ends_at"] = endsAt;
        _data["lives"] = lives;
        _data["live_count"] = liveCount;
        _data["coin_count"] = coinCount;
        _data["questions_count"] = questionsCount;
        _data["daily_date"] = dailyDate;
        _data["max_mistake_count"] = maxMistakeCount;
        if(readingMaterials != null) {
            _data["reading_materials"] = readingMaterials;
        }
        if(questions != null) {
            _data["questions"] = questions?.map((e) => e.toJson()).toList();
        }
        _data["progress"] = progress;
        return _data;
    }
}

class Questions {
    int? id;
    String? description;
    dynamic difficultyLevel;
    String? topic;
    bool? isPublished;
    String? createdAt;
    String? updatedAt;
    String? detailedSolution;
    String? type;
    bool? isMandatory;
    bool? showInFeed;
    String? pyqLabel;
    int? topicId;
    int? readingMaterialId;
    String? fixedAt;
    String? fixSummary;
    dynamic createdBy;
    String? updatedBy;
    dynamic quizLevel;
    String? questionFrom;
    dynamic language;
    dynamic photoUrl;
    dynamic photoSolutionUrl;
    bool? isSaved;
    String? tag;
    List<Options>? options;
    ReadingMaterial? readingMaterial;

    Questions({this.id, this.description, this.difficultyLevel, this.topic, this.isPublished, this.createdAt, this.updatedAt, this.detailedSolution, this.type, this.isMandatory, this.showInFeed, this.pyqLabel, this.topicId, this.readingMaterialId, this.fixedAt, this.fixSummary, this.createdBy, this.updatedBy, this.quizLevel, this.questionFrom, this.language, this.photoUrl, this.photoSolutionUrl, this.isSaved, this.tag, this.options, this.readingMaterial});

    Questions.fromJson(Map<String, dynamic> json) {
        id = json["id"];
        description = json["description"];
        difficultyLevel = json["difficulty_level"];
        topic = json["topic"];
        isPublished = json["is_published"];
        createdAt = json["created_at"];
        updatedAt = json["updated_at"];
        detailedSolution = json["detailed_solution"];
        type = json["type"];
        isMandatory = json["is_mandatory"];
        showInFeed = json["show_in_feed"];
        pyqLabel = json["pyq_label"];
        topicId = json["topic_id"];
        readingMaterialId = json["reading_material_id"];
        fixedAt = json["fixed_at"];
        fixSummary = json["fix_summary"];
        createdBy = json["created_by"];
        updatedBy = json["updated_by"];
        quizLevel = json["quiz_level"];
        questionFrom = json["question_from"];
        language = json["language"];
        photoUrl = json["photo_url"];
        photoSolutionUrl = json["photo_solution_url"];
        isSaved = json["is_saved"];
        tag = json["tag"];
        options = json["options"] == null ? null : (json["options"] as List).map((e) => Options.fromJson(e)).toList();
        readingMaterial = json["reading_material"] == null ? null : ReadingMaterial.fromJson(json["reading_material"]);
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["id"] = id;
        _data["description"] = description;
        _data["difficulty_level"] = difficultyLevel;
        _data["topic"] = topic;
        _data["is_published"] = isPublished;
        _data["created_at"] = createdAt;
        _data["updated_at"] = updatedAt;
        _data["detailed_solution"] = detailedSolution;
        _data["type"] = type;
        _data["is_mandatory"] = isMandatory;
        _data["show_in_feed"] = showInFeed;
        _data["pyq_label"] = pyqLabel;
        _data["topic_id"] = topicId;
        _data["reading_material_id"] = readingMaterialId;
        _data["fixed_at"] = fixedAt;
        _data["fix_summary"] = fixSummary;
        _data["created_by"] = createdBy;
        _data["updated_by"] = updatedBy;
        _data["quiz_level"] = quizLevel;
        _data["question_from"] = questionFrom;
        _data["language"] = language;
        _data["photo_url"] = photoUrl;
        _data["photo_solution_url"] = photoSolutionUrl;
        _data["is_saved"] = isSaved;
        _data["tag"] = tag;
        if(options != null) {
            _data["options"] = options?.map((e) => e.toJson()).toList();
        }
        if(readingMaterial != null) {
            _data["reading_material"] = readingMaterial?.toJson();
        }
        return _data;
    }
}

class ReadingMaterial {
    int? id;
    String? keywords;
    dynamic content;
    String? createdAt;
    String? updatedAt;
    List<String>? contentSections;
    PracticeMaterial? practiceMaterial;

    ReadingMaterial({this.id, this.keywords, this.content, this.createdAt, this.updatedAt, this.contentSections, this.practiceMaterial});

    ReadingMaterial.fromJson(Map<String, dynamic> json) {
        id = json["id"];
        keywords = json["keywords"];
        content = json["content"];
        createdAt = json["created_at"];
        updatedAt = json["updated_at"];
        contentSections = json["content_sections"] == null ? null : List<String>.from(json["content_sections"]);
        practiceMaterial = json["practice_material"] == null ? null : PracticeMaterial.fromJson(json["practice_material"]);
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["id"] = id;
        _data["keywords"] = keywords;
        _data["content"] = content;
        _data["created_at"] = createdAt;
        _data["updated_at"] = updatedAt;
        if(contentSections != null) {
            _data["content_sections"] = contentSections;
        }
        if(practiceMaterial != null) {
            _data["practice_material"] = practiceMaterial?.toJson();
        }
        return _data;
    }
}

class PracticeMaterial {
    List<String>? content;
    List<String>? keywords;

    PracticeMaterial({this.content, this.keywords});

    PracticeMaterial.fromJson(Map<String, dynamic> json) {
        content = json["content"] == null ? null : List<String>.from(json["content"]);
        keywords = json["keywords"] == null ? null : List<String>.from(json["keywords"]);
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        if(content != null) {
            _data["content"] = content;
        }
        if(keywords != null) {
            _data["keywords"] = keywords;
        }
        return _data;
    }
}

class Options {
    int? id;
    String? description;
    int? questionId;
    bool? isCorrect;
    String? createdAt;
    String? updatedAt;
    bool? unanswered;
    dynamic photoUrl;

    Options({this.id, this.description, this.questionId, this.isCorrect, this.createdAt, this.updatedAt, this.unanswered, this.photoUrl});

    Options.fromJson(Map<String, dynamic> json) {
        id = json["id"];
        description = json["description"];
        questionId = json["question_id"];
        isCorrect = json["is_correct"];
        createdAt = json["created_at"];
        updatedAt = json["updated_at"];
        unanswered = json["unanswered"];
        photoUrl = json["photo_url"];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["id"] = id;
        _data["description"] = description;
        _data["question_id"] = questionId;
        _data["is_correct"] = isCorrect;
        _data["created_at"] = createdAt;
        _data["updated_at"] = updatedAt;
        _data["unanswered"] = unanswered;
        _data["photo_url"] = photoUrl;
        return _data;
    }
 


}

