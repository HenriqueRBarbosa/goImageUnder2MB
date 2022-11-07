FROM golang:1.7.3 as builder
WORKDIR /app
COPY main.go .
RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o main .

FROM scratch
WORKDIR /app
COPY --from=builder /app/main .
CMD ["./main"]