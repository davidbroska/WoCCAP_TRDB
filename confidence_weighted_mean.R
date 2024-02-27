# load dataset (I used the latest politics_demo.csv)
df = read.csv("input/dataset.csv")

# create weight for prediction
w = df$confidence

# scale to between 0 and 1
w01 = (w - min(w,na.rm=T)) / (max(w,na.rm=T) - min(w,na.rm=T))

# weight predictions
pred = w01 * df$prediction

# single prediction
weighted_mean = mean(pred, na.rm=T)

# write result to the output file
write(weighted_mean, file="output/result.txt")
