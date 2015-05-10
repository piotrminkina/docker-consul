TAGS=piotrminkina/consul\:latest piotrminkina/consul\:0.5.0


build: $(TAGS)

push: build
	$(foreach tag,$(TAGS),docker push $(tag);)

test: build
	docker build --no-cache -t "consul-test" "consul-test/"

clean:
	docker rmi -f consul-build consul-test consul
	rm consul.tar consul.done consul-build.done

$(TAGS): consul.done
	docker tag -f "consul" "$@"

consul.done: consul.tar
	docker build -t "consul" .
	touch "$@"

consul.tar: consul-build.done
	docker run --rm --read-only "consul-build" tar -c --numeric-owner opt/consul > "$@"

consul-build.done:
	docker build -t "consul-build" "consul-build/"
	touch "$@"

.PHONY: build push test clean $(TAGS)
