# 总体描述
The project aims to guide you to explore HAR in videos shot in the dark leveraging the late fusion technique. This project also aims to encourage further exploration on how image enhancement effects HAR in videos shot in the dark. You will be given a set of training data, which includes 25 random videos for each of the 6 action classes, and a set of testing/validation data. Your task is to classify the testing data into one of the 6 action classes by training a classifier and evaluate the performance of the classifier. You will be guided through a detailed guideline as listed in the following section, with steps that you are advised to follow. You are required to submit a full report of strictly no less than 4 pages in ICLR format which should demonstrate your process of exploration and answer the questions in detail that are listed in the guideline. You are also advised to observe the additional directions listed at the end of this document.

The detailed instructions and data required are attached. Please download them for this assignment.  

该项目旨在引导您利用后期融合技术探索在黑暗中拍摄的视频中的 HAR。 该项目还旨在鼓励进一步探索图像增强如何影响在黑暗中拍摄的视频中的 HAR。 您将获得一组训练数据，其中包括 6 个动作类别中每个动作类别的 25 个随机视频，以及一组测试/验证数据。 您的任务是通过训练分类器将测试数据分类为 6 个动作类别之一并评估分类器的性能。 将指导您完成以下部分列出的详细指南以及建议您遵循的步骤。 您需要提交一份不少于 4 页的 ICLR 格式的完整报告，该报告应展示您的探索过程并详细回答指南中列出的问题。 还建议您遵守本文档末尾列出的其他说明。

附有详细的说明和所需数据。 请下载它们以完成此作业。

# doc文档
Background

视频数据是最常见的数据形式之一，广泛应用于我们日常生活的各个方面。 随着视频数据的快速增长（仅 YouTube 每天就有 500 小时的视频上传），自动视频分析已成为处理这些海量视频的关键任务。 在各种视频分析任务中，人体动作识别（HAR）是基石之一，旨在自动识别（分类）人体动作。 各种大规模视频数据集的出现以及深度神经网络的不断发展极大地促进了HAR的发展，在安防监控、自动驾驶、智能家居等各个领域的应用越来越广泛。

尽管当前 HAR 研究取得了快速进展，但大多数研究旨在提高现有 HAR 数据集的性能，但受到多种因素的限制，其中之一涉及现有数据集中的视频是在无挑战性的环境下拍摄的，具有足够的照明和光照。 对比。 这导致所提出的方法具有明显的脆弱性，无法很好地推广到不利环境，包括低照度的黑暗环境。 以安全监控为例：自动化 HAR 模型可以在异常检测中发挥至关重要的作用。 然而，异常行为在夜间和黑暗环境中更为常见，而当前的HAR模型被黑暗遮挡，无法有效识别行为。 因此，非常需要探索稳健且能够应对黑暗环境的方法。

Project Description

该项目旨在引导您利用后期融合技术探索在黑暗中拍摄的视频中的 HAR。 该项目还旨在鼓励进一步探索图像增强如何影响在黑暗中拍摄的视频中的 HAR。 您将获得一组训练数据，其中包括 6 个动作类别中每个动作类别的 25 个随机视频，以及一组测试/验证数据。 您的任务是通过训练分类器将测试数据分类为 6 个动作类别之一并评估分类器的性能。 将指导您完成以下部分列出的详细指南以及建议您遵循的步骤。 您需要提交一份不少于 4 页的 ICLR 格式的完整报告，该报告应展示您的探索过程并详细回答指南中列出的问题。 还建议您遵守本文档末尾列出的其他说明。

Detailed Project Guideline

第 1 部分：步骤 1 – 帧采样。 为了执行 HAR，我们首先对视频帧进行采样，以便特征提取更加可行。 两种常见的抽样策略是均匀抽样和随机抽样。 选择任何视频作为示例，并展示不同采样策略之间的差异/相似之处。 讨论应首先考虑哪种策略。 （3分）

第 2 部分：步骤 2 – 特征提取。 通过采样的帧，我们可以获得每个视频的特征。 一种直接的方法是利用后期融合策略，我们首先获得每个采样帧的特征，并在分类器之前通过在所有采样帧上执行的池化（平均）操作来融合它们。 为了获得每个采样帧的特征，建议利用在大型数据集上训练并具有良好泛化性的预训练模型。 在获得每一帧的特征之前，应该对像素值进行归一化，使得像素值为零均值和单位标准差。 暗视频帧的参考平均值和标准偏差值为“平均值”[0.07,0.07,0.07]，“标准偏差”[0.1,0.09,0.08]。 简要描述所利用的预训练模型以及为什么选择预训练模型。 获得的特征的维度是多少。 请记住保存视频特征以便后续训练。 （3分）

第 3 部分：步骤 3 – 分类器训练和评估。 选择一个可行的分类器（例如，SVM、贝叶斯、MAP 等），并使用获得的特征和提供的标签来训练分类器。 讨论所选分类器类型的优缺点。 随后，评估训练好的分类器。 您应该对验证视频重复步骤 1 和 2，以获得其特征并使用经过训练的分类器获得其类别预测。 将预测与真实标签进行比较。 经过训练的分类器的性能如何？ （3分）

第 4 节：步骤 4 – 利用图像增强的效果。 对于我们人类来说，应用图像增强可以显着提高我们识别黑暗视频中执行的动作的能力，因为图像增强可以产生更清晰的视频帧。 我们的 HAR 模型遵循这样的直觉吗？ 应用您选择的任何图像增强功能，并探索它如何影响经过训练的分类器的性能。 请注意，正常视频帧的参考平均值和标准偏差值为“平均值”[0.485,0.456,0.406]、“标准偏差”[0.229,0.224,0.225]。 详细讨论所选的图像增强如何影响经过训练的分类器的性能。 提供图像增强产生的采样输出帧。 （6分）

第 5 节（可选）：步骤 5 – 改进 HAR 模型以实现端到端训练。 上述方法很直观，但不是端到端的，这限制了其在现实场景中的适用性。 目前，大多数 HAR 模型都是端到端设计的，不需要显式存储视频特征。 在此步骤中，您将设计或实现端到端的 HAR 模型并评估您的 HAR 模型。 详细描述您的 HAR 模型，包括结构以及培训和评估程序。 将您的 HAR 模型性能与之前训练的分类器进行比较，并讨论您的 HAR 模型的优缺点。 （额外加10分）